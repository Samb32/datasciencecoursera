#############################Load in Data#######################################
#Create filepath object for ease when creating dt.
filepath <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/datasciencecoursera/Reproducible/repdata_data_activity/activity.csv"

#load in data.table package
library(data.table)

#create data table by using filepath object
dt <- fread(file = filepath)

#examine structure of the data
str(dt) #NA values in steps

#############################Create histogram of steps##########################

#Remove NA values fom Steps 
dt <- dt[!is.na(steps),] 
dt[is.na(steps), .N] #Confirm no NA values in steps

#Load in ggplot for plotting 
library(ggplot2) 

#Create histogram of the data for Steps per Day
ggplot(data = dt, #data is dt
       mapping = aes(x = steps) #x-axis is steps, no y required
       ) +
  geom_histogram(binwidth = 20, #create a histogram with 20 binwidth
                   color = "black", #outline of bars is black
                 fill = "steelblue" #fill in bars color
                 ) +
  labs(title = "Histogram of Steps Taken per Day", #Title of histogram
       x = "Steps per Day", #title of x-axis
       y = "Frequency" #title of y-axis
       ) +
  theme_minimal() #theme of plot

#############################Mean and median steps per day######################

mean_steps_day <- dt[, mean(steps), date] #Mean steps per day(date)
mean_steps_day #print table
median_steps_day <- dt[, median(steps), date] #Median steps per day(date)
median_steps_day #print table

#############################Time series plot:average steps taken per day#######

#Rename V1 in mean_steps_day to "Steps" for interpretability
setnames(x = mean_steps_day, old = "V1", new = "Steps")

# Plot data object of average steps per day
ggplot(data = mean_steps_day, #data is from mean_steps_day
       mapping = aes(x = date, #x-axis is date
                     y = Steps) #y-axis is Steps
       ) +
  geom_line() + #Create line plot
  geom_point() + #Add points for 
  labs(title = "Daily Average Steps", #Add titles
                      x = "Date",
                      y = "Average Steps"
                      ) +
  theme_minimal() #add theme

#############################5-min int mean max steps###########################

#create object mean steps by interval 
mean_steps <- dt[, mean(steps), interval] 
max_mean_steps <- mean_steps[which.max(V1)] #Row 835 = 206.1698

#############################Histogram of Steps with Imputation#################

#reread data table in with missing values included
dt2 <- fread(input = filepath)

is.na(dt2) #Examine where there are missing values: Steps
dt2[, class(steps)] #steps are integer class, use Euclidean distance to impute
dt2[is.na(steps), .N]#2304 missing values in steps

#since we know the median is 0, we will use mean imputation

#Impute missing values in column 'A' with its mean
dt2$steps[is.na(dt2$steps)] <- mean(dt2$steps, na.rm = TRUE)

steps_per_day <- dt2[, steps, date]
ggplot(data = steps_per_day, mapping = aes(x = steps)) +
  geom_histogram(colour = "black", 
                 fill = "steelblue") +
  labs(title = "Histogram of Steps per day with Imputed Data",
       x = "Steps per day",
       y = "Frequency") +
  theme_minimal()

#############################Average Steps by Weekend/Weekday###################

#Name the dates as weekdays and create column
dt2[, Weekdays := weekdays(date)]

#Create Weekend column where if Sat or Sun are included in Weekday column, then Weekend
dt2[, Weekends := ifelse(Weekdays %in% c("Saturday", "Sunday"), 
                         yes = "Weekend", 
                         no = "Weekday")]

#Plot Weekend and Weekday average steps by 5 minute intervals 
ggplot(data = dt2, mapping = aes(x = interval, 
                                 y = steps)) +
         stat_summary(fun = mean, 
                      geom = "point") +
         stat_summary(fun = mean, 
                      geom = "line") + 
         theme_minimal() +
  facet_wrap(~Weekends) + 
  labs(title = "Average Steps by Weekend or Weekday", 
       x = "5-Minute Intervals",
       y = "Average Steps per Day")

