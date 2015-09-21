# samsung-dataCode Book

Transformations performed:

1)	Subject_test, X_test, Y-test and Subject_train, X_train, Y_train datasets were red using table.read function

2)	3 datasets ending with “_test” were combined into one dataset test_all using column binding function cbind(). Same was done with datasets ending with “_train” resulting in train_all dataset

3)	Test_all and Train_all were combined using row binding function rbind() into Data_full dataset

4)	Names of the features from Features.txt file were recorded into Names vector

5)	PersonID and ActivityID were added to name vector resulting in Columnames vector

6)	Columnames vector was used to assign variable names for Data_full dataset

7)	Grepl function was used to subset Data_full to only Mean and Std columns (+ ActivityID and PersonID)

8)	Sub function was used to give meaningfull names to Data_full variables: substituting unfamiliar abbreviations with meaningful words

9)	Activity variable was created with descriptive activity names

10)	Data_aggregated dataset was created with averages of each variable for each activity and subject

11)	AVG prefix was added to all variables in Data_aggregated dataset to indicate that it contains averages. By groups variable were renamed to Activity and PersonID

Variables and Data description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAcceleration-XYZ and TimeGyroscope-XYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcc-XYZ and TimeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerationJerkSignal-XYZ and TimeBodyGyroscopeJerkSignal-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerationMagnitude, TimeGravityAccelerationMagnitude, TimeBodyAccelerationJerkSignalMagnitude, TimeBodyGyroMagnitude, TimeBodyGyroJerkSignalMagnitude). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FourierBodyAcceleration-XYZ, FourierBodyAccelerationJerkSignal-XYZ, FourierBodyGyroscope-XYZ, FourierBodyAccelerationJerkSignalMagnitude, FourierBodyGyroscopeMagnitude, FourierBodyGyroscopeJerkSignalMagnitude. (Note the 'Fourier' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

For each record Data_aggreagted dataset provides:

- Activity type

- An identifier of the subject who carried out the experiment.

- Averages of Means and Standard Deviations of  time and frequency domain variables grouped by Activity and PersonID.

Here is the full list of variables in Data_Aggregated dataset:
Activity
PersonID
AVG_TimeBodyAccelerations-mean()-X
AVG_TimeBodyAccelerations-mean()-Y
AVG_TimeBodyAccelerations-mean()-Z
AVG_TimeBodyAccelerations-std()-X
AVG_TimeBodyAccelerations-std()-Y
AVG_TimeBodyAccelerations-std()-Z
AVG_TimeGravityAccelerations-mean()-X
AVG_TimeGravityAccelerations-mean()-Y
AVG_TimeGravityAccelerations-mean()-Z
AVG_TimeGravityAccelerations-std()-X
AVG_TimeGravityAccelerations-std()-Y
AVG_TimeGravityAccelerations-std()-Z
AVG_TimeBodyAccelerationsJerkSignal-mean()-X
AVG_TimeBodyAccelerationsJerkSignal-mean()-Y
AVG_TimeBodyAccelerationsJerkSignal-mean()-Z
AVG_TimeBodyAccelerationsJerkSignal-std()-X
AVG_TimeBodyAccelerationsJerkSignal-std()-Y
AVG_TimeBodyAccelerationsJerkSignal-std()-Z
AVG_TimeBodyGyroscope-mean()-X
AVG_TimeBodyGyroscope-mean()-Y
AVG_TimeBodyGyroscope-mean()-Z
AVG_TimeBodyGyroscope-std()-X
AVG_TimeBodyGyroscope-std()-Y
AVG_TimeBodyGyroscope-std()-Z
AVG_TimeBodyGyroscopeJerkSignal-mean()-X
AVG_TimeBodyGyroscopeJerkSignal-mean()-Y
AVG_TimeBodyGyroscopeJerkSignal-mean()-Z
AVG_TimeBodyGyroscopeJerkSignal-std()-X
AVG_TimeBodyGyroscopeJerkSignal-std()-Y
AVG_TimeBodyGyroscopeJerkSignal-std()-Z
AVG_TimeBodyAccelerationsMagnitude-mean()
AVG_TimeBodyAccelerationsMagnitude-std()
AVG_TimeGravityAccelerationsMagnitude-mean()
AVG_TimeGravityAccelerationsMagnitude-std()
AVG_TimeBodyAccelerationsJerkSignalMagnitude-mean()
AVG_TimeBodyAccelerationsJerkSignalMagnitude-std()
AVG_TimeBodyGyroscopeMagnitude-mean()
AVG_TimeBodyGyroscopeMagnitude-std()
AVG_TimeBodyGyroscopeJerkSignalMagnitude-mean()
AVG_TimeBodyGyroscopeJerkSignalMagnitude-std()
AVG_FourierBodyAccelerations-mean()-X
AVG_FourierBodyAccelerations-mean()-Y
AVG_FourierBodyAccelerations-mean()-Z
AVG_FourierBodyAccelerations-std()-X
AVG_FourierBodyAccelerations-std()-Y
AVG_FourierBodyAccelerations-std()-Z
AVG_FourierBodyAccelerations-meanFreq()-X
AVG_FourierBodyAccelerations-meanFreq()-Y
AVG_FourierBodyAccelerations-meanFreq()-Z
AVG_FourierBodyAccelerationsJerkSignal-mean()-X
AVG_FourierBodyAccelerationsJerkSignal-mean()-Y
AVG_FourierBodyAccelerationsJerkSignal-mean()-Z
AVG_FourierBodyAccelerationsJerkSignal-std()-X
AVG_FourierBodyAccelerationsJerkSignal-std()-Y
AVG_FourierBodyAccelerationsJerkSignal-std()-Z
AVG_FourierBodyAccelerationsJerkSignal-meanFreq()-X
AVG_FourierBodyAccelerationsJerkSignal-meanFreq()-Y
AVG_FourierBodyAccelerationsJerkSignal-meanFreq()-Z
AVG_FourierBodyGyroscope-mean()-X
AVG_FourierBodyGyroscope-mean()-Y
AVG_FourierBodyGyroscope-mean()-Z
AVG_FourierBodyGyroscope-std()-X
AVG_FourierBodyGyroscope-std()-Y
AVG_FourierBodyGyroscope-std()-Z
AVG_FourierBodyGyroscope-meanFreq()-X
AVG_FourierBodyGyroscope-meanFreq()-Y
AVG_FourierBodyGyroscope-meanFreq()-Z
AVG_FourierBodyAccelerationsMagnitude-mean()
AVG_FourierBodyAccelerationsMagnitude-std()
AVG_FourierBodyAccelerationsMagnitude-meanFreq()
AVG_FourierBodyBodyAccelerationsJerkSignalMagnitude-mean()
AVG_FourierBodyBodyAccelerationsJerkSignalMagnitude-std()
AVG_FourierBodyBodyAccelerationsJerkSignalMagnitude-meanFre
AVG_FourierBodyBodyGyroscopeMagnitude-mean()
AVG_FourierBodyBodyGyroscopeMagnitude-std()
AVG_FourierBodyBodyGyroscopeMagnitude-meanFreq()
AVG_FourierBodyBodyGyroscopeJerkSignalMagnitude-mean()
AVG_FourierBodyBodyGyroscopeJerkSignalMagnitude-std()
AVG_FourierBodyBodyGyroscopeJerkSignalMagnitude-meanFreq()



