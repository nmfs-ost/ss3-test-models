library("r4ss")

test_models <- list.files("C:/Users/elizabeth.gugliotti/github_repos/stock synthesis/test-models/models", full.names = TRUE)

replist_all <- lapply(test_models, SS_output, verbose = TRUE, printstats = TRUE)
plots_all <- lapply(replist_all, SS_plots)
