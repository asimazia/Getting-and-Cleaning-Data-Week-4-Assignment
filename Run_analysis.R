install.packages("dplyr")
library(dplyr)
#To download data files
#To create a data directory
if(!file.exists("./data")){dir.create("./data")}
#zip file location
zip_file_location <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download zipfile
zipfile <- download.file(zip_file_location, "./data/Dataset.zip", mode = "wb")
#To unzip the data file
unzip(zipfile="./data/Dataset.zip",exdir="./data")
# To check the zip file that has been unzipped
list.files("./Data")
#define the path where the folder has been unziped
pathdata = file.path("./Data", "UCI HAR Dataset")
files = list.files(pathdata, recursive=TRUE)
#show the list of files in folder
files
# reading train data 
xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)
# reading test data
xtest = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)
# reading feature data
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)
# reading activity labels data
activitylabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)
# 1. To merge the training and the test sets to create one data set
xtotal <- rbind(xtrain, xtest)
ytotal <- rbind(ytrain, ytest)
subtotal <- rbind(subject_train, subject_test)
# 2. To extract only the measurements on the mean and standard deviation for each measurement.
selected_var = features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
xtotal <- xtotal[,selected_var[,1]]
# 3. Uses descriptive activity names to name the activities in the data set
colnames(ytotal) <- "activity"
ytotal$activitylabel <- factor(ytotal$activity, labels = as.character(activitylabels[,2]))
activitylabel <- ytotal[,-1]
# 4. Appropriately labels the data set with descriptive variable names.
colnames(xtotal) <- features[selected_var[,1],2]
# 5. From the data set in step 4, creating independent tidy dataset.
colnames(subtotal) <- "subject"
total <- cbind(xtotal, activitylabel, subtotal)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(list(mean))
write.table(total_mean, file = "./data/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)