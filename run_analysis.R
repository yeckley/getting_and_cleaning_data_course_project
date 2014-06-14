# This code produces tidy data for the JHU-Coursera course Getting and Cleaning Data
library(reshape2)

# Read data files and initialize objects
con <- file("UCI HAR Dataset/train/X_train.txt","r"); readLines(con) -> xtrainraw; close(con)
con <- file("UCI HAR Dataset/test/X_test.txt","r"); readLines(con) -> xtestraw; close(con)
ytrain <- read.csv("UCI HAR Dataset/train/y_train.txt", header = F)
ytest <- read.csv("UCI HAR Dataset/test/y_test.txt", header = F)
subjtrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = F)
subjtest <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = F)
features <- read.csv("UCI HAR Dataset/features.txt", sep = " ", 
                     header = F, stringsAsFactors = F, col.names = c("code","desc"))
actlabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = " ", 
                     header = F, stringsAsFactors = F, col.names = c("code","desc"))
xtrain <- data.frame()
xtest <- data.frame()

# create a function to split each line into numeric values
conditionXline <- function(x) { as.numeric(unlist(strsplit(x,"[ ]+"))) }

# Merges the training and the test sets to create one data set.
## for each observation test and train, run the conditionXline function. 
## Conveniently, the first element in each conditioned line is N/A. 
## That gets set to either test or train.
for (i in seq_along(xtestraw)) { 
    xtest <- rbind(xtest,conditionXline(xtestraw[i])); xtest[i,1] <- "test" 
}        
for (i in seq_along(xtrainraw)) { 
    xtrain <- rbind(xtrain,conditionXline(xtrainraw[i])); xtrain[i,1] <- "train" 
}        

## add subject and activity columns to measurement data
xtest <- cbind(ytest,xtest)
xtest <- cbind(subjtest,xtest)
xtrain <- cbind(ytrain,xtrain)
xtrain <- cbind(subjtrain,xtrain)

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
## assign descriptive variable names
names(xtrain) <- c("subject","actcode","set",features$desc)
names(xtest) <- c("subject","actcode","set",features$desc)

## merge test and training sets, which are still distinguisable by the set flag
xmerged <- rbind(xtest,xtrain)

## replace activity code number with descriptive value
actlabels$desc <- tolower(actlabels$desc) # lowercase labels for consistency
lookupactdesc <- function(actcode) { actlabels[actcode,]$desc }
xmerged$actcode <- lookupactdesc(xmerged$actcode)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
sumstats <- xmerged[,c("subject","actcode","set",grep("-std[(]|mean[(]",names(xmerged),value=T))]


# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject.
## melt the set by subject, activity code and set. Then recast. I'm keeping set (training vs test)
## in this tidy set, because I suspect the follow-on analysis may need to differentiate between
## them.
molten.set <- melt(sumstats, id=c("subject","actcode","set"))
tidy.means <- dcast(molten.set, set + subject + actcode ~ variable, mean)

# Write a file containing the required tidy data set of means for std and mean variables
write.csv(tidy.means, file = "motion_sensor_means_and_stds.txt")
