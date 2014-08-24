get.unpack.data <- function() {
  # Set up the data, if it's missing
  if(!file.exists("UCI HAR Dataset")) {
    if(file.exists("data.zip")) {
      unzip("data.zip")
    } else {
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip",method="curl")
    }
  }
}

run_analysis <- function() {
  get.unpack.data()
  # Move into the data dir
  setwd("UCI HAR Dataset")
  # Read in the labels for activities and features
  activity_labels <- read.table("activity_labels.txt",col.names=c("anr","activity"))
  feature_labels <- read.table("features.txt",col.names=c("fnr","feature"))
  # Read in the base training and test data, using the feature labels
  # Feature labels will be encoded as "R safe" to be used as column names
  train.raw <- read.table("train/X_train.txt",col.names=feature_labels$feature)
  test.raw <- read.table("test/X_test.txt",col.names=feature_labels$feature)
  # Add in the subject and activity factors
  train.raw$subject <- factor(unlist(readLines("train/subject_train.txt")))
  train.raw$activity.raw <- factor(unlist(readLines("train/y_train.txt")))
  test.raw$subject <- factor(unlist(readLines("test/subject_test.txt")))
  test.raw$activity.raw <- factor(unlist(readLines("test/y_test.txt")))
  # Add a column that translates raw activities into meaningful labels
  train.raw$activity <- sapply(train.raw$activity.raw, function(x) activity_labels[[x,"activity"]])
  test.raw$activity <- sapply(test.raw$activity.raw, function(x) activity_labels[[x,"activity"]])
  # grep for ".mean." and ".std." -- This gives us just means and standard
  # deviations from the column names. Train and test have the same columns.
  colNums <- grep("\\.mean\\.|\\.std\\.",names(train.raw))
  colNames <- c("subject","activity",names(train.raw)[colNums])
  # rbind train and test sets, while pulling over only the columns we want
  tidySet <- rbind(train.raw[,colNames],test.raw[,colNames])
  # Create a subject.activity column
  tidySet$subject.activity <- paste(tidySet$subject,tidySet$activity,sep=".")
  # Get the column names we want to take averages for for the final data set
  dataNames <- setdiff(names(tidySet),c("subject","activity","subject.activity"))
  # Create our final data frame
  final <- data.frame(sapply(dataNames,function(x) tapply(tidySet[,x],tidySet$subject.activity,mean)))
  setwd("..")
  write.table(final,file="final.txt")
}
