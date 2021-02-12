# See if the run failed

getwd()
if(file.exists(file.path("run_R", "test_failed.txt"))) {
  stop("Tests failed.")
} else {
  message("test_failed.txt not found, indicating tests passed.")
}