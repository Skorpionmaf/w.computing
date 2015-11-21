  library(dplyr)
  
  stest = read.table("UCI HAR Dataset/test/subject_test.txt")
  Xtest = read.table("UCI HAR Dataset/test/X_test.txt")
  ytest = read.table("UCI HAR Dataset/test/y_test.txt")
  
  strain = read.table("UCI HAR Dataset/train/subject_train.txt")
  Xtrain = read.table("UCI HAR Dataset/train/X_train.txt")
  ytrain = read.table("UCI HAR Dataset/train/y_train.txt")
  
  Test = cbind(Xtest, stest, ytest)
  Train = cbind(Xtrain, strain, ytrain)
  df = rbind(Test, Train)
  
  s1 = c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 562:563)
  df = df[, s1]
  
  variable_names = read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
  variable_names = variable_names[, 2]
  for(i in 1:length(s1) ) {
    names(df)[i] <- variable_names[s1[i]]
    names(df)[i] <- variable_names[s1[i]]
  }
  names(df)[length(s1) -1] <- "subject"
  names(df)[length(s1)] <- "activity"
  
  for(i in 1:length(df$activity) ) {
    if ( 1 == df[i, "activity"] ) {
      df[i, "activity"] = "WALKING"
    } else if( 2 == df[i, "activity"] ) {
      df[i, "activity"] = "WALKING_UPSTAIRS"
    } else if( 3 == df[i, "activity"] ) {
      df[i, "activity"] = "WALKING_DOWNSTAIRS"
    } else if( 4 == df[i, "activity"] ) {
      df[i, "activity"] = "SITTING"
    } else if( 5 == df[i, "activity"] ) {
      df[i, "activity"] = "STANDING"
    } else if( 6 == df[i, "activity"] ) {
      df[i, "activity"] = "LAYING"
    } else {
      df[i, "activity"] = "NA"
    }
  }
  
  by_sa = group_by(df, subject, activity)
  res = summarize_each(by_sa, funs(mean))
  write.table(res, file="./tidy_dataset.txt", row.names = FALSE)

  