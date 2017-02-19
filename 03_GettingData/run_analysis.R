## Clear workspace
rm(list = ls())

## TASK 1
## Merge the training and the test sets to create one data set.

## Column bind data for training data set
#filename = "train/subject_train.txt"
filename = "subject_train.txt"
subjectdf = read.table(filename)
names(subjectdf)[1] = "subject"
#filename = "train/y_train.txt"
filename = "y_train.txt"
labeldf = read.table(filename)
names(labeldf)[1] = "label"
train1 = cbind(subjectdf, labeldf)
#filename = "train/X_train.txt"
filename = "X_train.txt"
featuresdf = read.table(filename)
train2 = cbind(train1, featuresdf) ## 7352 rows, 563 cols

## Column bind data for test data set
#filename = "test/subject_test.txt"
filename = "subject_test.txt"
subjectdf = read.table(filename)
names(subjectdf)[1] = "subject"
#filename = "test/y_test.txt"
filename = "y_test.txt"
labeldf = read.table(filename)
names(labeldf)[1] = "label"
test1 = cbind(subjectdf, labeldf)
#filename = "test/X_test.txt"
filename = "X_test.txt"
featuresdf = read.table(filename)
test2 = cbind(test1, featuresdf) ## 2947 rows, 563 cols

## row bind train and test data sets
traintest = rbind(train2, test2) ## 10299 rows, 563 cols

## TASK 2
## Extract only the measurements on the mean and 
## standard deviation for each measurement.

## Extract the feature names
filename = "features.txt"
featuredf = read.table(filename)
featurevec = featuredf$V2
## Get columns with the word "mean" in them
meanvec = grep("mean", featurevec)
meanvecvalue = grep("mean", featurevec, value = TRUE)
## Get columns with the word "meanFreq" in them because
## we do not want to include those
meanfreqvec = grep("meanFreq", featurevec)
meanfreqvecvalue = grep("meanFreq", featurevec, value = TRUE)
## Get rid of columns with the word "meanFreq" in the column name
meanvec2 = meanvec[!meanvec %in% meanfreqvec]
meanvecvalue2 = meanvecvalue[!meanvecvalue %in% meanfreqvecvalue]

## Get columns with the word "std" in them
stdvec = grep("std", featurevec)
stdvecvalue = grep("std", featurevec, value = TRUE)

## Combine the mean and standard deviation columns
meanstdvec = c(meanvec2, stdvec)
meanstdvecvalue = c(meanvecvalue2, stdvecvalue)

## Make a function which replaces the leading "t" with "time"
## and "f" with "freq" to make the feature names clearer
tfreplace = function(x) {
  if (substr(x,1,1)=="t") {
    paste0("time", substring(x,2))
  }
  else if (substr(x,1,1)=="f") {
    paste0("freq", substring(x,2))
  }
  else {
    x
  }
}

## Rename the column names so the leading characters are "time"
## or "freq"
meanstdvecvalue2 = sapply(meanstdvecvalue, tfreplace)

## Make a function which gets rid of the brackets "()"
bracketremove = function(x) {
  gsub('\\(\\)','', x)
}

## Get rid of brackets "()" from column names
meanstdvecvalue3 = sapply(meanstdvecvalue2, bracketremove)

## Replace "std" with "standarddeviation" for clarity
stdremove = function(x) {
  gsub('std','standarddeviation', x)
}

meanstdvecvalue4 = sapply(meanstdvecvalue3, stdremove)

## Make a data frame with the column name locations
## and the column names set to lower case
meanstddf = data.frame(index = meanstdvec, 
                       value = tolower(meanstdvecvalue4))
## Reorder the variable names to the original order
meanstddf = meanstddf[order(meanstddf$index),]
## Add the character "V" to the numerical column index
## to get ready to replace the variable names in the traintest data
myvars = paste("V", meanstddf$index, sep="")
## Add in the variable names "subject" and "label"
myvars = c(myvars, "subject", "label")

## Subset the data to just get the variables of mean or
## standard deviation, and the subject and label
traintestsub = traintest[myvars]

## TASK 3
## Uses descriptive activity names to name the activities 
## in the data set.

filename = "activity_labels.txt"
activitydf = read.table(filename)
activitydf$V2 = as.character(activitydf$V2)
## Replace the numerical activity label with more descriptive string
for (i in 1:nrow(traintestsub)) {
  traintestsub$label[i] = activitydf[traintestsub$label[i], 2]
}

## TASK 4
## Appropriately labels the data set with descriptive variable names.
library(data.table)
setnames(traintestsub, old = names(traintestsub), 
         new = c(as.character(meanstddf$value), "subject", "activity"))

## TASK 5
## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each 
## variable for each activity and each subject.
write.table(traintestsub, "tidydata.txt", row.name = FALSE)