# Getting-and-Cleaning-Data-Week-4-Assignment
Week 4 Assignment for Coursera
This repo was created as a part to complete the Coursera course "Getting and cleaning data." 
It is the final assignment for this course at the end of week 4.
This assignment required the following steps:
The first step, download and unzip the data file into your the R working directory.
Next step is to download the R source code into your R working directory.
Finally, execute R source code to generate a tidy data file.
Data description:
There are two data sets X and Y. The variables in the data set X are sensor signals measured with the waist-mounted smartphone from 30 subjects. The variable in the data set Y indicates the type of activity the participant's performed during recording.

Code explanation:
The code creates a file directory and downloads and unzips all the data files in this directory. It then combines both test and training datasets and extracts particular variables to create another dataset with the averages of each variable for each activity. The new data set contains variables calculated based on the mean and standard deviation.

The code was written based on the instructions provided for this assignment that is as follows:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
