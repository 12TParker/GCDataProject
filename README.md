==================================================================
Human Activity Recognition Using Smartphones - Average Mean and Std Dev measurements by activity and subject
==================================================================
Original Data Source:
Human Activity Recognition using Smartphones Dataset
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Description of analysis code:
=====================================
1. Reads all data sets and labels:  read.table was used to read all required data sets into data tables
2. Adds column names to subject, activity, test and train data sets
3. Combines subject and activity fields with test and train data sets using cbind
4. Combines test and train data sets into one data frame using rbind
5. Identifies the mean and standard deviation measurements in the combined data set
6. Creates a subset data set with just the subject, activity and mean and standard deviation measurements
7. Adds descriptive activity names to the data set 
8. Cleans the column names of the data set removing empty brackets, hyphens and replacing them with colons.
9. Flatten data set in order to calculate mean value of each measurement 
10. Creates second tidy dataset with mean calculated for each variable for each activity and subject combination.
11. Changes column names of measurements. (Add "AVG:" to each)
12. Generate text file output of final data set using write.table. File is output to the working directory and named "final_means.txt"

To view the output data set:
======================================
Use read.table("final_means.txt") to read the data set into R.


For each record it is provided:
======================================
(see details of each in the codebook)
- An activity label. 
- An identifier of the subject who carried out the experiment.
- A 66-feature vector with average time and frequency domain variables for each activity and each subject


