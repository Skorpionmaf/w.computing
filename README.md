#Description of the run.analysis.R script

###line 3:5:
 * stest ---> data from subject_test.txt
 * Xtest ---> data from X_test.txt
 * ytest ---> data from y_test.txt

###line 7:9:
* strain ---> data from subject_train.txt
* Xtrain ---> data from X_train.txt
* ytrain ---> data from y_train.txt

###line 11:13:
* Test ---> bind Test data frames together
* Train ---> bind Train data frames together
* df ---> bind Test and Train data frames

###line 15:16:
* s1 ---> vector of the columns of interest (mean() and std())
* df = df[ ,s1] ---> subsetting of the initial data frame df

###line 18:25:
column labels are renamed accordingly to the descriptive variable names

###line 27:43:
all the activities are renamed accordingly to their descriptive names

###line 45:47:
1. the data frame is grouped by "subject" and "activity"
2. the data frame (grouped) is summarized by mean
3. the final data frame obtained is printed to .txt file (tidy_dataset.txt)