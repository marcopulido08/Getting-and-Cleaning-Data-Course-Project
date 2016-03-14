Getting and Cleaning Data Course Project CodeBook

The original data was put into individual data frames with the same names as the original source files.
We then proceeded to combine the X_data using rbind commands, create new files which contained all the X data,
all the y data, all the subjects and all the activities.

We then proceeded to create one huge table in which all the data was combined. We added the column names from the features files, and
added also column titles to the subject and activity.

We then proceeded to sort the data using the subject and then the activity, that way, we could have subject 1, and all the entries for
activity 1, etc.

We then created the first tidy_data data frame when we removed all the columns except those that contained the string "mean", and "std".
These were the columns that we wanted to keep for further analysis.

Finally, we took that data set and averaged the entries per activity and per subject, which condensed the table to something more amangeable.
The last step was to save this file into the working directory.

Variable Description

The original data contains a list describing all the variables, which correspond to measurements gathered by the acceleroemter and
gyroscope for different activities.

Below we have a condensed list of all the measurements where X,Y,Z suffix indicates that there are three measurements for this category.

tBodyAccXYZ
tGravityAccXYZ
tBodyAccJerkXYZ
tBodyGyroXYZ
tBodyGyroJerkXYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccXYZ
fBodyAccJerkXYZ
fBodyGyroXYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The only columns of data that we kept as required by the project were those related to the MEAN and STANDARD DEVIATION.
