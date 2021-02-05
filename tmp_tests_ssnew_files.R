

mods <- list.dirs(file.path("test_models", "models"), recursive = F)

output <- lapply(mods, function(i) {
  wd <- getwd()
  on.exit(setwd(wd), add = TRUE)
  r4ss::copy_SS_inputs(dir.old = i, 
                       dir.new = file.path("test_for_bugs", basename(i)), 
                       create.dir = TRUE,
                       overwrite = FALSE,
                       recursive = FALSE,
                       use_ss_new = TRUE,
                       copy_exe = FALSE,
                       copy_par = FALSE,
                       verbose = FALSE)
  get_bin <- Sys.which("ss_2018_8_26_1eddb7c.exe")[[1]] # get ss exe that is in your path
  setwd(file.path("test_for_bugs", basename(i)))
  system(paste0(get_bin, " -maxfn 0 -phase 50 -nohess")) # to run SS in current working directory
  test <- file.exists("Report.sso")
  setwd(wd)
  test
})
