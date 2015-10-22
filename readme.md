#ReadMe
## Introduction
This repo contains code to satisfy the requirements of Getting and Cleaning Data class project.  The goal of the project is to prepare tidy data from a source data set that can be used in later analysis.

## The Tidy Data set
Using the
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
as input, the functions in this repo produce a reduced data set (a data.frame object) that contain the means of training and test experiments.  As per the assignment instructions, the observations of  mean and standard deviation of various experimental variables (called "features" in the source data set) are averaged across each subject and each activity.

The code book (codebook.md) in this repo describes the variables in the data set.

## Usage
The function run_analysis returns a data.frame object that is the "Tidy Data" that the class project requires. To invoke do the following:

```
        td <- run_analysis()
```

Optionally, to write the data to a file, do the following:

```
        write.table(td, file="tidydata.txt", row.names=F)
```

The code assumes the source dataset zipfile has been downloaded and unzipped into the current working directory.  After unzipping, there should exist a directory named "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset" in the current working directory.

To load the code into the current workspace:

```
        source('run_analysis.R')
        source('getHARdata.R')
        source('fname2colname.R')
```

## Implementation
The run_analysis function is essentially a wrapper that invokes some lower level functions to create the tidy data. Each function is described below.

1. run_anlysis()

        + gets the test and training data sets
        + consolidates across experiments computing the mean across test subject and activity
        + outputs the tidy data set

2. getHARdata()

        + fetches the training or the test dataset
        + determines the columns of interest (the mean and stddev features)
        + adds columns to designate which data set, test subject and activity
        + returns the resulting data.frame

3. fname2colname()

        + fixes up the feature names to make them suitable column names

## Source Data
The source data can be obtained from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 