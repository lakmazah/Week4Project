run_analysis.R uses three functions from helper_functions.R

import_data(wd,url)

This function takes a specific working directory and URL, downloads the
zipped file from the url and extracts the test and train data (6 tables). It also
extracts the features and activities and puts all 8 tables into a list (data_sets). This list is returned.

merge_sets(ds)

This function takes a list of data sets, returned by import_data, and merges the sets
into one data set (10299 observations and 88 variables). The first two variables are the subject and activity, and the remaining 86 are columns are a subset of the raw data representing the relevant mean and std features. These columns are selected by any instance of the word [Mm]ean or std.

create_tidy(df,output_file)

This function takes the cleaned data set from merge_sets and creates a tidy data frame. The input dataframe is grouped by subject and activity, and the rest of the data is summarized using the mean function. This creates a unique row for each subject-activity pair with the mean data for each different feature. This set is output to a csv file specified by output_file and can be found in the "output" directory.