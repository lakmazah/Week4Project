source("helper_functions.R")

wd <- "/R_Projects/Week4Project"
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_sets<-import_data(wd,fileURL)
combined<-merge_sets(data_sets)
create_tidy(combined,"tidy_data.csv")