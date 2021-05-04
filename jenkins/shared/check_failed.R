# See if the run failed

getwd()
if(file.exists(file.path("run_R", "test_failed.csv"))) {
  stop("Tests failed.")
} else {
  message("test_failed.csv not found, indicating tests passed.")
}