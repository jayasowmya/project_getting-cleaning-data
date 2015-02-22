library(dplyr)
#get train data in one dataframe
tr_x<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/train/X_train.txt")
dim(tr_x)
tr_xl<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/train/y_train.txt")
dim(tr_xl)
tr_xs<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/train/subject_train.txt")
dim(tr_xs)
tr<-cbind(tr_x,tr_xl,tr_xs)
dim(tr)
head(tr,2)

#get test data in a dataframe
ts_x<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/test/X_test.txt")
dim(ts_x)
ts_xl<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/test/y_test.txt")
dim(ts_xl)
ts_xs<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/test/subject_test.txt")
dim(ts_xs)
ts<-cbind(ts_x,ts_xl,ts_xs)
dim(ts)
head(ts,2)

#join test and train datsets(STEP 1)
data<-rbind(tr,ts)
dim(data)

#extract required data (STEP 2)
t_f<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/features.txt")
dim(t_f)
l1<-(t_f[grep("mean()",t_f$V2),])
l2<-(t_f[grep("std()",t_f$V2),])
tf<-merge(l1,l2,all=T)
ind=tf$V1
ind_names=tf$V2
ext_data<-data[,c(ind,562)]
dim(ext_data)

#add labels to the extracted data (STEP 3)
t_l<-read.table("C:/Users/DELL/Documents/UCI HAR Dataset/activity_labels.txt")
t_l
labeld_data<-ext_data
for (i in 1:10299){
  for (j in 1:6){
    if (labeld_data$V1.1[i]==t_l[j,1]) labeld_data$V1.1[i]=as.character(t_l[j,2])}}

labeld_data$V1.1
head(labeld_data)
dim(labeld_data)



#add descriptive variable names to the data(STEP 4)
names(labeld_data)=c(as.character(ind_names),"Activity")

# creating a tidy dataset(STEP 5)
tidy_data<-ddply(labeld_data, .(Activity), colwise(mean))

# writing the tidy data set into a text file
write.table(tidy_data, file="Tidy Data.txt", col.names=T, row.names=FALSE)
