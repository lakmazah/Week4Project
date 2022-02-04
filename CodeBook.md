Accelorometer and gyroscope data were collected from 30 subjects while engaging in six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The subjects were divided into a test group and a train group.

The raw data, representing the axial acceleration data in gravity units (g) and angular velocity data in radians per second for each of the three axes (x,y,z), was used to create a set of data for 561 features (a list of features can be found in features.txt) summarizing the movement of each subject.

The result is a data set for each group consisting of: 
1) The raw data calculations (X_test.txt and X_train.txt)
2) The corresponding list of labels describing the data features (y_test.txt and y_train.txt)
3) A corresponding list of the subjects responsible for the data (subject_test.txt and subject_train.txt)

These sets are merged into 1 large data set, where each row is an instance of one subject performing an activity, and the columns are the raw data representing the means and standard deviations of the collected data (list of features can be found in new_features.txt). Only the columns containing the phrases [Mm]ean or std were selected.

A tidy set was created using the mean/std data set, grouping the data by subject and activity, and taking the mean of each group. This produces a data set with a single row for each unique subject-activity pair, with a column for every feature.


