# samsung-dataREADME :
#### Subject_test, X_test, Y-test datasets were red using table.read function
setwd("F:/coursera")

setwd(paste(getwd(),"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test",sep=""))

test = read.table("X_test.txt")

test_label = read.table("y_test.txt")

subject_test = read.table("subject_test.txt")

#### 3 above datasets  were combined into one dataset test_all using column binding function cbind()

test_all <-cbind(test,subject_test,test_label)

#### Subject_train, X_ train, Y- train datasets were red using table.read function

setwd("F:/coursera")

setwd(paste(getwd(),"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train",sep=""))

train = read.table("X_train.txt")

subject_train = read.table("subject_train.txt")

train_label = read.table("y_train.txt")

#### 3 above datasets  were combined into one dataset train_all using column binding function cbind()

train_all <-cbind(train,subject_train,train_label)

####Test_all and Train_all were combined using row binding function rbind() into Data_full dataset

data_full<-rbind(test_all,train_all)

#### Names of the features from Features.txt file were recorded into Names vector

setwd("F:/coursera")

setwd(paste(getwd(),"/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset",sep=""))

options( stringsAsFactors=F ) 

names = read.table("features.txt")[,2]

#### PersonID and ActivityID were added to name vector resulting in Columnames vector

addnames<- c("PersonID", "ActivityID")

columnames<-c(names,addnames)

colnames(data_full) <- columnames

####Grepl function was used to subset Data_full to only Mean and Std columns (+ ActivityID,  PersonID)

f<-grepl("-mean|-std|PersonID|ActivityID", columnames)

data_mean_std<- data_full[, f]

#### Sub function was used to give meaningfull names to Data_full variables: substituting unfamiliar abbreviations

with meaningful words

colnames(data_mean_std)<-sub("Acc","Accelerations",names(data_mean_std),)

colnames(data_mean_std)<-sub("Gyro","Gyroscope",names(data_mean_std),)

colnames(data_mean_std)<-sub("Jerk","JerkSignal",names(data_mean_std))

colnames(data_mean_std)<-sub("Mag","Magnitude",names(data_mean_std))

colnames(data_mean_std)<-sub("^t","Time",names(data_mean_std))

colnames(data_mean_std)<-sub("^f","Fourier",names(data_mean_std))

colnames(data_mean_std)[81]<-"ActivityID" 

#### Activity variable was created with descriptive activity names

data_mean_std$Activity[data_mean_std$ActivityID==1] <- "WALKING"
data_mean_std$Activity[data_mean_std$ActivityID==2] <- "WALKING_UPSTAIRS"
data_mean_std$Activity[data_mean_std$ActivityID==3] <- "WALKING_DOWNSTAIRS"
data_mean_std$Activity[data_mean_std$ActivityID==4] <- "SITTING"
data_mean_std$Activity[data_mean_std$ActivityID==5] <- "STANDING"
data_mean_std$Activity[data_mean_std$ActivityID==6] <- "LAYING"

#### Data_aggregated dataset was created with averages of each variable for each activity and subject

data_aggregated<-aggregate(data_mean_std[, 1:79], list(data_mean_std$Activity, data_mean_std$PersonID), mean)

#### AVG prefix was added to all variables in Data_aggregated dataset to indicate that it contains averages. By groups
variable were renamed to Activity and PersonID

colnames(data_aggregated) <- paste("AVG", colnames(data_aggregated), sep = "_")

colnames(data_aggregated)<-sub("AVG_Group.1","Activity",names(data_aggregated))

colnames(data_aggregated)<-sub("AVG_Group.2","PersonID",names(data_aggregated))

