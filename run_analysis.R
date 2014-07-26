

# UCI Har Dataset unzipped in working directory
# Read separate datasets into R
xtestdata<-read.csv("UCI Har Dataset/test/X_test.txt", sep="", header=FALSE)
ytestdata<-read.csv("UCI Har Dataset/test/y_test.txt", sep="", header=FALSE)
xtraindata<-read.csv("UCI Har Dataset/train/X_train.txt", sep="", header=FALSE)
ytraindata<-read.csv("UCI Har Dataset/train/y_train.txt", sep="", header=FALSE)

# Read features.txt into R, preparing to add them as the headers.
# features.txt lists the variable names
features<-read.csv("UCI Har Dataset/features.txt", sep="", header=FALSE)

#Read in subject data for test and train. This data shows us which subject (person) each observation of the data it is from
subjecttest<-read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
subjecttrain<-read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

#Set headers for xtestdata and xtraindata as the variables in features.txt
colnames(xtestdata)<-features[,2]
colnames(xtraindata)<-features[,2]
colnames(ytestdata)<-c("activity")
colnames(ytraindata)<-c("activity")
colnames(subjecttest)<-c("subject")
colnames(subjecttrain)<-c("subject")

#merge x and y train data
traindata<-cbind(xtraindata, ytraindata, subjecttrain)
#merge x and y test data
testdata<-cbind(xtestdata, ytestdata, subjecttest)

#merge test and train data
mergeddata<-rbind(testdata, traindata)

#changes the number of the activity to the actual activity
for (i in 1:nrow(mergeddata)) {
    if (mergeddata[i, "activity"]==1){
        mergeddata[i, "activity"]<-"WALKING"
    }
    else if (mergeddata[i, "activity"]==2){
        mergeddata[i, "activity"]<-"WALKING_UPSTAIRS"
    }
    else if (mergeddata[i, "activity"]==3){
        mergeddata[i, "activity"]<-"WALKING_DOWNSTAIRS"
    }
    else if (mergeddata[i, "activity"]==4){
        mergeddata[i, "activity"]<-"SITTING"
    }
    else if (mergeddata[i, "activity"]==5){
        mergeddata[i, "activity"]<-"STANDING"
    }
    else if (mergeddata[i, "activity"]==6){
        mergeddata[i, "activity"]<-"LAYING"
    }
}

#produce a logical vector showing TRUE if mergeddata column names are mean or standard deviations
meanstdcols<-grepl(".*(mean\\(\\)|std\\(\\)|activity|subject).*", colnames(mergeddata))

#Data of only means and standard deviations
meanstddata<-mergeddata[, meanstdcols]

#Provides only the measurements of means and standard deviations
meandatacols<-grepl(".*(mean\\(\\)|activity|subject).*", colnames(meanstddata))
meandata<-meanstddata[,meandatacols]


#Transforms the data into the averages of each measurement for each activity and each subject
library(reshape2)
melteddata<-melt(meandata, id.vars=c("activity", "subject"))
data<-dcast(melteddata, subject + activity ~ variable, mean)

#Creates the file tidydata.txt with the new data
write.table(data, "tidydata.txt")