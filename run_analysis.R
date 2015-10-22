#runs the analysis for class project, outputs tidy data to the file specified
#calls the function getHARdata which does all the heavy lifting:
#       determines the columns of interest
#       creates user friendly column names
#       creates a data.frame with user friendly activity names and all of the data
#       Note: the first column in the data.frame from getHARdata identifies the source of the observations (test or train)

run_analysis <- function(
                        d = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"
                        ) {
        
        #get and merge (append, actually) the test and training datasets
        ds <- data.frame(rbind(getHARdata("test"), getHARdata("train")))
        
        #save the column names, will need these in a moment
        dscolnames <- names(ds)
        
        #the following aggregation will be done without the dset column in the data frame
        #so will need the column names 2:length(dscolnames)
        
        structure(
            aggregate(x=ds[,4:length(dscolnames)], by=list(ds$subject, ds$activity), mean),
            names = dscolnames[2:length(dscolnames)]
        )
}