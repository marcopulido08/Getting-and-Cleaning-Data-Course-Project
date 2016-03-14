# The code below performs the necessary steps as described in the project page.
# We check to see if the destination folder exists, if not we created and the download the data
# from the link provided in the class.

if (!file.exists("./UCI HAR Dataset")) {
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
      "getdata-projectfiles-UCI HAR Dataset.zip", mode="wb")
     }
     ## unzip the file if the directory doesn't already exist
     unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# The following section calls the libraries that we use in the program.

library(dplyr)
library(tidyr)

# The following section creates data frames for all the relevant data from the project.
# Each individual file provided in the downloaded data has a corresponding data frame with the same name.

X_train = read.table("./UCI Har Dataset/train/X_train.txt")
y_train = read.table("./UCI Har Dataset/train/y_train.txt")
subject_train = read.table("./UCI Har Dataset/train/subject_train.txt")
X_test = read.table("./UCI Har Dataset/test/X_test.txt")
y_test = read.table("./UCI Har Dataset/test/y_test.txt")
subject_test = read.table("./UCI Har Dataset/test/subject_test.txt")
activity_labels = read.table("./UCI Har Dataset/activity_labels.txt")
features = read.table("./UCI Har Dataset/features.txt")
#
# We add the rows of the X_test file to the X_train file and store in a new variable
#
X_all_data <- rbind(X_train, X_test)
#
# We add the rows of the y_test file to the y_train file and store in a new variable
#
y_all_data <- rbind(y_train, y_test)
#
# We add the rows of the subject_test file to the subject_train file and store in a new variable
#
all_subjects <- rbind(subject_train, subject_test)
#
# We now combine all the data into one big data frame
#
all_data <- cbind(all_subjects, y_all_data, X_all_data)
#
# We add the names to the columns of data using the features.txt information
# 
colnames(all_data) <- c("subject", "activity", as.character(features[,2]))
#
#
# 
strings <- c('subject', 'activity','mean', 'std')
#
# This command removes all the columns which do not contain the string "mean" or "std"
#
clean_data <- all_data[,grepl(paste0(strings,collapse="|"),colnames(all_data))]
#
#
colnames(clean_data) <- gsub("\\(|\\)|-|,", "", colnames(clean_data))

clean_data <- arrange(clean_data, subject, activity)

tidy_data <- clean_data
tidy_data$activity[tidy_data$activity == 1] <- "Walking"
tidy_data$activity[tidy_data$activity == 2] <- "Walking_Upstairs"
tidy_data$activity[tidy_data$activity == 3] <- "Walking_Downstairs"
tidy_data$activity[tidy_data$activity == 4] <- "Sitting"
tidy_data$activity[tidy_data$activity == 5] <- "Standing"
tidy_data$activity[tidy_data$activity == 6] <- "Laying"

#
# Now we find the mean measurement for each eactivity per user
#
tidy_data2 <- aggregate(clean_data[,], by = list(clean_data$subject, clean_data$activity),mean)
tidy_data2 <- tidy_data2[,3:81]
#
# We sort again by test subject
#

tidy_data2$activity[tidy_data2$activity == 1] <- "Walking"
tidy_data2$activity[tidy_data2$activity == 2] <- "Walking_Upstairs"
tidy_data2$activity[tidy_data2$activity == 3] <- "Walking_Downstairs"
tidy_data2$activity[tidy_data2$activity == 4] <- "Sitting"
tidy_data2$activity[tidy_data2$activity == 5] <- "Standing"
tidy_data2$activity[tidy_data2$activity == 6] <- "Laying"

tidy_data[1:10,1:10]
tidy_data2[1;10, 1:10]

# The final step is to write the tidy data set to the working directory
write.table(tidy_data2, file="./samsung_summary.txt",row.names = FALSE)
