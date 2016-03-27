# Getting And Cleaning Data Project Code Book.

Our project is to process some of the information contained in the file **getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip** which  we downloaded the site.

**https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**  

Next the directory structure of the downloaded file is displayed.
We will work with the following files

~~~~
└───UCI HAR Dataset  
    │   activity_labels.txt  
    │   features.txt  
    │   features_info.txt  
    │   README.txt  
    │  
    ├───test  
    │   │   subject_test.txt  
    │   │   X_test.txt  
    │   │   y_test.txt  
    │   │  
    │   └───Inertial Signals  
    │           body_acc_x_test.txt  
    │           body_acc_y_test.txt  
    │           body_acc_z_test.txt  
    │           body_gyro_x_test.txt  
    │           body_gyro_y_test.txt  
    │           body_gyro_z_test.txt  
    │           total_acc_x_test.txt  
    │           total_acc_y_test.txt  
    │           total_acc_z_test.txt  
    │  
    └───train  
        │   subject_train.txt  
        │   X_train.txt  
        │   y_train.txt  
        │  
        └───Inertial Signals  
                body_acc_x_train.txt  
                body_acc_y_train.txt  
                body_acc_z_train.txt  
                body_gyro_x_train.txt  
                body_gyro_y_train.txt  
                body_gyro_z_train.txt  
                total_acc_x_train.txt  
                total_acc_y_train.txt  
                total_acc_z_train.txt  
~~~~

We will process the following files:  

~~~~
└───UCI HAR Dataset  
    │   activity_labels.txt  
    │   features.txt  
    │  
    ├───test  
    │   │   subject_test.txt  
    │   │   X_test.txt  
    │   │   y_test.txt  
    │  
    └───train  
        │   subject_train.txt  
        │   X_train.txt  
        │   y_train.txt  
         
~~~~  
  
The file **activity_labels.txt** contains a table of activity labels with Factors: 1, 2, 3, 4, 5, 6.  
We formed the data frame **activity** by reading the file **activity_labels.txt**

|Factor| Level          |
|-----:|:---------------|
|1| WALKING             |
|2|WALKING_UPSTAIRS  |
|3|WALKING_DOWNSTAIRS|
|4|SITTING           |
|5|STANDING          |
|6|LAYING         |
  
  subject_train and subject_test
  
We formed the data frames **X_traint** and **X_test** by reading the files **X_train.txt** and **X_test.txt**, which contain the data from the acceleromter and gyroscope of the Smartphone processed according to:  
  
**https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones**
  
~~~~
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration 
signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter 
into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain.
~~~~    
  
The variables for the data frames **X_traint** and **X_test** are listed in the next table, *all variables come in floating format*:  
  
|Nº|Variable  |Nº|Variable  |
|--:|:------------|--:|---------|
|1|tBodyAcc-mean()-X|282|fBodyAcc-energy()-X|
|2|tBodyAcc-mean()-Y|283|fBodyAcc-energy()-Y|
|3|tBodyAcc-mean()-Z|284|fBodyAcc-energy()-Z|
|4|tBodyAcc-std()-X|285|fBodyAcc-iqr()-X|
|5|tBodyAcc-std()-Y|286|fBodyAcc-iqr()-Y|
|6|tBodyAcc-std()-Z|287|fBodyAcc-iqr()-Z|
|7|tBodyAcc-mad()-X|288|fBodyAcc-entropy()-X|
|8|tBodyAcc-mad()-Y|289|fBodyAcc-entropy()-Y|
|9|tBodyAcc-mad()-Z|290|fBodyAcc-entropy()-Z|
|10|tBodyAcc-max()-X|291|fBodyAcc-maxInds-X|
|11|tBodyAcc-max()-Y|292|fBodyAcc-maxInds-Y|
|12|tBodyAcc-max()-Z|293|fBodyAcc-maxInds-Z|
|13|tBodyAcc-min()-X|294|fBodyAcc-meanFreq()-X|
|14|tBodyAcc-min()-Y|295|fBodyAcc-meanFreq()-Y|
|15|tBodyAcc-min()-Z|296|fBodyAcc-meanFreq()-Z|
|16|tBodyAcc-sma()|297|fBodyAcc-skewness()-X|
|17|tBodyAcc-energy()-X|298|fBodyAcc-kurtosis()-X|
|18|tBodyAcc-energy()-Y|299|fBodyAcc-skewness()-Y|
|19|tBodyAcc-energy()-Z|300|fBodyAcc-kurtosis()-Y|
|20|tBodyAcc-iqr()-X|301|fBodyAcc-skewness()-Z|
|21|tBodyAcc-iqr()-Y|302|fBodyAcc-kurtosis()-Z|
|22|tBodyAcc-iqr()-Z|303|fBodyAcc-bandsEnergy()-1,8|
|23|tBodyAcc-entropy()-X|304|fBodyAcc-bandsEnergy()-9,16|
|24|tBodyAcc-entropy()-Y|305|fBodyAcc-bandsEnergy()-17,24|
|25|tBodyAcc-entropy()-Z|306|fBodyAcc-bandsEnergy()-25,32|
|26|tBodyAcc-arCoeff()-X,1|307|fBodyAcc-bandsEnergy()-33,40|
|27|tBodyAcc-arCoeff()-X,2|308|fBodyAcc-bandsEnergy()-41,48|
|28|tBodyAcc-arCoeff()-X,3|309|fBodyAcc-bandsEnergy()-49,56|
|29|tBodyAcc-arCoeff()-X,4|310|fBodyAcc-bandsEnergy()-57,64|
|30|tBodyAcc-arCoeff()-Y,1|311|fBodyAcc-bandsEnergy()-1,16|
|31|tBodyAcc-arCoeff()-Y,2|312|fBodyAcc-bandsEnergy()-17,32|
|32|tBodyAcc-arCoeff()-Y,3|313|fBodyAcc-bandsEnergy()-33,48|
|33|tBodyAcc-arCoeff()-Y,4|314|fBodyAcc-bandsEnergy()-49,64|
|34|tBodyAcc-arCoeff()-Z,1|315|fBodyAcc-bandsEnergy()-1,24|
|35|tBodyAcc-arCoeff()-Z,2|316|fBodyAcc-bandsEnergy()-25,48|
|36|tBodyAcc-arCoeff()-Z,3|317|fBodyAcc-bandsEnergy()-1,8|
|37|tBodyAcc-arCoeff()-Z,4|318|fBodyAcc-bandsEnergy()-9,16|
|38|tBodyAcc-correlation()-X,Y|319|fBodyAcc-bandsEnergy()-17,24|
|39|tBodyAcc-correlation()-X,Z|320|fBodyAcc-bandsEnergy()-25,32|
|40|tBodyAcc-correlation()-Y,Z|321|fBodyAcc-bandsEnergy()-33,40|
|41|tGravityAcc-mean()-X|322|fBodyAcc-bandsEnergy()-41,48|
|42|tGravityAcc-mean()-Y|323|fBodyAcc-bandsEnergy()-49,56|
|43|tGravityAcc-mean()-Z|324|fBodyAcc-bandsEnergy()-57,64|
|44|tGravityAcc-std()-X|325|fBodyAcc-bandsEnergy()-1,16|
|45|tGravityAcc-std()-Y|326|fBodyAcc-bandsEnergy()-17,32|
|46|tGravityAcc-std()-Z|327|fBodyAcc-bandsEnergy()-33,48|
|47|tGravityAcc-mad()-X|328|fBodyAcc-bandsEnergy()-49,64|
|48|tGravityAcc-mad()-Y|329|fBodyAcc-bandsEnergy()-1,24|
|49|tGravityAcc-mad()-Z|330|fBodyAcc-bandsEnergy()-25,48|
|50|tGravityAcc-max()-X|331|fBodyAcc-bandsEnergy()-1,8|
|51|tGravityAcc-max()-Y|332|fBodyAcc-bandsEnergy()-9,16|
|52|tGravityAcc-max()-Z|333|fBodyAcc-bandsEnergy()-17,24|
|53|tGravityAcc-min()-X|334|fBodyAcc-bandsEnergy()-25,32|
|54|tGravityAcc-min()-Y|335|fBodyAcc-bandsEnergy()-33,40|
|55|tGravityAcc-min()-Z|336|fBodyAcc-bandsEnergy()-41,48|
|56|tGravityAcc-sma()|337|fBodyAcc-bandsEnergy()-49,56|
|57|tGravityAcc-energy()-X|338|fBodyAcc-bandsEnergy()-57,64|
|58|tGravityAcc-energy()-Y|339|fBodyAcc-bandsEnergy()-1,16|
|59|tGravityAcc-energy()-Z|340|fBodyAcc-bandsEnergy()-17,32|
|60|tGravityAcc-iqr()-X|341|fBodyAcc-bandsEnergy()-33,48|
|61|tGravityAcc-iqr()-Y|342|fBodyAcc-bandsEnergy()-49,64|
|62|tGravityAcc-iqr()-Z|343|fBodyAcc-bandsEnergy()-1,24|
|63|tGravityAcc-entropy()-X|344|fBodyAcc-bandsEnergy()-25,48|
|64|tGravityAcc-entropy()-Y|345|fBodyAccJerk-mean()-X|
|65|tGravityAcc-entropy()-Z|346|fBodyAccJerk-mean()-Y|
|66|tGravityAcc-arCoeff()-X,1|347|fBodyAccJerk-mean()-Z|
|67|tGravityAcc-arCoeff()-X,2|348|fBodyAccJerk-std()-X|
|68|tGravityAcc-arCoeff()-X,3|349|fBodyAccJerk-std()-Y|
|69|tGravityAcc-arCoeff()-X,4|350|fBodyAccJerk-std()-Z|
|70|tGravityAcc-arCoeff()-Y,1|351|fBodyAccJerk-mad()-X|
|71|tGravityAcc-arCoeff()-Y,2|352|fBodyAccJerk-mad()-Y|
|72|tGravityAcc-arCoeff()-Y,3|353|fBodyAccJerk-mad()-Z|
|73|tGravityAcc-arCoeff()-Y,4|354|fBodyAccJerk-max()-X|
|74|tGravityAcc-arCoeff()-Z,1|355|fBodyAccJerk-max()-Y|
|75|tGravityAcc-arCoeff()-Z,2|356|fBodyAccJerk-max()-Z|
|76|tGravityAcc-arCoeff()-Z,3|357|fBodyAccJerk-min()-X|
|77|tGravityAcc-arCoeff()-Z,4|358|fBodyAccJerk-min()-Y|
|78|tGravityAcc-correlation()-X,Y|359|fBodyAccJerk-min()-Z|
|79|tGravityAcc-correlation()-X,Z|360|fBodyAccJerk-sma()|
|80|tGravityAcc-correlation()-Y,Z|361|fBodyAccJerk-energy()-X|
|81|tBodyAccJerk-mean()-X|362|fBodyAccJerk-energy()-Y|
|82|tBodyAccJerk-mean()-Y|363|fBodyAccJerk-energy()-Z|
|83|tBodyAccJerk-mean()-Z|364|fBodyAccJerk-iqr()-X|
|84|tBodyAccJerk-std()-X|365|fBodyAccJerk-iqr()-Y|
|85|tBodyAccJerk-std()-Y|366|fBodyAccJerk-iqr()-Z|
|86|tBodyAccJerk-std()-Z|367|fBodyAccJerk-entropy()-X|
|87|tBodyAccJerk-mad()-X|368|fBodyAccJerk-entropy()-Y|
|88|tBodyAccJerk-mad()-Y|369|fBodyAccJerk-entropy()-Z|
|89|tBodyAccJerk-mad()-Z|370|fBodyAccJerk-maxInds-X|
|90|tBodyAccJerk-max()-X|371|fBodyAccJerk-maxInds-Y|
|91|tBodyAccJerk-max()-Y|372|fBodyAccJerk-maxInds-Z|
|92|tBodyAccJerk-max()-Z|373|fBodyAccJerk-meanFreq()-X|
|93|tBodyAccJerk-min()-X|374|fBodyAccJerk-meanFreq()-Y|
|94|tBodyAccJerk-min()-Y|375|fBodyAccJerk-meanFreq()-Z|
|95|tBodyAccJerk-min()-Z|376|fBodyAccJerk-skewness()-X|
|96|tBodyAccJerk-sma()|377|fBodyAccJerk-kurtosis()-X|
|97|tBodyAccJerk-energy()-X|378|fBodyAccJerk-skewness()-Y|
|98|tBodyAccJerk-energy()-Y|379|fBodyAccJerk-kurtosis()-Y|
|99|tBodyAccJerk-energy()-Z|380|fBodyAccJerk-skewness()-Z|
|100|tBodyAccJerk-iqr()-X|381|fBodyAccJerk-kurtosis()-Z|
|101|tBodyAccJerk-iqr()-Y|382|fBodyAccJerk-bandsEnergy()-1,8|
|102|tBodyAccJerk-iqr()-Z|383|fBodyAccJerk-bandsEnergy()-9,16|
|103|tBodyAccJerk-entropy()-X|384|fBodyAccJerk-bandsEnergy()-17,24|
|104|tBodyAccJerk-entropy()-Y|385|fBodyAccJerk-bandsEnergy()-25,32|
|105|tBodyAccJerk-entropy()-Z|386|fBodyAccJerk-bandsEnergy()-33,40|
|106|tBodyAccJerk-arCoeff()-X,1|387|fBodyAccJerk-bandsEnergy()-41,48|
|107|tBodyAccJerk-arCoeff()-X,2|388|fBodyAccJerk-bandsEnergy()-49,56|
|108|tBodyAccJerk-arCoeff()-X,3|389|fBodyAccJerk-bandsEnergy()-57,64|
|109|tBodyAccJerk-arCoeff()-X,4|390|fBodyAccJerk-bandsEnergy()-1,16|
|110|tBodyAccJerk-arCoeff()-Y,1|391|fBodyAccJerk-bandsEnergy()-17,32|
|111|tBodyAccJerk-arCoeff()-Y,2|392|fBodyAccJerk-bandsEnergy()-33,48|
|112|tBodyAccJerk-arCoeff()-Y,3|393|fBodyAccJerk-bandsEnergy()-49,64|
|113|tBodyAccJerk-arCoeff()-Y,4|394|fBodyAccJerk-bandsEnergy()-1,24|
|114|tBodyAccJerk-arCoeff()-Z,1|395|fBodyAccJerk-bandsEnergy()-25,48|
|115|tBodyAccJerk-arCoeff()-Z,2|396|fBodyAccJerk-bandsEnergy()-1,8|
|116|tBodyAccJerk-arCoeff()-Z,3|397|fBodyAccJerk-bandsEnergy()-9,16|
|117|tBodyAccJerk-arCoeff()-Z,4|398|fBodyAccJerk-bandsEnergy()-17,24|
|118|tBodyAccJerk-correlation()-X,Y|399|fBodyAccJerk-bandsEnergy()-25,32|
|119|tBodyAccJerk-correlation()-X,Z|400|fBodyAccJerk-bandsEnergy()-33,40|
|120|tBodyAccJerk-correlation()-Y,Z|401|fBodyAccJerk-bandsEnergy()-41,48|
|121|tBodyGyro-mean()-X|402|fBodyAccJerk-bandsEnergy()-49,56|
|122|tBodyGyro-mean()-Y|403|fBodyAccJerk-bandsEnergy()-57,64|
|123|tBodyGyro-mean()-Z|404|fBodyAccJerk-bandsEnergy()-1,16|
|124|tBodyGyro-std()-X|405|fBodyAccJerk-bandsEnergy()-17,32|
|125|tBodyGyro-std()-Y|406|fBodyAccJerk-bandsEnergy()-33,48|
|126|tBodyGyro-std()-Z|407|fBodyAccJerk-bandsEnergy()-49,64|
|127|tBodyGyro-mad()-X|408|fBodyAccJerk-bandsEnergy()-1,24|
|128|tBodyGyro-mad()-Y|409|fBodyAccJerk-bandsEnergy()-25,48|
|129|tBodyGyro-mad()-Z|410|fBodyAccJerk-bandsEnergy()-1,8|
|130|tBodyGyro-max()-X|411|fBodyAccJerk-bandsEnergy()-9,16|
|131|tBodyGyro-max()-Y|412|fBodyAccJerk-bandsEnergy()-17,24|
|132|tBodyGyro-max()-Z|413|fBodyAccJerk-bandsEnergy()-25,32|
|133|tBodyGyro-min()-X|414|fBodyAccJerk-bandsEnergy()-33,40|
|134|tBodyGyro-min()-Y|415|fBodyAccJerk-bandsEnergy()-41,48|
|135|tBodyGyro-min()-Z|416|fBodyAccJerk-bandsEnergy()-49,56|
|136|tBodyGyro-sma()|417|fBodyAccJerk-bandsEnergy()-57,64|
|137|tBodyGyro-energy()-X|418|fBodyAccJerk-bandsEnergy()-1,16|
|138|tBodyGyro-energy()-Y|419|fBodyAccJerk-bandsEnergy()-17,32|
|139|tBodyGyro-energy()-Z|420|fBodyAccJerk-bandsEnergy()-33,48|
|140|tBodyGyro-iqr()-X|421|fBodyAccJerk-bandsEnergy()-49,64|
|141|tBodyGyro-iqr()-Y|422|fBodyAccJerk-bandsEnergy()-1,24|
|142|tBodyGyro-iqr()-Z|423|fBodyAccJerk-bandsEnergy()-25,48|
|143|tBodyGyro-entropy()-X|424|fBodyGyro-mean()-X|
|144|tBodyGyro-entropy()-Y|425|fBodyGyro-mean()-Y|
|145|tBodyGyro-entropy()-Z|426|fBodyGyro-mean()-Z|
|146|tBodyGyro-arCoeff()-X,1|427|fBodyGyro-std()-X|
|147|tBodyGyro-arCoeff()-X,2|428|fBodyGyro-std()-Y|
|148|tBodyGyro-arCoeff()-X,3|429|fBodyGyro-std()-Z|
|149|tBodyGyro-arCoeff()-X,4|430|fBodyGyro-mad()-X|
|150|tBodyGyro-arCoeff()-Y,1|431|fBodyGyro-mad()-Y|
|151|tBodyGyro-arCoeff()-Y,2|432|fBodyGyro-mad()-Z|
|152|tBodyGyro-arCoeff()-Y,3|433|fBodyGyro-max()-X|
|153|tBodyGyro-arCoeff()-Y,4|434|fBodyGyro-max()-Y|
|154|tBodyGyro-arCoeff()-Z,1|435|fBodyGyro-max()-Z|
|155|tBodyGyro-arCoeff()-Z,2|436|fBodyGyro-min()-X|
|156|tBodyGyro-arCoeff()-Z,3|437|fBodyGyro-min()-Y|
|157|tBodyGyro-arCoeff()-Z,4|438|fBodyGyro-min()-Z|
|158|tBodyGyro-correlation()-X,Y|439|fBodyGyro-sma()|
|159|tBodyGyro-correlation()-X,Z|440|fBodyGyro-energy()-X|
|160|tBodyGyro-correlation()-Y,Z|441|fBodyGyro-energy()-Y|
|161|tBodyGyroJerk-mean()-X|442|fBodyGyro-energy()-Z|
|162|tBodyGyroJerk-mean()-Y|443|fBodyGyro-iqr()-X|
|163|tBodyGyroJerk-mean()-Z|444|fBodyGyro-iqr()-Y|
|164|tBodyGyroJerk-std()-X|445|fBodyGyro-iqr()-Z|
|165|tBodyGyroJerk-std()-Y|446|fBodyGyro-entropy()-X|
|166|tBodyGyroJerk-std()-Z|447|fBodyGyro-entropy()-Y|
|167|tBodyGyroJerk-mad()-X|448|fBodyGyro-entropy()-Z|
|168|tBodyGyroJerk-mad()-Y|449|fBodyGyro-maxInds-X|
|169|tBodyGyroJerk-mad()-Z|450|fBodyGyro-maxInds-Y|
|170|tBodyGyroJerk-max()-X|451|fBodyGyro-maxInds-Z|
|171|tBodyGyroJerk-max()-Y|452|fBodyGyro-meanFreq()-X|
|172|tBodyGyroJerk-max()-Z|453|fBodyGyro-meanFreq()-Y|
|173|tBodyGyroJerk-min()-X|454|fBodyGyro-meanFreq()-Z|
|174|tBodyGyroJerk-min()-Y|455|fBodyGyro-skewness()-X|
|175|tBodyGyroJerk-min()-Z|456|fBodyGyro-kurtosis()-X|
|176|tBodyGyroJerk-sma()|457|fBodyGyro-skewness()-Y|
|177|tBodyGyroJerk-energy()-X|458|fBodyGyro-kurtosis()-Y|
|178|tBodyGyroJerk-energy()-Y|459|fBodyGyro-skewness()-Z|
|179|tBodyGyroJerk-energy()-Z|460|fBodyGyro-kurtosis()-Z|
|180|tBodyGyroJerk-iqr()-X|461|fBodyGyro-bandsEnergy()-1,8|
|181|tBodyGyroJerk-iqr()-Y|462|fBodyGyro-bandsEnergy()-9,16|
|182|tBodyGyroJerk-iqr()-Z|463|fBodyGyro-bandsEnergy()-17,24|
|183|tBodyGyroJerk-entropy()-X|464|fBodyGyro-bandsEnergy()-25,32|
|184|tBodyGyroJerk-entropy()-Y|465|fBodyGyro-bandsEnergy()-33,40|
|185|tBodyGyroJerk-entropy()-Z|466|fBodyGyro-bandsEnergy()-41,48|
|186|tBodyGyroJerk-arCoeff()-X,1|467|fBodyGyro-bandsEnergy()-49,56|
|187|tBodyGyroJerk-arCoeff()-X,2|468|fBodyGyro-bandsEnergy()-57,64|
|188|tBodyGyroJerk-arCoeff()-X,3|469|fBodyGyro-bandsEnergy()-1,16|
|189|tBodyGyroJerk-arCoeff()-X,4|470|fBodyGyro-bandsEnergy()-17,32|
|190|tBodyGyroJerk-arCoeff()-Y,1|471|fBodyGyro-bandsEnergy()-33,48|
|191|tBodyGyroJerk-arCoeff()-Y,2|472|fBodyGyro-bandsEnergy()-49,64|
|192|tBodyGyroJerk-arCoeff()-Y,3|473|fBodyGyro-bandsEnergy()-1,24|
|193|tBodyGyroJerk-arCoeff()-Y,4|474|fBodyGyro-bandsEnergy()-25,48|
|194|tBodyGyroJerk-arCoeff()-Z,1|475|fBodyGyro-bandsEnergy()-1,8|
|195|tBodyGyroJerk-arCoeff()-Z,2|476|fBodyGyro-bandsEnergy()-9,16|
|196|tBodyGyroJerk-arCoeff()-Z,3|477|fBodyGyro-bandsEnergy()-17,24|
|197|tBodyGyroJerk-arCoeff()-Z,4|478|fBodyGyro-bandsEnergy()-25,32|
|198|tBodyGyroJerk-correlation()-X,Y|479|fBodyGyro-bandsEnergy()-33,40|
|199|tBodyGyroJerk-correlation()-X,Z|480|fBodyGyro-bandsEnergy()-41,48|
|200|tBodyGyroJerk-correlation()-Y,Z|481|fBodyGyro-bandsEnergy()-49,56|
|201|tBodyAccMag-mean()|482|fBodyGyro-bandsEnergy()-57,64|
|202|tBodyAccMag-std()|483|fBodyGyro-bandsEnergy()-1,16|
|203|tBodyAccMag-mad()|484|fBodyGyro-bandsEnergy()-17,32|
|204|tBodyAccMag-max()|485|fBodyGyro-bandsEnergy()-33,48|
|205|tBodyAccMag-min()|486|fBodyGyro-bandsEnergy()-49,64|
|206|tBodyAccMag-sma()|487|fBodyGyro-bandsEnergy()-1,24|
|207|tBodyAccMag-energy()|488|fBodyGyro-bandsEnergy()-25,48|
|208|tBodyAccMag-iqr()|489|fBodyGyro-bandsEnergy()-1,8|
|209|tBodyAccMag-entropy()|490|fBodyGyro-bandsEnergy()-9,16|
|210|tBodyAccMag-arCoeff()1|491|fBodyGyro-bandsEnergy()-17,24|
|211|tBodyAccMag-arCoeff()2|492|fBodyGyro-bandsEnergy()-25,32|
|212|tBodyAccMag-arCoeff()3|493|fBodyGyro-bandsEnergy()-33,40|
|213|tBodyAccMag-arCoeff()4|494|fBodyGyro-bandsEnergy()-41,48|
|214|tGravityAccMag-mean()|495|fBodyGyro-bandsEnergy()-49,56|
|215|tGravityAccMag-std()|496|fBodyGyro-bandsEnergy()-57,64|
|216|tGravityAccMag-mad()|497|fBodyGyro-bandsEnergy()-1,16|
|217|tGravityAccMag-max()|498|fBodyGyro-bandsEnergy()-17,32|
|218|tGravityAccMag-min()|499|fBodyGyro-bandsEnergy()-33,48|
|219|tGravityAccMag-sma()|500|fBodyGyro-bandsEnergy()-49,64|
|220|tGravityAccMag-energy()|501|fBodyGyro-bandsEnergy()-1,24|
|221|tGravityAccMag-iqr()|502|fBodyGyro-bandsEnergy()-25,48|
|222|tGravityAccMag-entropy()|503|fBodyAccMag-mean()|
|223|tGravityAccMag-arCoeff()1|504|fBodyAccMag-std()|
|224|tGravityAccMag-arCoeff()2|505|fBodyAccMag-mad()|
|225|tGravityAccMag-arCoeff()3|506|fBodyAccMag-max()|
|226|tGravityAccMag-arCoeff()4|507|fBodyAccMag-min()|
|227|tBodyAccJerkMag-mean()|508|fBodyAccMag-sma()|
|228|tBodyAccJerkMag-std()|509|fBodyAccMag-energy()|
|229|tBodyAccJerkMag-mad()|510|fBodyAccMag-iqr()|
|230|tBodyAccJerkMag-max()|511|fBodyAccMag-entropy()|
|231|tBodyAccJerkMag-min()|512|fBodyAccMag-maxInds|
|232|tBodyAccJerkMag-sma()|513|fBodyAccMag-meanFreq()|
|233|tBodyAccJerkMag-energy()|514|fBodyAccMag-skewness()|
|234|tBodyAccJerkMag-iqr()|515|fBodyAccMag-kurtosis()|
|235|tBodyAccJerkMag-entropy()|516|fBodyBodyAccJerkMag-mean()|
|236|tBodyAccJerkMag-arCoeff()1|517|fBodyBodyAccJerkMag-std()|
|237|tBodyAccJerkMag-arCoeff()2|518|fBodyBodyAccJerkMag-mad()|
|238|tBodyAccJerkMag-arCoeff()3|519|fBodyBodyAccJerkMag-max()|
|239|tBodyAccJerkMag-arCoeff()4|520|fBodyBodyAccJerkMag-min()|
|240|tBodyGyroMag-mean()|521|fBodyBodyAccJerkMag-sma()|
|241|tBodyGyroMag-std()|522|fBodyBodyAccJerkMag-energy()|
|242|tBodyGyroMag-mad()|523|fBodyBodyAccJerkMag-iqr()|
|243|tBodyGyroMag-max()|524|fBodyBodyAccJerkMag-entropy()|
|244|tBodyGyroMag-min()|525|fBodyBodyAccJerkMag-maxInds|
|245|tBodyGyroMag-sma()|526|fBodyBodyAccJerkMag-meanFreq()|
|246|tBodyGyroMag-energy()|527|fBodyBodyAccJerkMag-skewness()|
|247|tBodyGyroMag-iqr()|528|fBodyBodyAccJerkMag-kurtosis()|
|248|tBodyGyroMag-entropy()|529|fBodyBodyGyroMag-mean()|
|249|tBodyGyroMag-arCoeff()1|530|fBodyBodyGyroMag-std()|
|250|tBodyGyroMag-arCoeff()2|531|fBodyBodyGyroMag-mad()|
|251|tBodyGyroMag-arCoeff()3|532|fBodyBodyGyroMag-max()|
|252|tBodyGyroMag-arCoeff()4|533|fBodyBodyGyroMag-min()|
|253|tBodyGyroJerkMag-mean()|534|fBodyBodyGyroMag-sma()|
|254|tBodyGyroJerkMag-std()|535|fBodyBodyGyroMag-energy()|
|255|tBodyGyroJerkMag-mad()|536|fBodyBodyGyroMag-iqr()|
|256|tBodyGyroJerkMag-max()|537|fBodyBodyGyroMag-entropy()|
|257|tBodyGyroJerkMag-min()|538|fBodyBodyGyroMag-maxInds|
|258|tBodyGyroJerkMag-sma()|539|fBodyBodyGyroMag-meanFreq()|
|259|tBodyGyroJerkMag-energy()|540|fBodyBodyGyroMag-skewness()|
|260|tBodyGyroJerkMag-iqr()|541|fBodyBodyGyroMag-kurtosis()|
|261|tBodyGyroJerkMag-entropy()|542|fBodyBodyGyroJerkMag-mean()|
|262|tBodyGyroJerkMag-arCoeff()1|543|fBodyBodyGyroJerkMag-std()|
|263|tBodyGyroJerkMag-arCoeff()2|544|fBodyBodyGyroJerkMag-mad()|
|264|tBodyGyroJerkMag-arCoeff()3|545|fBodyBodyGyroJerkMag-max()|
|265|tBodyGyroJerkMag-arCoeff()4|546|fBodyBodyGyroJerkMag-min()|
|266|fBodyAcc-mean()-X|547|fBodyBodyGyroJerkMag-sma()|
|267|fBodyAcc-mean()-Y|548|fBodyBodyGyroJerkMag-energy()|
|268|fBodyAcc-mean()-Z|549|fBodyBodyGyroJerkMag-iqr()|
|269|fBodyAcc-std()-X|550|fBodyBodyGyroJerkMag-entropy()|
|270|fBodyAcc-std()-Y|551|fBodyBodyGyroJerkMag-maxInds|
|271|fBodyAcc-std()-Z|552|fBodyBodyGyroJerkMag-meanFreq()|
|272|fBodyAcc-mad()-X|553|fBodyBodyGyroJerkMag-skewness()|
|273|fBodyAcc-mad()-Y|554|fBodyBodyGyroJerkMag-kurtosis()|
|274|fBodyAcc-mad()-Z|555|angle(tBodyAccMean,gravity)|
|275|fBodyAcc-max()-X|556|angle(tBodyAccJerkMean),gravityMean)|
|276|fBodyAcc-max()-Y|557|angle(tBodyGyroMean,gravityMean)|
|277|fBodyAcc-max()-Z|558|angle(tBodyGyroJerkMean,gravityMean)|
|278|fBodyAcc-min()-X|559|angle(X,gravityMean)|
|279|fBodyAcc-min()-Y|560|angle(Y,gravityMean)|
|280|fBodyAcc-min()-Z|561|angle(Z,gravityMean)|
|281|fBodyAcc-sma()|282|fBodyAcc-energy()-X|
  
  
Our first goal is to obtain a data frame, **wDataFrame**, of measurements on the **mean** and **standard deviation** for each measurement.  
From **wDataFrame** we are going to obtain a data frame, **tDataFrame**,  with the average of each variable for each **activity** and each **subject**.   

The variables in our two data frames, **wDataFrame** and **tDataFrame**, are:
    


|Nº|Name|Type|
|----:|:--------------|:----|
|1|subject|int|
|2|activity|char|
|3|tBodyAcc-mean()-X|float|
|4|tBodyAcc-mean()-Y|float|
|5|tBodyAcc-mean()-Z|float|
|6|tBodyAcc-std()-X|float|
|7|tBodyAcc-std()-Y|float|
|8|tBodyAcc-std()-Z|float|
|9|tGravityAcc-mean()-X|float|
|10|tGravityAcc-mean()-Y|float|
|11|tGravityAcc-mean()-Z|float|
|12|tGravityAcc-std()-X|float|
|13|tGravityAcc-std()-Y|float|
|14|tGravityAcc-std()-Z|float|
|15|tBodyAccJerk-mean()-X|float|
|16|tBodyAccJerk-mean()-Y|float|
|17|tBodyAccJerk-mean()-Z|float|
|18|tBodyAccJerk-std()-X|float|
|19|tBodyAccJerk-std()-Y|float|
|20|tBodyAccJerk-std()-Z|float|
|21|tBodyGyro-mean()-X|float|
|22|tBodyGyro-mean()-Y|float|
|23|tBodyGyro-mean()-Z|float|
|24|tBodyGyro-std()-X|float|
|25|tBodyGyro-std()-Y|float|
|26|tBodyGyro-std()-Z|float|
|27|tBodyGyroJerk-mean()-X|float|
|28|tBodyGyroJerk-mean()-Y|float|
|29|tBodyGyroJerk-mean()-Z|float|
|30|tBodyGyroJerk-std()-X|float|
|31|tBodyGyroJerk-std()-Y|float|
|32|tBodyGyroJerk-std()-Z|float|
|33|tBodyAccMag-mean()|float|
|34|tBodyAccMag-std()|float|
|35|tGravityAccMag-mean()|float|
|36|tGravityAccMag-std()|float|
|37|tBodyAccJerkMag-mean()|float|
|38|tBodyAccJerkMag-std()|float|
|39|tBodyGyroMag-mean()|float|
|40|tBodyGyroMag-std()|float|
|41|tBodyGyroJerkMag-mean()|float|
|42|tBodyGyroJerkMag-std()|float|
|43|fBodyAcc-mean()-X|float|
|44|fBodyAcc-mean()-Y|float|
|45|fBodyAcc-mean()-Z|float|
|46|fBodyAcc-std()-X|float|
|47|fBodyAcc-std()-Y|float|
|48|fBodyAcc-std()-Z|float|
|49|fBodyAcc-meanFreq()-X|float|
|50|fBodyAcc-meanFreq()-Y|float|
|51|fBodyAcc-meanFreq()-Z|float|
|52|fBodyAccJerk-mean()-X|float|
|53|fBodyAccJerk-mean()-Y|float|
|54|fBodyAccJerk-mean()-Z|float|
|55|fBodyAccJerk-std()-X|float|
|56|fBodyAccJerk-std()-Y|float|
|57|fBodyAccJerk-std()-Z|float|
|58|fBodyAccJerk-meanFreq()-X|float|
|59|fBodyAccJerk-meanFreq()-Y|float|
|60|fBodyAccJerk-meanFreq()-Z|float|
|61|fBodyGyro-mean()-X|float|
|62|fBodyGyro-mean()-Y|float|
|63|fBodyGyro-mean()-Z|float|
|64|fBodyGyro-std()-X|float|
|65|fBodyGyro-std()-Y|float|
|66|fBodyGyro-std()-Z|float|
|67|fBodyGyro-meanFreq()-X|float|
|68|fBodyGyro-meanFreq()-Y|float|
|69|fBodyGyro-meanFreq()-Z|float|
|70|fBodyAccMag-mean()|float|
|71|fBodyAccMag-std()|float|
|72|fBodyAccMag-meanFreq()|float|
|73|fBodyBodyAccJerkMag-mean()|float|
|74|fBodyBodyAccJerkMag-std()|float|
|75|fBodyBodyAccJerkMag-meanFreq()|float|
|76|fBodyBodyGyroMag-mean()|float|
|77|fBodyBodyGyroMag-std()|float|
|78|fBodyBodyGyroMag-meanFreq()|float|
|79|fBodyBodyGyroJerkMag-mean()|float|
|80|fBodyBodyGyroJerkMag-std()|float|
|81|fBodyBodyGyroJerkMag-meanFreq()|float|

