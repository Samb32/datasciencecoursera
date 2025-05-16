
# UCI HAR Dataset Analysis

This project involves processing and analyzing the UCI HAR Dataset by computing 
summary statistics for test and training data, merging activity labels, and 
organizing the data into tidy formats.

## Steps Involved

### Step 1: Create File Paths for Test and Training Data
- Define file paths for various test and training data files including 
  participant data, smartphone acceleration data (x, y, z axes), body 
  acceleration data (x, y, z axes), body angular velocity data (x, y, z axes), 
  and activity labels.

### Step 2: Create Data Tables of Test and Training Data
- Use the `data.table` library to read the data from the defined file paths and 
  create data tables for subjects, phone acceleration, body acceleration, body 
  velocity, test sets, and coded activity types.

### Step 3: Merge Test and Training Data
- Merge the test and training data using `cbind` to combine the data tables into
  a single data table for test and training data respectively.

### Step 4: Merge Activity Labels
- Merge the activity labels to correspond with the activity type in the merged 
  data tables.

### Step 5: Create Mean and Standard Deviation Columns
- Compute the mean and standard deviation for phone acceleration (x, y, z axes),
  body acceleration (x, y, z axes), body velocity (x, y, z axes), and test sets.
- Add these computed columns to the merged data tables.

### Step 6: Create Additional Data Table with Mean Values
- Create an additional data table with mean values for each subject and activity 
  type.

## Summary Statistics
- Summary statistics are computed for each data set including phone 
  acceleration, body acceleration, body velocity, and test sets.
- The summary statistics include minimum, maximum, mean, and standard 
  deviation values.

## Libraries Used
- `data.table`: For efficient data manipulation and analysis.

## File Paths
- The file paths for the test and training data are defined in the script.

## Data Tables
- Data tables are created for subjects, phone acceleration, body acceleration, 
  body velocity, test sets, and coded activity types.

## Merging Data
- The test and training data are merged using `cbind`.
- Activity labels are merged to correspond with the activity type in the merged 
  data tables.

## Computation of Mean and Standard Deviation
- Mean and standard deviation are computed for phone acceleration, 
  body acceleration, body velocity, and test sets.
- These computed columns are added to the merged data tables.

## Additional Data Table with Mean Values
- An additional data table is created with mean values for each subject and 
  activity type.

## Conclusion
This project provides a comprehensive analysis of the UCI HAR Dataset by 
computing summary statistics, merging activity labels, and organizing the data 
into tidy formats. The resulting data tables can be used for further analysis 
and modeling.
