getBasicInfo <- function(){
    activitiesLabels <- scan_act_labels()
    features <- scan_features()
    featuresInfo <- scan_features_info()
    list(activitiesLabels, features, featuresInfo)
}
scan_act_labels <- function(wdPath = "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset"){
    
    fileName = file =  paste(wdPath, "activity_labels.txt", sep = "/")
    act <-scan(file = fileName, what = character())
    act_lab <- character()
    for(i in 1:6) 
        act_lab[i] <- act[2 * i]
    act_lab
}

scan_features <- function(wdPath = "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset"){
    
    fileName = paste(wdPath, "features.txt", sep = "/")
    #scan(file = fileName, what = character())
    feat <- readLines(fileName)
    features <- character()
    for(i in seq(1, 1122, 2)){
        features[1 + i / 2] <- paste(feat[i], feat[i+1], sep = "-")
    }
    features
} 

scan_features_info <- function(wdPath = "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset"){
    
    fileName = paste(wdPath, "features_info.txt", sep = "/")
    scan(file = fileName, what = character())
}

getSubjectXandY <- function(typ = "train"){
    subject <- scanSubject(typ)
    X <- scanX(typ)
    y <- scanY(typ)
    list(subject, X, y)
}
scan_arch <- function(typ = "train"){
    if(typ == "train"){
        wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/train/Inertial Signals"
        bgxt = paste(wdPath, "body_gyro_x_train.txt", sep = "/")
        bgyt = paste(wdPath, "body_gyro_y_train.txt", sep = "/")
        bgzt = paste(wdPath, "body_gyro_z_train.txt", sep = "/")
        baxt = paste(wdPath, "body_acc_x_train.txt", sep = "/")
        bayt = paste(wdPath, "body_acc_y_train.txt", sep = "/")
        bazt = paste(wdPath, "body_acc_z_train.txt", sep = "/")
        taxt = paste(wdPath, "total_acc_x_train.txt", sep = "/")
        tayt = paste(wdPath, "total_acc_y_train.txt", sep = "/")
        tazt = paste(wdPath, "total_acc_z_train.txt", sep = "/")
    }
    if(typ == "test"){
        wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/test/Inertial Signals"
        bgxt = paste(wdPath, "body_gyro_x_test.txt", sep = "/")
        bgyt = paste(wdPath, "body_gyro_y_test.txt", sep = "/")
        bgzt = paste(wdPath, "body_gyro_z_test.txt", sep = "/")
        baxt = paste(wdPath, "body_acc_x_test.txt", sep = "/")
        bayt = paste(wdPath, "body_acc_y_test.txt", sep = "/")
        bazt = paste(wdPath, "body_acc_z_test.txt", sep = "/")
        taxt = paste(wdPath, "total_acc_x_test.txt", sep = "/")
        tayt = paste(wdPath, "total_acc_y_test.txt", sep = "/")
        tazt = paste(wdPath, "total_acc_z_test.txt", sep = "/")
    }
    
    body_gyro_x <- scan(file =  bgxt, what = double())

    body_gyro_y <- scan(file =  bgyt, what = double())
    
    body_gyro_z <- scan(file =  bgzt, what = double())

    body_acc_x <- scan(file =  baxt, what = double())
    
    body_acc_y <- scan(file =  bayt, what = double())
    
    body_acc_z <- scan(file =  bazt, what = double())

    total_acc_x <- scan(file =  taxt, what = double())
    
    total_acc_y <- scan(file =  tayt, what = double())
    
    total_acc_z <- scan(file =  tazt, what = double())
    
    data.frame(body_gyro_x, body_gyro_y, body_gyro_z,
               body_acc_x, body_acc_y, body_acc_z,
               total_acc_x, total_acc_y, total_acc_z)
}    

merge_train_and_test <- function(train = train, test = test){
    rbind(train, test)
}
scanX <- function(typ = "train"){
    #
    # READS x_test OR x_train
    #
    if(typ == "test"){
        wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/test"
        xfile = paste(wdPath, "X_test.txt", sep = "/")
    }
    if(typ == "train"){
        wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/train"
        xfile = paste(wdPath, "X_train.txt", sep = "/")
    }
    
    scan(file = xfile)
}
scanSubject_test <- function(){
    wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/test"
    xtest = paste(wdPath, "subject_test.txt", sep = "/")
    scan(file = xtest)
}
scanSubject_train <- function(){
    wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/train"
    xtrain = paste(wdPath, "subject_train.txt", sep = "/")
    scan(file = xtrain)
}
scanY <- function(typ = "train"){
    result <- integer()
    if (typ == "test"){
        wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/test"
        ytest = paste(wdPath, "y_test.txt", sep = "/")
        result <- scan(file = ytest)
    }
    if (typ == "train"){
        wdPath <- "/lerigar/EDX/DSCI 03 Getting and Cleaning Data/prj/UCI HAR Dataset/train"
        ytrain = paste(wdPath, "y_train.txt", sep = "/")
        result <- scan(file = ytrain)
    }
    result
}

createColAct <- function(typ = "train"){
    colAct <- character()
    for(i in 1:length(y_train)){
        colAct[i] <- actNames[y_train[i]]
    }
    colAct
}
leerLineas <- function(conexion, nro = -1L){
    readLines(con = conexion, n = nro )
}
loadInertialSignals <- function(dataSet){
    for(i in 1:dim(data)[1]){
        total_acc_x <- numeric()
        total_acc_y <- numeric()
        total_acc_z <- numeric()
        body_acc_x <- numeric()
        body_acc_y <- numeric()
        body_acc_z <- numeric()
        body_gyro_x <- numeric()
        body_gyro_y <- numeric()
        body_gyro_z <- numeric()
        for(j in 1:128){
            t <- 1 + 128 * (i -1)
            total_acc_x[j] <- train["total_acc_x"][t + j]
            total_acc_y[j] <- train["total_acc_y"][t + j]
            total_acc_z[j] <- train["total_acc_z"][t + j]
            body_acc_x[j] <- train["body_acc_x"][t + j]
            body_acc_y[j] <- train["body_acc_y"][t + j]
            body_acc_z[j] <- train["body_acc_y"][t + j]
            body_gyro_x[j] <- train["body_gyro_x"][t + j]
            body_gyro_y[j] <- train["body_gyro_y"][t + j]
            body_gyro_z[j] <- train["body_gyro_z"][t + j]
            
            
        }

        InertialSignals <- data.frame(total_acc_x, total_acc_y, total_acc_z, 
                                      body_acc_x, body_acc_y, body_acc_z,
                                      body_gyro_x, body_gyro_y, body_gyro_z) 
        features <- numeric()
        for(i in 1:561){
            
        }
    }
}
createDataSet <- function(typ = "train"){
    result <- data.frame()
    lenSet <- 0
    activ <- character()
    if(typ == "train"){
        lenSet <- length(Subject_train)
        for(i in 1:lenSet){
            activ[i] <- actNames[y_train]
        }
        features <- load_features(typ = "train")
        InertialSignals <- load_inertial_signals(typ = "train")
        result <- data.frame(Subject_test, activ, features, InertialSignals, stringsAsFactors = FALSE)
    }
    if(typ == "test"){
        lenSet <- length(Subject_test)
        for(i in 1:lenSet){
            activ[i] <- actNames[y_test]
        }
        features <- load_features(typ = "test")
        InertialSignals <- load_inertial_signals(typ = "test")
        result <- data.frame(Subject_test, activ, features, InertialSignals, stringsAsFactors = FALSE)
    }
    result
}
load_features <- function(typ = "train"){
    lenSet <- 0
    featList <- list()
    if(typ == "train"){
        lenSet <- length(X_train)
        subjMembs <- lenSet / 561
        subjfeatures <- data.frame()
        for(i in 1:561){
            from <- (i - 1) * subjMembs
            featList[features[i]] <- numeric()
            for(j in 1:561){
                featList[features[i]][from + j] <-
                    x_train[j]
                
            }
        }
     }
    if(typ == "test"){
        lenSet <- length(X_test)
        subjMembs <- lenSet / 561
        subjfeatures <- data.frame()
        for(i in 1:561){
            from <- (i - 1) * subjMembs
            featList[features[i]] <- numeric()
            for(j in 1:561){
                featList[features[i]][from + j] <-
                    x_test[j]
                
            }
        }
    }
    subjfeatures
}

load_inertial_signals <- function(typ = "train"){
    lenSet <- 0
    inerSigList <- list()
    if(typ == "train"){
        lenSet <- length(Subject_train)
        subjfeatures <- data.frame()
        inerSigNames <- c("total_acc_x", "total_acc_y", "total_acc_z", 
                          "body_acc_x", "body_acc_y", "body_acc_z", 
                          "body_gyro_x","body_gyro_y", "body_gyro_z")
        for(i in 1:128){
            from <- (i - 1) * subjMembs
            ltotal_acc_x <- paste("total_acc_x", as.character(i), sep = ".")
            inerSigList[ltotal_acc_x] <- numeric()
            ltotal_acc_y <- paste("total_acc_y", as.character(i), sep = ".")
            inerSigList[ltotal_acc_y] <- numeric()
            ltotal_acc_z <- paste("total_acc_z", as.character(i), sep = ".")
            inerSigList[ltotal_acc_z] <- numeric()

            lbody_acc_x <- paste("body_acc_x", as.character(i), sep = ".")
            inerSigList[lbody_acc_x] <- numeric()
            lbody_acc_y <- paste("body_acc_y", as.character(i), sep = ".")
            inerSigList[lbody_acc_y] <- numeric()
            lbody_acc_z <- paste("body_acc_z", as.character(i), sep = ".")
            inerSigList[lbody_acc_z] <- numeric()

            lgyro_acc_x <- paste("gyro_acc_x", as.character(i), sep = ".")
            inerSigList[lgyro_acc_x] <- numeric()
            lgyro_acc_y <- paste("gyro_acc_y", as.character(i), sep = ".")
            inerSigList[lgyro_acc_y] <- numeric()
            lgyro_acc_z <- paste("gyro_acc_z", as.character(i), sep = ".")
            inerSigList[lgyro_acc_z] <- numeric()
            
            for(j in 1:lenSet){
                indj <- (j - 1) * 128 + 1
                inerSigList[ltotal_acc_x] <- InertialSig_train[total_acc_x][j]
                inerSigList[ltotal_acc_y] <- InertialSig_train[total_acc_y][j]
                inerSigList[ltotal_acc_z] <- InertialSig_train[total_acc_z][j]
                
                inerSigList[lbody_acc_x] <- InertialSig_train[body_acc_x][j]
                inerSigList[lbody_acc_y] <- InertialSig_train[body_acc_y][j]
                inerSigList[lbody_acc_z] <- InertialSig_train[body_acc_z][j]
                
                inerSigList[lgyro_acc_x] <- InertialSig_train[gyro_acc_x][j]
                inerSigList[lgyro_acc_y] <- InertialSig_train[gyro_acc_y][j]
                inerSigList[lgyro_acc_z] <- InertialSig_train[gyro_acc_z][j]
                
            }
        }
    }
    
    if(typ == "test"){
        lenSet <- length(Subject_test)
        subjfeatures <- data.frame()
        inerSigNames <- c("total_acc_x", "total_acc_y", "total_acc_z", 
                          "body_acc_x", "body_acc_y", "body_acc_z", 
                          "body_gyro_x","body_gyro_y", "body_gyro_z")
        for(i in 1:128){
            from <- (i - 1) * subjMembs
            ltotal_acc_x <- paste("total_acc_x", as.character(i), sep = ".")
            inerSigList[ltotal_acc_x] <- numeric()
            ltotal_acc_y <- paste("total_acc_y", as.character(i), sep = ".")
            inerSigList[ltotal_acc_y] <- numeric()
            ltotal_acc_z <- paste("total_acc_z", as.character(i), sep = ".")
            inerSigList[ltotal_acc_z] <- numeric()
            
            lbody_acc_x <- paste("body_acc_x", as.character(i), sep = ".")
            inerSigList[lbody_acc_x] <- numeric()
            lbody_acc_y <- paste("body_acc_y", as.character(i), sep = ".")
            inerSigList[lbody_acc_y] <- numeric()
            lbody_acc_z <- paste("body_acc_z", as.character(i), sep = ".")
            inerSigList[lbody_acc_z] <- numeric()
            
            lgyro_acc_x <- paste("gyro_acc_x", as.character(i), sep = ".")
            inerSigList[lgyro_acc_x] <- numeric()
            lgyro_acc_y <- paste("gyro_acc_y", as.character(i), sep = ".")
            inerSigList[lgyro_acc_y] <- numeric()
            lgyro_acc_z <- paste("gyro_acc_z", as.character(i), sep = ".")
            inerSigList[lgyro_acc_z] <- numeric()
            
            for(j in 1:lenSet){
                indj <- (j - 1) * 128 + 1
                inerSigList[ltotal_acc_x] <- InertialSig_test[total_acc_x][j]
                inerSigList[ltotal_acc_y] <- InertialSig_test[total_acc_y][j]
                inerSigList[ltotal_acc_z] <- InertialSig_test[total_acc_z][j]
                
                inerSigList[lbody_acc_x] <- InertialSig_test[body_acc_x][j]
                inerSigList[lbody_acc_y] <- InertialSig_test[body_acc_y][j]
                inerSigList[lbody_acc_z] <- InertialSig_test[body_acc_z][j]
                
                inerSigList[lgyro_acc_x] <- InertialSig_test[gyro_acc_x][j]
                inerSigList[lgyro_acc_y] <- InertialSig_test[gyro_acc_y][j]
                inerSigList[lgyro_acc_z] <- InertialSig_test[gyro_acc_z][j]
                
            }
        }
    }
    
    inerSigList
    
}
