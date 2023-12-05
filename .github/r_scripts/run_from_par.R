# code to run the ss_new models
list.of.packages <- c("parallely", "furrr", "future")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) install.packages(new.packages)

ncores <- parallelly::availableCores() - 1
future::plan(future::multisession, workers = ncores)

mod_names <- list.dirs("model_runs", full.names = FALSE, recursive = FALSE)
mod_paths <- list.dirs("model_runs", full.names = TRUE, recursive = FALSE)
print(mod_names)

run_ss_noest <- function(dir) {
  wd <- getwd()
  print(wd)
  on.exit(system(paste0("cd ", wd)))
  # rename the reference files 
  file.rename(file.path(dir, "ss_summary.sso"),
              file.path(dir, "ss_summary_ref.sso"))
  file.rename(file.path(dir, "warning.sso"),
              file.path(dir, "warning_ref.sso"))
	file.copy(file.path(dir, "ss.par"), file.path(dir, "ss_ref.par"))
  # change models to read from the .par file of the reference run
  start <- readLines(file.path(dir, "starter.ss"))
  first_val_line <- grep("0=use init values in control file", start, fixed = TRUE)
    if(!identical(first_val_line, integer(0)) == TRUE){
      start[first_val_line] <- "1 # read from .par file"
      print(start[first_val_line])
      # phase_line <- grep("Turn off estimation", start, fixed = TRUE)
      # start[phase_line] <- "0 # Turn off estimation after this phase"
      writeLines(start, file.path(dir, "starter.ss"))
      # run the models without estimation and see if model finishes without error
      message("running ss on ", basename(dir))
      system(paste0("cd ", dir, " && ../ss -maxfn 0 -phase 50 -nohess"))
      model_ran <- file.exists(file.path(dir, "control.ss_new"))
      return(model_ran)
      } else {
        message("running ss on ", basename(dir))
        system(paste0("cd ", dir, " && ../ss -maxfn 0 -phase 50 -nohess"))
        model_ran <- file.exists(file.path(dir, "control.ss_new"))
        return(model_ran)
        }
}

mod_ran <- furrr::future_map(mod_paths, function(x) {tryCatch(run_ss_noest(x), 
                                       error = function(e) print(e)
                                       )}

           )
mod_errors <- mod_names[unlist(lapply(mod_ran, function(x) "simpleError" %in% class(x)))]
success <- TRUE
if(length(mod_errors) > 0) {
  message("Model code with errors were: ", paste0(mod_errors, collapse = ", "), 
          ". See error list above for more details.")
  success <- FALSE
} else {
  message("All code ran without error, but model runs may still have failed.")
}
mod_no_run <- mod_names[unlist(lapply(mod_ran, function(x) isFALSE(x)))] #false means model didn't run
if(length(mod_no_run) > 0) {
  message("Models that didn't run are ", paste0(mod_no_run, collapse = ", "))
  success <- FALSE
} else {
  message("All models ran without error.")
}

# determine if job fails or passes
if(success == FALSE) {
  stop("Job failed due to code with errors or models that didn't run.")
} else {
  message("All models successfully ran.")
}
