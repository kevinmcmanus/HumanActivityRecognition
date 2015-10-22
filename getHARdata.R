##getHARdata - returns data.frame for specified columns, with additional identifying cols
## assumes current directory contains subdirectory "UCI HAR Dataset" in which all of the datafiles are located


getHARdata <- function(dset,    # test or training dataset
                       d = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset") {
        
        if (!any(dset==c("test","train"))) stop(paste("Invalid data set:", dset))
        

        #get the activity labels
        actlabs <- readLines(paste(d,"activity_labels.txt", sep = "/"))
        
        #read in the features
        features <- readLines(paste(d,"features.txt",sep = "/"))
        
        #figure out the columns of interest by grepping through the features list
        namepatterns <- c("-mean\\(\\)","-std\\(\\)") # interested "-mean()" and "-std()"
        mycols <- as.logical(rowSums(sapply(namepatterns, grepl, features,ignore.case=T)))
        
        #strip off the leading digits from the activity label strings:
        actlabs  <- sub("^[0-9]+ ","", actlabs)
        
        #convert the feature names into user friendly column names:
        features <- fname2colname(features)
        
        #get the subjects and activities as integers, not strings:
        dsetdir <- paste(d,dset, sep="/")
        subjects   <- as.integer(readLines(paste(dsetdir,"/subject_", dset,".txt",sep="")))
        activities <- as.integer(readLines(paste(dsetdir,"/y_",       dset,".txt",sep="")))
        
        #read the data set
        ldf <- read.table(paste(dsetdir,"/X_",dset,".txt",sep=""))
        
        #return the data frame:
        structure(data.frame(dset=dset, subject=subjects, activity=actlabs[activities],
                   ldf[,mycols], stringsAsFactors = F),
                  names = append(c("dset","subject","activity"),features[mycols]))
        
}
        