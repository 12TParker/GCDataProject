## Read all data sets and labels
xtrain <- read.table("X_train.txt", quote="\"")
xtest <- read.table("X_test.txt", quote="\"")
ytest <- read.table("y_test.txt", quote="\"")
ytrain <- read.table("y_train.txt", quote="\"")
stest <- read.table("subject_test.txt", quote="\"")
strain <- read.table("subject_train.txt", quote="\"")
features <- read.table("features.txt", quote="\"") 
## Add Colnames to data sets
colnames(stest) <- "subject"
colnames(strain) <- "subject"
colnames(xtrain) <- features[,2]
colnames(xtest) <- features[,2]
colnames(ytest) <- "activity"
colnames(ytrain) <- "activity"
## Combine subject and activity fields with test and training observations
test <- cbind(stest, ytest, xtest)
train <- cbind(strain, ytrain, xtrain)
## Combine test and train data sets into one data frame
allraw <- rbind(test, train)
## Extract only mean and std deviation measurements
extractCols <- grep("-mean\\(\\)|std", names(allraw))
extractsub <- c(1, 2, extractCols)
x <- length(allraw)
keepcols <- 1 %in% extractsub
for(i in 2:x)  
{
  keepcols <- c(keepcols, i %in% extractsub)
}
finaldata <- subset(allraw,,keepcols)
## Add descriptive activity names to the data set
activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
actlist <- finaldata[,2]
actnames <- gsub("1", activities[1], actlist)
for(i in 2:6)
{
  actnames <- gsub(i, activities[i], actnames)
}
finaldata[,2] <- actnames
##Clean the column names of the data set
names <- colnames(finaldata)
namesclean <- gsub("\\(\\)","", names)
namesclean <- gsub("-", ":", namesclean)
colnames(finaldata) <- namesclean
##Create second dataset with mean for each variable for each activity and subject
gooey <- melt(finaldata, id.vars=c("activity","subject"))
finalmeans<- cast(data=gooey, fun=mean)
namelist <- colnames(finalmeans)
y <- length(namelist)
for(i in 3:y)
{
  namelist[i] <- paste0("AVG:",namelist[i])
}
colnames(finalmeans) <- namelist    
write.table(finalmeans, "final_means.txt", sep = "\t")
