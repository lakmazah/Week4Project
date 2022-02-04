
#reads the zip from a specified url into a specified directory
#outputs the essential files as a list
import_data <- function(wd,url) {
  if(!dir.exists(wd)) dir.create(wd)
  if(!dir.exists("output")) dir.create("output")
  setwd(wd)
  download.file(url,"data.zip",method="curl")
  unzip("data.zip")
  setwd("./UCI HAR Dataset")
  activity_labels<-read.table("./activity_labels.txt")
  features<-read.table("./features.txt")
  setwd("./test")
  ##read in test dataset
  x_test<-read.table("./X_test.txt")
  y_test<-read.table("./Y_test.txt")
  sub_test<-read.table("./subject_test.txt")
  setwd("../train")
  x_train<-read.table("./X_train.txt")
  y_train<-read.table("./Y_train.txt")
  sub_train<-read.table("./subject_train.txt")
  setwd("../../")
  list(x_test,x_train,y_test,y_train,sub_test,sub_train,features,activity_labels)
}

#takes the list of data sets and merges them into a single data frame
#only the mean and std columns are included
merge_sets <- function(ds) {
  xtest<-ds[1][[1]]
  xtrain<-ds[2][[1]]
  ytest<-ds[3][[1]]
  ytrain<-ds[4][[1]]
  subtest<-ds[5][[1]]
  subtrain<-ds[6][[1]]
  features<-ds[7][[1]]
  activity_labels<-ds[8][[1]]
  xcom<-rbind(xtest,xtrain)
  ycom<-rbind(ytest,ytrain)
  subcom<-rbind(subtest,subtrain)
  #selects only the mean and std feature columns 
  #and gets the corresponding name
  feature_ids<-grep("std|[Mm]ean",features$V2)
  feature_names<-features[feature_ids,2]
  xcom_filtered<-select(xcom,all_of(feature_ids))
  #combines the subject, activity, and data columns into a new dataframe
  clean<-cbind(subcom,ycom,xcom_filtered)
  names(clean)<-c("subject","activity",feature_names)
  #assigns activity names
  clean$activity <- activity_labels$V2[clean$activity]
  clean
}

#uses dplyr to group by subject and activity
#then summarize the columns with the mean function
create_tidy <- function(df,output_file) {
  new<-group_by(df,subject,activity)
  newsum<-summarise_at(new,vars(names(new)[-(1:2)]), list(avg=mean))
  fwrite(newsum,paste("./output/",output_file,sep=""))
}

