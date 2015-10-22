#turn the feature names into valid column names
#
#       replace space (" ") between leading digits with "_"
#       replace () with nothing
#       replace "-()," with "_"

fname2colname <- function(feats){
        
        feats <- sub("\\(\\)", "", feats)
        feats <- gsub(" |-|\\(|\\)|,", "_",feats)
        
        #get rid of trailing "_"
        feats <- sub("_$","", feats)
        
        if (length(feats) != length(unique(feats))) stop("fname2colname produced dups")
        
        #column names can't (shouldn't) start with digits, so paste on a leading "f"
        return(paste("f",feats, sep=""))
        
}