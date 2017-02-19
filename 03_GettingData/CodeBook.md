# Code Book

## Summary of run_analysis.R
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### More detail on the steps of run_analysis.R
1. Ingest training data (subject_train.txt, y_train.txt, X_train.txt) and make a single data frame out of them.
2. Ingest test data (subject_test.txt, y_test.txt, X_test.txt) and make a single data frame out of them.
3. Combine the training and test data frames into a single data frame.
4. Ingest the feature names from features.txt.
5. Extract all the feature names with the text "mean" in them.
6. Extract all the feature names with the text "std" in them, which stands for the standard deviation.
7. Rename some of the feature names to make them more clear: replace the leading "t" with "time", leading "f" with "freq", get rid of the brackets "()", replace "std" with "standarddeviation" and make them all lower case.
8. Combine the feature index and feature names in a data frame.
9. Order that data frame according to the feature index.
10. Add a "V" to the feature index to make it the same as the training and test data frame column names.
11. Subset the full training and test data frame to extract just the mean and standard deviation values, and the subject and labels.
12. Extract the names of the activities and the corresponding number from the file activity_labels.txt.
13. Iterate through the numerical activity label in the training and test data frame and replace them with the corresponding activity name.
14. Rename the column names with descriptive names, taken from the feature data frame.
15. Write the resulting data frame to tidydata.txt.

## Variables in the output tidydata.txt
* Includes 68 variables.  
* Units for variables 1 to 66 (see below) are normalized to be between -1 and 1.
* "acc" is linear acceleration, and "accmag" is the absolute magnitude of the linear acceleration.  
* "accjerk" is linear jerk (time derivative of linear acceleration), and "accjerkmag" is the absolute magnitude of the linear jerk.  
* "gyro" is angular acceleration, and "gyromag" is the absolute magnitude of the angular acceleration.  
* "gyrojerk" is angular jerk, and "gyrojerkmag" is the absolute magnitude of the angular jerk.  
* Variables with "time" were obtained directly by the accelerometers and gyroscopes. Variables with "freq" were obtained through fast Fourier transforms of the "time" variables.
* Variables with "body" are the variables related with the person directly, and variables with "gravity" are the portions related with the effects due to gravity.
* The variable "subject" is an integer value between 1 and 30, corresponding to the 30 different people that are part of the study.
* The variable "activity" is a character value out of 6 possibilities: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", and "LAYING".

 [1] timebodyacc-mean-x                       
 [2] timebodyacc-mean-y                       
 [3] timebodyacc-mean-z                       
 [4] timebodyacc-standarddeviation-x          
 [5] timebodyacc-standarddeviation-y          
 [6] timebodyacc-standarddeviation-z          
 [7] timegravityacc-mean-x                    
 [8] timegravityacc-mean-y                    
 [9] timegravityacc-mean-z                    
[10] timegravityacc-standarddeviation-x       
[11] timegravityacc-standarddeviation-y       
[12] timegravityacc-standarddeviation-z       
[13] timebodyaccjerk-mean-x                   
[14] timebodyaccjerk-mean-y                   
[15] timebodyaccjerk-mean-z                   
[16] timebodyaccjerk-standarddeviation-x      
[17] timebodyaccjerk-standarddeviation-y      
[18] timebodyaccjerk-standarddeviation-z      
[19] timebodygyro-mean-x                      
[20] timebodygyro-mean-y                      
[21] timebodygyro-mean-z                      
[22] timebodygyro-standarddeviation-x         
[23] timebodygyro-standarddeviation-y         
[24] timebodygyro-standarddeviation-z         
[25] timebodygyrojerk-mean-x                  
[26] timebodygyrojerk-mean-y                  
[27] timebodygyrojerk-mean-z                  
[28] timebodygyrojerk-standarddeviation-x     
[29] timebodygyrojerk-standarddeviation-y     
[30] timebodygyrojerk-standarddeviation-z     
[31] timebodyaccmag-mean                      
[32] timebodyaccmag-standarddeviation         
[33] timegravityaccmag-mean                   
[34] timegravityaccmag-standarddeviation      
[35] timebodyaccjerkmag-mean                  
[36] timebodyaccjerkmag-standarddeviation     
[37] timebodygyromag-mean                     
[38] timebodygyromag-standarddeviation        
[39] timebodygyrojerkmag-mean                 
[40] timebodygyrojerkmag-standarddeviation    
[41] freqbodyacc-mean-x                       
[42] freqbodyacc-mean-y                       
[43] freqbodyacc-mean-z                       
[44] freqbodyacc-standarddeviation-x          
[45] freqbodyacc-standarddeviation-y          
[46] freqbodyacc-standarddeviation-z          
[47] freqbodyaccjerk-mean-x                   
[48] freqbodyaccjerk-mean-y                   
[49] freqbodyaccjerk-mean-z                   
[50] freqbodyaccjerk-standarddeviation-x      
[51] freqbodyaccjerk-standarddeviation-y      
[52] freqbodyaccjerk-standarddeviation-z      
[53] freqbodygyro-mean-x                      
[54] freqbodygyro-mean-y                      
[55] freqbodygyro-mean-z                      
[56] freqbodygyro-standarddeviation-x         
[57] freqbodygyro-standarddeviation-y         
[58] freqbodygyro-standarddeviation-z         
[59] freqbodyaccmag-mean                      
[60] freqbodyaccmag-standarddeviation         
[61] freqbodybodyaccjerkmag-mean              
[62] freqbodybodyaccjerkmag-standarddeviation  
[63] freqbodybodygyromag-mean                 
[64] freqbodybodygyromag-standarddeviation    
[65] freqbodybodygyrojerkmag-mean             
[66] freqbodybodygyrojerkmag-standarddeviation  
[67] subject                                  
[68] activity                                 

## Information on the Original Data Source
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

### Summary of the original data source from the README.txt of the data source
Experiments were performed on 30 volunteers where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Researchers captured 3-axial linear acceleration and 3-axial angular velocity using the embedded accelerometer and gyroscope. The dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

For each record the data source includes:  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- A 561-feature vector with time and frequency domain variables.  
- Its activity label.   
- An identifier of the subject who carried out the experiment.  

The dataset which we use in the run_analysis.R file includes the following files:  
- 'README.txt'  
- 'features_info.txt': Shows information about the variables used on the feature vector.  
- 'features.txt': List of all features.  
- 'activity_labels.txt': Links the class labels with their activity name.  
- 'train/X_train.txt': Training set.  
- 'train/y_train.txt': Training labels.  
- 'test/X_test.txt': Test set.  
- 'test/y_test.txt': Test labels.  
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
