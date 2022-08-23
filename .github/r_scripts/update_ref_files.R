# function to update the reference files in the models subfolder. 
# assumes the working directory is the test-models repository.

# inputs to change ----
ss_exe <- "ss_3.30.19" # path to model that is in the computer PATH variable
update_model_string <- "3.30.19" # the model version updating to.

# Update the reference files
update_ref_files <- function(new_mod_path, ss_examples_folder = getwd()) {
  mod_name <- basename(new_mod_path)
  git_mod_path <- file.path(ss_examples_folder, "models", mod_name)
  # list model files that need to be moved
  files_to_move <- c("ss.par", "ss_summary.sso", "warning.sso")
  # copy model files from new_mod_path folder to the git_mod_path folder,
  results_of_move <- lapply(files_to_move,
                            function(x, new_mod_path, git_mod_path) {
    file.remove(file.path(git_mod_path, x))
    file.copy(from = file.path(new_mod_path, x),
              to = file.path(git_mod_path, x), 
              overwrite = FALSE) #to make sure worked
    worked <- file.exists(file.path(git_mod_path, x))
  }, new_mod_path = new_mod_path, git_mod_path = git_mod_path)
  if(all(unlist(results_of_move) == TRUE)) {
    files_replaced <- TRUE
  } else {
    files_replaced <- FALSE
  }
  files_replaced
}


# run models locally first
r4ss::populate_multiple_folders(outerdir.old = "models", 
                                outerdir.new = "new_models",
                                exe.file = NULL, verbose = FALSE)
new_mod_dirs <- list.dirs("new_models", recursive = FALSE)
# use the parallel version to speed up model runs 
SSutils::run_SS_models_parallel(dirvec = new_mod_dirs, 
                                model = ss_exe, exe_in_path = TRUE, 
                                parallel = TRUE)

# get paths to the new input models - this code will need to be changed upon
# next update, unless using the same folder in the same location to house the
# new results
new_mod_runs_folder <- file.path("new_models")
new_mod_path_list <- list.dirs(new_mod_runs_folder, recursive = FALSE,
                               full.names = TRUE)
run_results <- lapply(new_mod_path_list, update_ref_files)

# check all have been replaced with the correct version of summary files
# want to double check this before overwriting the files!!
git_mods <- list.dirs("models", recursive = FALSE, full.names = TRUE)
first_line <- lapply(git_mods, function (x) {
   ss_sum <- readLines(file.path(x, "ss_summary.sso"))
   version <- grep(update_model_string , ss_sum, fixed = TRUE)
   if (!(1 %in% version)) {
     message(update_model_string, " not found on first line for ", x)
   }
   return(ss_sum[1])
 })
 # see all first lines for the files.
unlist(first_line)

# copy the new output files back into the old ones. 
r4ss::populate_multiple_folders(outerdir.old = "new_models", 
                                outerdir.new = "models", overwrite = TRUE,
                                exe.file = NULL, verbose = FALSE, 
                                use_ss_new = TRUE)

file.remove(list.files("new_models", full.names = TRUE, recursive = TRUE))
file.remove(list.files("new_models", full.names = TRUE, recursive = FALSE))
