# Tidy Dataset Code Book

## Reading the data
Assuming the data is in the text file TidyData.txt in the current working directory, use the following to read it into the current R workspace:
```
        td <- read.table("TidyData.txt", header = T)
```
this will produce a data.frame object with 180 rows (30 test subjects each with 6 activities) and 68 columns described below.

## Data Reduction

### Input Data
Each record in the input data set represents an activity performed by a test subject.  There are 30 total test subjects performing any of six activities. Each record is a vector of 561 observations of gyroscopic and accelerometer measurements and descriptive information (e.g. mean, standard deviation, max, min, kurtosis, etc) on the measurements. The elements of the observation vector are called "Features" in the input data set.  A given test subject may perform a given activity on multiple occasions, producing a dataset (combined across the test and training data) of over ten thousand records.

### Output Data and Reduction
The requirements of this assignment called for extracting the mean and standard deviation measurements from the 10000+ input records and calculating and returning the average (mean) for each combination of test subject and activity.  The resulting (tidy) data set contains 30x6=180 records.

Within the Features of the observation vector, 66 of the 561 were observations of the mean or standard deviation of a collection of measurements.  THese Features were the columns extracted from the input data and summarized in the output tidy data.  Thus the resulting tidy data frame contains 68 columns: the first two identify the test subject and activity, the remaining 66 are the mean and standard deviations variables.

The data was reduced by calculating the mean value across the instances of (subject, activity) pairs.  In R, the following code accomplished the data reduction:

```
reduced_data <- aggregate(x=merged_data, by=list(merged_data$subject, merged_data$actvity), mean)
```

## Column Names

The table below presents the columns that appear in the tidy dataset produced by this code.

Column Number | Column Name | Meaning
------------- | ----------- | -------
1             | subject     | integer, identifier of the test subject
2             | activity    | character, activity under test
3              | f1_tBodyAcc_mean_X             |Feature 1 tBodyAcc-mean()-X in original dataset
4              | f2_tBodyAcc_mean_Y             |Feature 2 tBodyAcc-mean()-Y in original dataset
5              | f3_tBodyAcc_mean_Z             |Feature 3 tBodyAcc-mean()-Z in original dataset
6               | f4_tBodyAcc_std_X              |Feature 4 tBodyAcc-std()-X in original dataset
7               | f5_tBodyAcc_std_Y              |Feature 5 tBodyAcc-std()-Y in original dataset
8               | f6_tBodyAcc_std_Z              |Feature 6 tBodyAcc-std()-Z in original dataset
9          | f41_tGravityAcc_mean_X         |Feature 41 tGravityAcc-mean()-X in original dataset
10         | f42_tGravityAcc_mean_Y         |Feature 42 tGravityAcc-mean()-Y in original dataset
11         | f43_tGravityAcc_mean_Z         |Feature 43 tGravityAcc-mean()-Z in original dataset
12          | f44_tGravityAcc_std_X          |Feature 44 tGravityAcc-std()-X in original dataset
13          | f45_tGravityAcc_std_Y          |Feature 45 tGravityAcc-std()-Y in original dataset
14          | f46_tGravityAcc_std_Z          |Feature 46 tGravityAcc-std()-Z in original dataset
15        | f81_tBodyAccJerk_mean_X        |Feature 81 tBodyAccJerk-mean()-X in original dataset
16        | f82_tBodyAccJerk_mean_Y        |Feature 82 tBodyAccJerk-mean()-Y in original dataset
17        | f83_tBodyAccJerk_mean_Z        |Feature 83 tBodyAccJerk-mean()-Z in original dataset
18         | f84_tBodyAccJerk_std_X         |Feature 84 tBodyAccJerk-std()-X in original dataset
19         | f85_tBodyAccJerk_std_Y         |Feature 85 tBodyAccJerk-std()-Y in original dataset
20         | f86_tBodyAccJerk_std_Z         |Feature 86 tBodyAccJerk-std()-Z in original dataset
21          | f121_tBodyGyro_mean_X          |Feature 121 tBodyGyro-mean()-X in original dataset
22          | f122_tBodyGyro_mean_Y          |Feature 122 tBodyGyro-mean()-Y in original dataset
23          | f123_tBodyGyro_mean_Z          |Feature 123 tBodyGyro-mean()-Z in original dataset
24           | f124_tBodyGyro_std_X           |Feature 124 tBodyGyro-std()-X in original dataset
25           | f125_tBodyGyro_std_Y           |Feature 125 tBodyGyro-std()-Y in original dataset
26           | f126_tBodyGyro_std_Z           |Feature 126 tBodyGyro-std()-Z in original dataset
27      | f161_tBodyGyroJerk_mean_X      |Feature 161 tBodyGyroJerk-mean()-X in original dataset
28      | f162_tBodyGyroJerk_mean_Y      |Feature 162 tBodyGyroJerk-mean()-Y in original dataset
29      | f163_tBodyGyroJerk_mean_Z      |Feature 163 tBodyGyroJerk-mean()-Z in original dataset
30       | f164_tBodyGyroJerk_std_X       |Feature 164 tBodyGyroJerk-std()-X in original dataset
31       | f165_tBodyGyroJerk_std_Y       |Feature 165 tBodyGyroJerk-std()-Y in original dataset
32       | f166_tBodyGyroJerk_std_Z       |Feature 166 tBodyGyroJerk-std()-Z in original dataset
33          | f201_tBodyAccMag_mean          |Feature 201 tBodyAccMag-mean() in original dataset
34           | f202_tBodyAccMag_std           |Feature 202 tBodyAccMag-std() in original dataset
35       | f214_tGravityAccMag_mean       |Feature 214 tGravityAccMag-mean() in original dataset
36        | f215_tGravityAccMag_std        |Feature 215 tGravityAccMag-std() in original dataset
37      | f227_tBodyAccJerkMag_mean      |Feature 227 tBodyAccJerkMag-mean() in original dataset
38       | f228_tBodyAccJerkMag_std       |Feature 228 tBodyAccJerkMag-std() in original dataset
39         | f240_tBodyGyroMag_mean         |Feature 240 tBodyGyroMag-mean() in original dataset
40          | f241_tBodyGyroMag_std          |Feature 241 tBodyGyroMag-std() in original dataset
41     | f253_tBodyGyroJerkMag_mean     |Feature 253 tBodyGyroJerkMag-mean() in original dataset
42      | f254_tBodyGyroJerkMag_std      |Feature 254 tBodyGyroJerkMag-std() in original dataset
43           | f266_fBodyAcc_mean_X           |Feature 266 fBodyAcc-mean()-X in original dataset
44           | f267_fBodyAcc_mean_Y           |Feature 267 fBodyAcc-mean()-Y in original dataset
45           | f268_fBodyAcc_mean_Z           |Feature 268 fBodyAcc-mean()-Z in original dataset
46            | f269_fBodyAcc_std_X            |Feature 269 fBodyAcc-std()-X in original dataset
47            | f270_fBodyAcc_std_Y            |Feature 270 fBodyAcc-std()-Y in original dataset
48            | f271_fBodyAcc_std_Z            |Feature 271 fBodyAcc-std()-Z in original dataset
49       | f345_fBodyAccJerk_mean_X       |Feature 345 fBodyAccJerk-mean()-X in original dataset
50       | f346_fBodyAccJerk_mean_Y       |Feature 346 fBodyAccJerk-mean()-Y in original dataset
51       | f347_fBodyAccJerk_mean_Z       |Feature 347 fBodyAccJerk-mean()-Z in original dataset
52        | f348_fBodyAccJerk_std_X        |Feature 348 fBodyAccJerk-std()-X in original dataset
53        | f349_fBodyAccJerk_std_Y        |Feature 349 fBodyAccJerk-std()-Y in original dataset
54        | f350_fBodyAccJerk_std_Z        |Feature 350 fBodyAccJerk-std()-Z in original dataset
55          | f424_fBodyGyro_mean_X          |Feature 424 fBodyGyro-mean()-X in original dataset
56          | f425_fBodyGyro_mean_Y          |Feature 425 fBodyGyro-mean()-Y in original dataset
57          | f426_fBodyGyro_mean_Z          |Feature 426 fBodyGyro-mean()-Z in original dataset
58           | f427_fBodyGyro_std_X           |Feature 427 fBodyGyro-std()-X in original dataset
59           | f428_fBodyGyro_std_Y           |Feature 428 fBodyGyro-std()-Y in original dataset
60           | f429_fBodyGyro_std_Z           |Feature 429 fBodyGyro-std()-Z in original dataset
61          | f503_fBodyAccMag_mean          |Feature 503 fBodyAccMag-mean() in original dataset
62           | f504_fBodyAccMag_std           |Feature 504 fBodyAccMag-std() in original dataset
63  | f516_fBodyBodyAccJerkMag_mean  |Feature 516 fBodyBodyAccJerkMag-mean() in original dataset
64   | f517_fBodyBodyAccJerkMag_std   |Feature 517 fBodyBodyAccJerkMag-std() in original dataset
65     | f529_fBodyBodyGyroMag_mean     |Feature 529 fBodyBodyGyroMag-mean() in original dataset
66      | f530_fBodyBodyGyroMag_std      |Feature 530 fBodyBodyGyroMag-std() in original dataset
67 | f542_fBodyBodyGyroJerkMag_mean |Feature 542 fBodyBodyGyroJerkMag-mean() in original dataset
68  | f543_fBodyBodyGyroJerkMag_std  |Feature 543 fBodyBodyGyroJerkMag-std() in original dataset