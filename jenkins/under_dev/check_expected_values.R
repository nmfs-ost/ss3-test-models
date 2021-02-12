# code to test if expected values look reasonable or not
check_expected_vals <- function (datfilepath) {
  # read in dat, get necessary funs ----
  source("SS_readdat_3.30.R") # to reduce dependencies, will just copy fun code into this dir.
    # start checks ----
    exp <- SS_readdat_3.30(datfilepath, section = 2, verbose = FALSE)
  
  
  # make a df to fill in with te results of checks
  exp_res <- data.frame(checks = c("fleet_2 CPUE in mod", 
                                   "fleet_2 CPUE in future",
                                   "fleet_3 CPUE in mod", 
                                   "fleet_3 CPUE in future", 
                                   "fleet_2 lencomp in mod",
                                   "fleet_2 lencomp in future", 
                                   "fleet_2 agecomp in mod", 
                                   "fleet_2 agecomp in future", 
                                   "fleet_2 meansizeatage in mod", 
                                   "fleet_2 meansizeatage in future"),
                        result_passing = NA
                                   )
  
  
  
  # fleet_2 CPUE in mod ----
  tmp_passing <- TRUE
  tmp_CPUE_test <- vector(mode = "numeric", 2)
  tmp_CPUE_test[1] <- exp$CPUE[exp$CPUE$year == 1977 & exp$CPUE$index == 2, "obs"]
  tmp_CPUE_test[2] <- exp$CPUE[exp$CPUE$year == 1980 & exp$CPUE$index == 2, "obs"]
  for (i in 1978:1979) {
    tmp_CPUE <- exp$CPUE[exp$CPUE$year == i & exp$CPUE$index == -2, "obs"]
    if(tmp_CPUE > max(tmp_CPUE_test) | tmp_CPUE < min(tmp_CPUE_test)) {
      message("fleet_2 CPUE in mod failed for year ", i)
      tmp_passing <- FALSE
    }
  }
  exp_res[exp_res$checks == "fleet_2 CPUE in mod", "result_passing"] <- tmp_passing
  
  # fleet_2 CPUE in future ----
  
  # for now, just check that they are on the same scale? Make more specific in future?
  tmp_passing <- TRUE
  tmp_CPUE_test <- exp$CPUE[exp$CPUE$index == 2, "obs"]
  for (i in 2002:2011) {
    tmp_CPUE <- exp$CPUE[exp$CPUE$year == i & exp$CPUE$index == -2, "obs"]
    if(tmp_CPUE > (max(tmp_CPUE_test)*10) | tmp_CPUE < (min(tmp_CPUE_test)*0.10)) {
      message("fleet_2 CPUE in future failed for year ", i)
      tmp_passing <- FALSE
    }
  }
  
  exp_res[exp_res$checks == "fleet_2 CPUE in future", "result_passing"] <- tmp_passing
  
  # fleet_3 CPUE in mod ----
  
  tmp_passing <- TRUE
  tmp_CPUE_test <- exp$CPUE[exp$CPUE$index == 3, "obs"]
  for (i in 1988:1989) {
    tmp_CPUE <- exp$CPUE[exp$CPUE$year == i & exp$CPUE$index == -3, "obs"]
    if(tmp_CPUE > (max(tmp_CPUE_test)*10) | tmp_CPUE < (min(tmp_CPUE_test)*0.10)) {
      message("fleet_3 CPUE in mod failed for year ", i)
      tmp_passing <- FALSE
    }
  }
  
  exp_res[exp_res$checks == "fleet_3 CPUE in mod", "result_passing"] <- tmp_passing
  
  # fleet_3 CPUE in future ---
  
  tmp_passing <- TRUE
  tmp_CPUE_test <- exp$CPUE[exp$CPUE$index == 3, "obs"]
  for (i in 2002:2011) {
    tmp_CPUE <- exp$CPUE[exp$CPUE$year == i & exp$CPUE$index == -3, "obs"]
    if(tmp_CPUE > (max(tmp_CPUE_test)*10) | tmp_CPUE < (min(tmp_CPUE_test)*0.10)) {
      message("fleet_3 CPUE in future failed for year ", i)
      tmp_passing <- FALSE
    }
  }
  
  exp_res[exp_res$checks == "fleet_3 CPUE in future", "result_passing"] <- tmp_passing
  
  # fleet_2 lencomp in mod ----
  
  tmp_passing <- TRUE
  tmp_test <- exp$lencomp[exp$lencomp$FltSvy == 2, ]
  for (i in 1978:1979) {
    tmp_lencomp <- exp$lencomp[exp$lencomp$Yr == i & exp$lencomp$FltSvy == -2, ]
    for (j in 7:ncol(exp$lencomp)) {
      tmp_test_col <- tmp_test[, j] # a vector of values
      tmp_lencomp_col <- tmp_lencomp[, j] # should be a single value
      if(tmp_lencomp_col > (max(tmp_test_col)*10) | 
         tmp_lencomp_col < (min(tmp_test_col)*0.10)) {
        message("fleet_2 lencomp in mod failed for year ", i, " in column ", j)
        tmp_passing <- FALSE
      }
    }
  }
  exp_res[exp_res$checks == "fleet_2 lencomp in mod", "result_passing"] <- tmp_passing
  
  # fleet_2 lencomp in future ----
  
  tmp_passing <- TRUE
  tmp_test <- exp$lencomp[exp$lencomp$FltSvy == 2, ]
  for (i in c(2002, 2003, 2010, 2011)) {
    tmp_lencomp <- exp$lencomp[exp$lencomp$Yr == i & exp$lencomp$FltSvy == -2, ]
    for (j in 7:ncol(exp$lencomp)) {
      tmp_test_col <- tmp_test[, j] # a vector of values
      tmp_lencomp_col <- tmp_lencomp[, j] # should be a single value
      if(tmp_lencomp_col > (max(tmp_test_col)*10) | 
         tmp_lencomp_col < (min(tmp_test_col)*0.10)) {
        message("fleet_2 lencomp in future failed for year ", i, " in column ", j)
        tmp_passing <- FALSE
      }
    }
  }
  exp_res[exp_res$checks == "fleet_2 lencomp in future", "result_passing"] <- tmp_passing
  
  
  # fleet_2 agecomp in mod -----
  
  tmp_passing <- TRUE
  tmp_test <- exp$agecomp[exp$agecomp$FltSvy == 2, ]
  for (i in 1978:1979) {
    tmp_agecomp <- exp$agecomp[exp$agecomp$Yr == i & exp$agecomp$FltSvy == -2, ]
    for (j in 7:ncol(exp$agecomp)) {
      tmp_test_col <- tmp_test[, j] # a vector of values
      tmp_lencomp_col <- tmp_lencomp[, j] # should be a single value
      if(tmp_lencomp_col > (max(tmp_test_col)*10) | 
         tmp_lencomp_col < (min(tmp_test_col)*0.10)) {
        message("fleet_2 agecomp in mod failed for year ", i, " in column ", j)
        tmp_passing <- FALSE
      }
    }
  }
  exp_res[exp_res$checks == "fleet_2 agecomp in mod", "result_passing"] <- tmp_passing
  # fleet_2 agecomp in future ----
  
  tmp_passing <- TRUE
  tmp_test <- exp$agecomp[exp$agecomp$FltSvy == 2, ]
  for (i in c(2002, 2003, 2010, 2011)) {
    tmp_agecomp <- exp$agecomp[exp$agecomp$Yr == i & exp$agecomp$FltSvy == -2, ]
    for (j in 10:ncol(exp$agecomp)) {
      tmp_test_col <- tmp_test[, j] # a vector of values
      tmp_agecomp_col <- tmp_agecomp[, j] # should be a single value
      if(isTRUE(tmp_agecomp_col > (max(tmp_test_col)*10)) || 
         isTRUE(tmp_agecomp_col < (min(tmp_test_col)*0.10))) {
        message("fleet_2 agecomp in future failed for year ", i, " in column ", j)
        tmp_passing <- FALSE
      }
    }
  }
  exp_res[exp_res$checks == "fleet_2 agecomp in future", "result_passing"] <- tmp_passing
  # fleet_2 meansizeatage in mod ----
  tmp_passing <- TRUE
  exp$MeanSize_at_Age_obs <- type.convert(exp$MeanSize_at_Age_obs) #b/c were chars. 
  tmp_test <- exp$MeanSize_at_Age_obs[exp$MeanSize_at_Age_obs$FltSvy == 2, ]
  tmp_meansize <- exp$MeanSize_at_Age_obs[exp$MeanSize_at_Age_obs$FltSvy == -2 &
                                          exp$MeanSize_at_Age_obs$Yr == 1996, ]
  for (j in 8:ncol(exp$MeanSize_at_Age_obs)) {
    tmp_test_col <- tmp_test[,j] #vector
    tmp_meansize_col <- tmp_meansize[,j] #single value
    if(isTRUE(tmp_meansize_col > (max(tmp_test_col)*10)) | 
       isTRUE(tmp_meansize_col < (min(tmp_test_col)*0.10))) {
      message("fleet_2 meansizeatage in mod in column ", j)
      tmp_passing <- FALSE
    }
  }
  exp_res[exp_res$checks == "fleet_2 meansizeatage in mod", "result_passing"] <-
    tmp_passing
  
  # fleet_2 meansizeatage in future ----
  tmp_passing <- TRUE
  tmp_test <- exp$MeanSize_at_Age_obs[exp$MeanSize_at_Age_obs$FltSvy == 2, ]
  tmp_meansize <- exp$MeanSize_at_Age_obs[exp$MeanSize_at_Age_obs$FltSvy == -2 & 
                                          exp$MeanSize_at_Age_obs$Yr == 2010, ]
  for (j in 8:ncol(exp$MeanSize_at_Age_obs)) {
    tmp_test_col <- tmp_test[,j] #vector
    tmp_meansize_col <- tmp_meansize[,j] #single value
    if(tmp_meansize_col > (max(tmp_test_col)*10) | 
       tmp_meansize_col < (min(tmp_test_col)*0.10)) {
      message("fleet_2 meansizeatage in future in column ", j)
      tmp_passing <- FALSE
    }
  }
  exp_res[exp_res$checks == "fleet_2 meansizeatage in future", "result_passing"] <- 
    tmp_passing
  
  # TODO: write code to check bootstrap values.
  exp_res
}