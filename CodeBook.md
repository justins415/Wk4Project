## Code Book for Course Project - Getting and Cleaning Data Week 4
  
  Human Activity Recognition (HAR) Using Smartphones Dataset
  
  HAR experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope, the study captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
  
  Each row/ record in the original dataset contained the following:
  
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope. 
  - A 561-feature vector with time and frequency domain variables. 
  - Its activity label. 
  - An identifier of the subject who carried out the experiment.
 
The following files contain descriptions of the data contained in the UCI HAR Dataset:
  
  "features.txt" : provides a list of the various features/ measurements and sensor signals included in the database.
  
  "features_info.txt" : explains further information regarding the features and measurements included in the database.
  
  "README.txt" : provides further explanation about the experiments and the associated files.
  
The accelerometer measurements are in standard gravity units 'g'.
  
The gyroscope measurements provide angular velocity in units of radians/ second.
  
Variable names were modified in order to be more understandable in the final file "tidy.txt".
  
The file "tidy.txt" contains only the columns/ measurements that contain a mean or standard deviation, and these are grouped to give averages of the measurements by subject and activity.
  
  
  
  
