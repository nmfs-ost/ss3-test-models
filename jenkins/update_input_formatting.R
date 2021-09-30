# update formatting of the input files
# run without estimation in order to keeps same starting values, then
# replace original input files with .ss_new files

# inputs to change ----
ss_exe <- "ss_3.30.18" # path to model that is in the computer PATH variable

# run models without estimation ----
# without estimation b/c want to use the same initial values.
mod_dirs <- list.dirs("models", recursive = FALSE)
r4ss::populate_multiple_folders(outerdir.old = "models", 
                                                outerdir.new = "new_models",
                                                exe.file = NULL, verbose = FALSE)
new_mod_dirs <- list.dirs("new_models", recursive = FALSE)
# use the parallel version to speed up model runs 
SSutils::run_SS_models_parallel(dirvec = new_mod_dirs,
                                extras = "-stopph 0 -nohess", 
                                model = ss_exe, exe_in_path = TRUE, 
                                parallel = TRUE)

# copy the new output files back into the old ones. 
r4ss::populate_multiple_folders(outerdir.old = "new_models", 
                                outerdir.new = "models", overwrite = TRUE,
                                exe.file = NULL, verbose = FALSE, 
                                use_ss_new = TRUE)

file.remove(list.files("new_models", full.names = TRUE, recursive = TRUE))
file.remove(list.files("new_models", full.names = TRUE, recursive = FALSE))
# may need the old code below if populate multiple folders doesn't work correctly
# # replace old inputs with the .ss_new files 
# replace_inputs <- function(dir) {
#   file.copy(from = file.path(dir, "starter.ss_new"),
#             to = file.path(dir, "starter.ss"),
#             overwrite = TRUE)
#   file.copy(from = file.path(dir, "forecast.ss_new"), 
#             to = file.path(dir, "forecast.ss"), 
#             overwrite = TRUE)
#   if(file.exists(file.path(dir, "wtatage.ss"))) {
#     file.copy(from = file.path(dir, "wtatage.ss_new"), 
#               to = file.path(dir, "wtatage.ss"), 
#               overwrite = TRUE)
#   }
#   start <- r4ss::SS_readstarter(file = file.path(dir, "starter.ss"),
#                                 verbose = FALSE)
#   
#   file.copy(from = file.path(dir, "data.ss_new"), 
#             to = file.path(dir, start[[datfile]]), 
#             overwrite = TRUE)
#   file.copy(from = file.path(dir, "control.ss_new"), 
#             to = file.path(dir, start[[ctlfile]]), 
#             overwrite = TRUE)
#   invisible(dir)
# }
# 
# out <- lapply(new_mod_dirs, function(x) {
#     tryCatch(replace_inputs(dir = x), error = function(e) print(e))
#   }
#   )

# check out to see if there were any errors.