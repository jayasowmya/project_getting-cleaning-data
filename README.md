The following files are helpful in relating the tidy data set obtained:-

- 'Tidy Data.txt' : the output data

- 'codebook.txt'  : contains all the variables used

- 'run_analysis.R': contains the code used to derive the tidy data from the original source.


Description:

Initially raw data was collected from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".It contained train and test seperately.

step1: read the raw data from each txt file and store them in a data frame
step2: combine all the test data and train data seperately and then join them into one big dataframe.
step3: The above obtained data had 10299 observations and 563 variables.
step4: Extract data relevent to the variable names measured based on mean and standard deviation and store it in data frame.
step5: Add labels to the above data based on the activity and rename the variable names based on the measurement of the observation
step 6:create a tidy data set with the average of the observations based on activities.
