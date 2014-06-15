## Codebook for Course Assignment in the JHU/Coursera course *Getting & Cleaning Data*.

In tidying up the data, the training and test sets were merged into a single summarized dataset. The "set" variable contains a flag indicating which set an observation was drawn from. The full dataset is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

In addition merging the test/training sets, the summarized dataset binds the subject identification number and activity code to each observation. Subjects are numbered 1 through 30. In the study, measurements were taken while subjects performed six activities. These are coded in the "actcode" column. Actcode values are: 

* "walking"
* "walking_upstairs"
* "walking_downstairs"
* "sitting"
* "standing" 
* "laying" 

This dataset preserves the sensor reading variable names used in the original study, listed below. This cited description is from "features_info.txt" which is published as part of the study documentation. The summarized dataset includes the mean for each set of readings from the sensor worn by each subject performing each of the actions. 

> Feature Selection 
> =================
> 
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

**For each of the features above, the average of the standard deviation std() and mean() is given in this summarized dataset.**
