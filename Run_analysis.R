
#STEP 1: Create filepaths for train and test data

#Test Data
filepath1 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt" #participants
filepath2 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt" #smartphone acceleration on x axis
filepath3 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt" #smartphone acceleration on y axis
filepath4 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt" #smartphone acceleration on z axis
filepath5 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"  #body acceleration on x axis
filepath6 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"  #body acceleration on y axis
filepath7 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"  #body acceleratio  on z axis
filepath8 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt" #body angular velocity on x axis
filepath9 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt" #body angular velocity on y axis
filepath10 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"#body angular velocity on z axis
filepath11 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
filepath12 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
filepath13 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"

#Create datatables of test data
library(data.table)

#Subjects
subjectest <- data.table(fread(filepath1, sep = "\t", header = F))
test_participants <- unique(subjectest$V1) # 9 participants

#Phone acceleration (x axis)
x_phone_acc <- data.table(fread(filepath2, sep = "\t", header = F))
# Verify row lengths
x_phone_acc_length <- sapply(strsplit(x_phone_acc$V1, " "), length)
barplot(table(x_phone_acc_length))
x_phone_acc_summ <- summary(x_phone_acc_length) #min: 128, max: 255

#Phone acceleration (y axis)
y_phone_acc <- data.table(fread(filepath3, sep = "\t", header = F))
# Verify row lengths
y_phone_acc_length <- sapply(strsplit(y_phone_acc$V1, " "), length)
barplot(table(y_phone_acc_length))
y_phone_acc_summ <- summary(y_phone_acc_length) #min: 128, max: 255

#Phone acceleration (z axis)
z_phone_acc <- data.table(fread(filepath4, sep = "\t", header = F))
# Verify row lengths
z_phone_acc_length <- sapply(strsplit(z_phone_acc$V1, " "), length)
barplot(table(z_phone_acc_length))
z_phone_acc_summ <- summary(z_phone_acc_length) #min: 128, max: 255

#Body acceleration (x axis)
x_body_acc <- data.table(fread(filepath5, sep = "\t", header = F))
#Verify row lengths
x_body_acc_length <- sapply(strsplit(x_body_acc$V1, " "), length)
barplot(table(x_body_acc_length))
x_body_acc_summ <- summary(x_body_acc_length) #min: 128, max: 245

#Body acceleration (y axis)
y_body_acc <- data.table(fread(filepath6, sep = "\t", header = F))
#Verify row lengths
y_body_acc_length <- sapply(strsplit(y_body_acc$V1, " "), length)
barplot(table(y_body_acc_length))
y_body_acc_sum <- summary(y_body_acc_length) #min: 129, max: 255

#Body acceleration (z axis)
z_body_acc <- data.table(fread(filepath7, sep = "\t", header = F))
#Verify row lengths
z_body_acc_length <- sapply(strsplit(z_body_acc$V1, " "), length)
barplot(table(z_body_acc_length))
z_body_acc_sum <- summary(z_body_acc_length) #min: 128, max: 253

#Body velocity (x axis)
x_body_vel <- data.table(fread(filepath8, sep = "\t", header = F))
#Verify row lengths
x_body_vel_length <- sapply(strsplit(x_body_vel$V1, " "), length)
barplot(table(x_body_vel_length))
x_body_vel_summ <- summary(x_body_vel_length) #min: 128, max: 255

#Body velocity (y axis)
y_body_vel <- data.table(fread(filepath9, sep = "\t", header = F))
#Verify row lengths
y_body_vel_length <- sapply(strsplit(y_body_vel$V1, " "), length)
barplot(table(y_body_vel_length))
y_body_vel_summ <- summary(y_body_vel_length) #min: 128, max: 255

#Body velocity (z axis)
z_body_vel <- data.table(fread(filepath10, sep = "\t", header = F))
#Verify row lengths
z_body_vel_length <- sapply(strsplit(z_body_vel$V1, " "), length)
barplot(table(z_body_vel_length))
z_body_vel_summ <- summary(z_body_vel_length) #min: 128, max: 255

#Test sets
x_test <- data.table(fread(filepath11, sep = "\t", header = F))
#Verify row lengths
x_test_length <- sapply(strsplit(x_test$V1, " "), length)
barplot(table(x_test_length))
x_test_summ <- summary(x_test_length) #min: 630, max: 798

#Coded activity types
y_test <- data.table(fread(filepath12, sep = "\t", header = F))
#Verify row lengths
unique(y_test$V1)
names(y_test) <- "activity_type"
names(y_test)

#Activity labels
test_labels <- data.table(fread(filepath13, sep = " ", header = F))
names(test_labels) <- "activity_type"
names(test_labels)

#Summary list of summary stats for each data set
test_summary_list <- list(x_phone_acc_summ, y_phone_acc_summ, z_phone_acc_summ,
                          x_body_acc_summ, y_body_acc_sum, z_body_acc_sum,
                          x_body_vel_summ, y_body_vel_summ, z_body_vel_summ,
                          x_test_summ)

#Merge test data using cbind
test_data <- as.data.table(cbind(subjectest,
                                 y_test,
                                 x_phone_acc,
                                 y_phone_acc,
                                 z_phone_acc,
                                 x_body_acc,
                                 y_body_acc,
                                 z_body_acc,
                                 x_body_vel,
                                 y_body_vel,
                                 z_body_vel,
                                 x_test))
names(test_data) <- c("subject_id", "activity_type", "x_phone_acc",
                             "y_phone_acc", "z_phone_acc", "x_body_acc",
                             "y_body_acc", "z_body_acc", "x_body_vel",
                             "y_body_vel", "z_body_vel", "x_test_sets")
names(test_data) #verify that names have been used in the merged data table

#Merge activity labels to correspond witht he activity type in the merged data table
merged_test_data <- merge(x = test_data, y = test_labels, by.x = "activity_type", 
                          by.y = "V1")

merged_test_data[, "activity_type_detailed" := V2] #rename V2 to activity_type_detailed
names(merged_test_data)
merged_test_data[, V2 := NULL] # Remove V2 column
names(merged_test_data) #Verify that names are appropriate

# Create column of means and SD for phone acceleration (x)
merged_test_data[, x_phone_acc_mu :=sapply(strsplit(x_phone_acc, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, x_phone_acc_sd :=sapply(strsplit(x_phone_acc, " "), 
                                          function(x) sd(as.numeric(x), 
                                                           na.rm = TRUE))]
# Create column of means and SD for phone acceleration (y)
merged_test_data[, y_phone_acc_mu :=sapply(strsplit(y_phone_acc, " "), 
                                           function(x) mean(as.numeric(x),
                                                            na.rm = TRUE))]

merged_test_data[, y_phone_acc_sd :=sapply(strsplit(y_phone_acc, " "), 
                                           function(x) sd(as.numeric(x), 
                                                          na.rm = TRUE))]
# Create column of means and SD for phone acceleration (z)
merged_test_data[, z_phone_acc_mu :=sapply(strsplit(z_phone_acc, " "), 
                                           function(x) mean(as.numeric(x),
                                                            na.rm = TRUE))]

merged_test_data[, z_phone_acc_sd :=sapply(strsplit(z_phone_acc, " "), 
                                           function(x) sd(as.numeric(x), 
                                                          na.rm = TRUE))]
# Create column of means and SD for body acceleration (x)
merged_test_data[, x_body_acc_mu :=sapply(strsplit(x_body_acc, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, x_body_acc_sd :=sapply(strsplit(x_body_acc, " "), 
                                          function(x) sd(as.numeric(x), 
                                                           na.rm = TRUE))]
# Create column of means and SD for body acceleration (y)
merged_test_data[, y_body_acc_mu :=sapply(strsplit(y_body_acc, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, y_body_acc_sd :=sapply(strsplit(y_body_acc, " "), 
                                          function(x) sd(as.numeric(x), 
                                                         na.rm = TRUE))]
# Create column of means and SD for body acceleration (z)
merged_test_data[, z_body_acc_mu :=sapply(strsplit(z_body_acc, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, z_body_acc_sd :=sapply(strsplit(z_body_acc, " "), 
                                          function(x) sd(as.numeric(x), 
                                                         na.rm = TRUE))]
# Create column of means and SD for body velocity (x)
merged_test_data[, x_body_vel_mu :=sapply(strsplit(x_body_vel, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, x_body_vel_sd :=sapply(strsplit(x_body_vel, " "), 
                                          function(x) sd(as.numeric(x), 
                                                           na.rm = TRUE))]
# Create column of means and SD for body velocity (y)
merged_test_data[, y_body_vel_mu :=sapply(strsplit(y_body_vel, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, y_body_vel_sd :=sapply(strsplit(y_body_vel, " "), 
                                          function(x) sd(as.numeric(x), 
                                                         na.rm = TRUE))]
# Create column of means and SD for body velocity (z)
merged_test_data[, z_body_vel_mu :=sapply(strsplit(z_body_vel, " "), 
                                          function(x) mean(as.numeric(x),
                                                           na.rm = TRUE))]

merged_test_data[, z_body_vel_sd :=sapply(strsplit(z_body_vel, " "), 
                                          function(x) sd(as.numeric(x), 
                                                         na.rm = TRUE))]

# Create column of means and SD for test sets
merged_test_data[, x_test_sets_mu :=sapply(strsplit(x_test_sets, " "),
                                           function(x) mean(as.numeric(x),
                                                            na.rm = TRUE))]

merged_test_data[, x_test_sets_sd :=sapply(strsplit(x_test_sets, " "),
                                           function(x) sd(as.numeric(x),
                                                          na.rm = TRUE))]

#Reorder columns in merged data table with new variables
setcolorder(merged_test_data,neworder = c("subject_id", "activity_type",
                                          "activity_type_detailed", "x_phone_acc",
                                          "x_phone_acc_mu", "x_phone_acc_sd",
                                          "y_phone_acc", "y_phone_acc_mu", 
                                          "y_phone_acc_sd","z_phone_acc", 
                                          "z_phone_acc_mu","z_phone_acc_sd", 
                                          "x_body_acc","x_body_acc_mu", "x_body_acc_sd",
                                          "y_body_acc","y_body_acc_mu", "y_body_acc_sd",
                                          "z_body_acc", "z_body_acc_mu", "z_body_acc_sd",
                                          "x_body_vel","x_body_vel_mu", "x_body_vel_sd",
                                          "y_body_vel", "y_body_vel_mu", "y_body_vel_sd",
                                          "z_body_vel", "z_body_vel_mu", "z_body_vel_sd",
                                          "x_test_sets"))

#Determine mean and sd based on activity type

# Mean and SD of Phone Acceleration based on Acitity Type
merged_test_data[,mean(x_phone_acc_mu), keyby=V2]
merged_test_data[,sd(x_phone_acc_sd), keyby=V2]

# Mean and SD of Body Acceleration based on Activity Type
merged_test_data[,mean(x_body_acc_mu), keyby=V2]
merged_test_data[,sd(x_body_acc_sd), keyby=V2]

# Mean and SD of Body Acceleration based on Activity Type
merged_test_data[,mean(x_body_vel_mu), keyby=V2]
merged_test_data[,sd(x_body_vel_sd), keyby=V2]

#Train Data"
filepath4 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
filepath5 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
filepath6 <- "C:/Users/samuel.baird/OneDrive - Cardinal Health/Documents/R Programming/Course3_Quiz_Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"


#STEP 2: Create data tables of file path objects

#Test Data
library(data.table)
subjectest <- data.table(fread(filepath1, sep = "\t", header = F))
xtest <- data.table(fread(filepath2, sep = "\t", header = F))
ytest <- data.table(fread(filepath3, sep = "\t", header = F))

#Train Data
subjectrain <- data.table(fread(filepath4, sep = "\t", header = F))
xtrain <- data.table(fread(filepath5, sep = "\t", header = F))
ytrain <- data.table(fread(filepath6, sep = "\t", header = F))

#STEP 2: Merging data tables

#Merged Testing Data
merged_test_data <- as.data.table(cbind(subjectest, 
                                        ytest, 
                                        xtest))
names(merged_test_data) <- c("subject_test_id", "activity_test_type", "test_input")
names(merged_test_data)
sapply(merged_test_data, class)

# Verify the number of values in each row for test input
sapply(strsplit(merged_test_data$test_input, " "), length)
sapply(strsplit(merged_train_data$train_input, " "), length)

# Add average column of xtest
merged_test_data[, test_input_mu :=sapply(strsplit(test_input, " "), 
                                           function(x) mean(as.numeric(x), 
                                                            na.rm = TRUE))]

#Merged Training Data
merged_train_data <- as.data.table(cbind(subjectrain, 
                                        ytrain, 
                                        xtrain))

names(merged_train_data) <- c("subject_train_id", "activity_train_type", "train_input")
names(merged_train_data)
sapply(merged_train_data, class)

#Change classes so mean and sd can be analyzed
#merged_train_data[, `:=`(
  #train_input = as.numeric(train_input),
  #activity_train_type = as.numeric(activity_train_type),
  #subject_train_id = as.numeric(subject_train_id)
#)]
#sapply(merged_train_data, class)

# Add average column of xtrain
merged_train_data[, train_input_mu :=sapply(strsplit(train_input, " "), 
                                          function(x) mean(as.numeric(x), 
                                                           na.rm = TRUE))]

# Add sd column of xtrain
merged_train_data[, train_input_sigma :=sapply(strsplit(train_input, " "), 
                                            function(x) sd(as.numeric(x), 
                                                             na.rm = TRUE))]

laying_mu <- mean(merged_train_data[activity_train_type == "6", train_input_mu])
standing_mu <- mean(merged_train_data[activity_train_type == "5", train_input_mu])
sitting_mu <- mean(merged_train_data[activity_train_type == "4", train_input_mu])
walking_downstairs_mu <- mean(merged_train_data[activity_train_type == "3", train_input_mu])
walking_upstairs_mu <- mean(merged_train_data[activity_train_type == "2", train_input_mu])
walking_mu <- mean(merged_train_data[activity_train_type == "1", train_input_mu])

barChart(laying_mu,standing_mu, sitting_mu, walking_downstairs_mu, walking_upstairs_mu, walking_mu)

boxplot(table(merged_train_data[,activity_train_type]))
