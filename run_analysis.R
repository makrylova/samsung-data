setwd("F:/coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test")
test = read.table("X_test.txt")
test_label = read.table("y_test.txt")
subject_test = read.table("subject_test.txt")
test_all <-cbind(test,subject_test,test_label)

setwd("F:/coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")
train = read.table("X_train.txt")
subject_train = read.table("subject_train.txt")
train_label = read.table("y_train.txt")
train_all <-cbind(train,subject_train,train_label)

data_full<-rbind(test_all,train_all)

setwd("F:/coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
options( stringsAsFactors=F ) 
names = read.table("features.txt")[,2]
addnames<- c("PersonID", "ActivityID")
columnames<-c(names,addnames)
colnames(data_full) <- columnames

f<-grepl("-mean|-std|PersonID|ActivityID", columnames)
data_mean_std<- data_full[, f]

colnames(data_mean_std)<-sub("Acc","Accelerations",names(data_mean_std),)
colnames(data_mean_std)<-sub("Gyro","Gyroscope",names(data_mean_std),)
colnames(data_mean_std)<-sub("Jerk","JerkSignal",names(data_mean_std))
colnames(data_mean_std)<-sub("Mag","Magnitude",names(data_mean_std))
colnames(data_mean_std)<-sub("^t","Time",names(data_mean_std))
colnames(data_mean_std)<-sub("^f","Fourier",names(data_mean_std))

colnames(data_mean_std)[81]<-"ActivityID" 

data_mean_std$Activity[data_mean_std$ActivityID==1] <- "WALKING"
data_mean_std$Activity[data_mean_std$ActivityID==2] <- "WALKING_UPSTAIRS"
data_mean_std$Activity[data_mean_std$ActivityID==3] <- "WALKING_DOWNSTAIRS"
data_mean_std$Activity[data_mean_std$ActivityID==4] <- "SITTING"
data_mean_std$Activity[data_mean_std$ActivityID==5] <- "STANDING"
data_mean_std$Activity[data_mean_std$ActivityID==6] <- "LAYING"

data_aggregated<-aggregate(data_mean_std[, 1:79], list(data_mean_std$Activity, data_mean_std$PersonID), mean)
colnames(data_aggregated) <- paste("AVG", colnames(data_aggregated), sep = "_")
colnames(data_aggregated)<-sub("AVG_Group.1","Activity",names(data_aggregated))
colnames(data_aggregated)<-sub("AVG_Group.2","PersonID",names(data_aggregated))
write.table(data_aggregated, file = "data_text.txt",  row.names = FALSE)

