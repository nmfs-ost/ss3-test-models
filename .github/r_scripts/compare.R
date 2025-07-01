# Compare 2 stock synthesis files
# but first, test running r from a script.

#' read ss_summary file
#'
#' read Stock Synthesis ss_summary.sso file into list object in R
#'
#'
#' @param file Filename either with full path or relative to working directory.
#' @return Output will be a list with four elements, \code{header},
#' \code{likelihoods}, \code{parameters}, and \code{derived_quants}.
#' Each is a data frame with rownames indicating the quantity shown in each row.
#' @author Ian Taylor
#' @export
#' @seealso \code{\link{SS_output}}, \code{\link{SS_readforecast}},
#' \code{\link{SS_readdat}}, \code{\link{SS_readstarter}}
#' @examples
#'
#'   \dontrun{
#'     summary <- SS_read_summary(file='c:/mymodel/ss_summary.sso')
#'   }
#'

SS_read_summary <- function(file = "ss_summary.sso") {
  # check to make sure file is present and non-empty
  if (is.na(file.info(file)$size) || file.info(file)$size == 0) {
    warning("file is missing or empty: ", file)
    return(NULL)
  }

  read_summary_section <- function(start, end, ncol, nonnumeric = NULL, names) {
    # function to read one section at a time

    # start is starting line of section
    # end in ending line of section
    # ncol is number of columns after the label column
    # nonnumeric is the column number (after label) of any non-numeric column
    # names is the names of all columns after the label

    if (start >= end) {
      # if section is empty
      return(NULL)
    }

    df <- all_lines[start:end] ## Subset all lines for this section
    comment_lines <- grep("^#", df) ## find and remove any subsection headers
    if (length(comment_lines) > 0) {
      df <- df[-comment_lines]
    }
    df <- strsplit(df, "[[:blank:]]+") ## Split by whitespace and collapse (+)
    df <- as.list(df) ## Must be a list for the next operation
    df <- do.call("rbind", df) ## Make it into a dataframe
    df <- as.data.frame(df[, -1], stringsAsFactors = FALSE, row.names = df[, 1])
    # convert columns to numeric
    if (ncol > 1) {
      # which columns after label are numeric (shifted by 1 for label column)
      numeric.cols <- which(!(1:ncol) %in% nonnumeric)
      df[, numeric.cols] <- lapply(df[, numeric.cols], as.numeric)
    } else {
      df[, 1] <- as.numeric(df[, 1]) ## convert single column to numeric
    }
    # name the columns
    names(df) <- names
    return(df)
  }

  # read all lines as strings
  all_lines <- readLines(file)

  # find starting line of different sections
  like_start <- grep("#_LIKELIHOOD", all_lines)
  param_start <- grep("#_PARAMETERS", all_lines)
  derived_quants_start <- grep("#_Derived_Quantities", all_lines)
  survey_stdev_start <- grep("#_survey_stdev", all_lines) # section optional
  biomass_start <- grep("#_Biomass", all_lines)

  # read header
  header <- all_lines[1:(like_start - 1)]

  # read likelihood section
  likelihoods <- read_summary_section(
    start = like_start + 2,
    end = param_start - 1,
    ncol = 1,
    names = "logL*Lambda"
  )

  # read parameter section
  parameters <- read_summary_section(
    start = param_start + 2,
    end = derived_quants_start - 1,
    ncol = 4,
    nonnumeric = 3,
    names = c("Value", "SE", "Active?", "Range")
  )

  # read derived quantities section
  derived_quants <- read_summary_section(
    start = derived_quants_start + 2,
    end = survey_stdev_start - 1,
    ncol = 2,
    names = c("Value", "SE")
  )

  # read survey_stdev section (if present)
  survey_stdev <- read_summary_section(
    start = survey_stdev_start + 1,
    end = biomass_start - 1,
    ncol = 6,
    nonnumeric = c(3, 5),
    names = c("Value", "SE", "XX", "Exp", "XX", "Q")
  )
  # remove extra column from survey_stdev data frame
  survey_stdev <- survey_stdev[names(survey_stdev) != "XX"]

  # read biomass section
  biomass <- read_summary_section(
    start = biomass_start + 2,
    end = length(all_lines),
    ncol = 2,
    names = c("Value", "SE")
  )

  # return stuff
  return(list(
    header = header,
    likelihoods = likelihoods,
    parameters = parameters,
    derived_quants = derived_quants,
    survey_stdev = survey_stdev,
    biomass = biomass
  ))
}

#' Compare ss_summary.sso files
#'
#'@param mod_name name of model to include as a col in new_file
#'@param sum_file path to the ss_summary.sso file
#'@param ref_sum_file path to the reference ss_summary_ref.sso file
#'@param par_file path to the par file
#'@param ref_par_file path to the reference par file
#'@param warn_file path to the warning file
#'@param ref_warn_file path to the warning reference file
#'@param new_file path to write output to. Should be NULL or have .csv extension
#'@param hessian Was the hessian estimated? Default to TRUE
#'@param fail_file Name of the file to write information about failed runs. Should have .csv extension
compare_ss_runs <- function(
  mod_name = "ss_mod",
  sum_file = "ss_summary.sso",
  ref_sum_file = "ss_summary_ref.sso",
  par_file = "ss3.par",
  ref_par_file = "ss_ref.par",
  warn_file = "warning.sso",
  ref_warn_file = "warning_ref.sso",
  new_file = NULL,
  hessian = TRUE,
  fail_file = "test_failed.csv"
) {
  sum <- SS_read_summary(sum_file)
  ref <- SS_read_summary(ref_sum_file)
  tol <- 0.01

  if (all(rownames(sum$likelihoods) == rownames(ref$likelihoods))) {
    compare_df <- data.frame(
      component = rownames(sum$likelihoods),
      sum_like = sum$likelihoods$`logL*Lambda`,
      ref_like = ref$likelihoods$`logL*Lambda`,
      stringsAsFactors = FALSE
    )
    compare_df$diff <- compare_df$sum_like - compare_df$ref_like
    compare_df$perc_change <- ifelse(
      compare_df$ref_like != 0,
      100 * compare_df$diff / compare_df$ref_like,
      0
    )
    # change colnames to make more general:
    colnames(compare_df) <- c(
      "quantity",
      "value",
      "ref_value",
      "diff",
      "perc_change"
    )
    compare_df$quantity <- paste0(compare_df$quantity, "_like")
    like_quantities <- compare_df$quantity
  } else {
    # sanity check
    stop(
      "colnames of likelihoods did not match. need to account for this ",
      "situation"
    )
  }
  # add onto table: changes in number of warnings and max gradient
  # get info from the par file
  extract_max_grad <- function(par_file) {
    parhdr <- readLines(par_file, n = 1)
    maxgrad <- as.numeric(strsplit(
      parhdr,
      split = " Maximum gradient component = "
    )[[1]][2])
  }
  maxgrad <- extract_max_grad(par_file)
  ref_maxgrad <- extract_max_grad(ref_par_file)

  # get info from the warning file
  extract_nwarn <- function(warn_file) {
    warn <- readLines(warn_file)
    warnstring <- grep("(N )*[Ww]arnings: ", warn, value = TRUE)
    if (length(warnstring) > 0) {
      nwarn <- as.numeric(strsplit(warnstring, "(N )*[Ww]arnings: ")[[1]][2])
    } else {
      warnstring <- grep("^\\d+ warning(s)*", warn, value = TRUE)
      if (length(warnstring) > 0) {
        nwarn <- as.numeric(strsplit(warnstring, " warning")[[1]][1])
      } else {
        nwarn <- NA
      }
    }
  }
  nwarn <- extract_nwarn(warn_file)
  ref_nwarn <- extract_nwarn(ref_warn_file)
  # contstruct temp df for max grad and nwarn
  grad_warn_df <- data.frame(
    quantity = c("maxgrad", "nwarn"),
    value = c(maxgrad, nwarn),
    ref_value = c(ref_maxgrad, ref_nwarn),
    diff = c(maxgrad - ref_maxgrad, nwarn - ref_nwarn),
    stringsAsFactors = FALSE
  )
  grad_warn_df$perc_change <- ifelse(
    grad_warn_df$ref_value != 0,
    100 * grad_warn_df$diff / grad_warn_df$ref_val,
    0
  )
  # bind nwarn and gradient info to the data frame
  compare_df <- rbind(compare_df, grad_warn_df)

  get_yrs <- function(name_vec) {
    tmp_val <- strsplit(name_vec, split = "_")
    yrs <- as.integer(unlist(lapply(tmp_val, function(x) x[2])))
  }
  #Find model years - last year of model
  forecatch_names <- grep(
    "^ForeCatch_",
    row.names(sum$derived_quants),
    value = TRUE
  )
  if (length(forecatch_names) > 0) {
    fore_yrs <- get_yrs(forecatch_names)
    lyr_mod <- min(fore_yrs) - 1
    lyr_fcast <- max(fore_yrs)
    nyrs_fcast <- max(fore_yrs) - min(fore_yrs) + 1
  } else {
    F_rate_names <- grep("^F_", row.names(sum$derived_quants), value = TRUE)
    F_rates <- get_yrs(F_rate_names)
    lyr_mod <- max(F_rates)
    lyr_fcast <- NA
    nyrs_fcast <- 0
  }

  # other quantites

  # End depletion
  end_depl_ind <- grep(
    paste0("Bratio_", lyr_mod),
    row.names(sum$derived_quants)
  )
  end_depl_ind_ref <- grep(
    paste0("Bratio_", lyr_mod),
    row.names(ref$derived_quants)
  )
  if (length(end_depl_ind) != 1) {
    stop(
      "Could not find Bratio_",
      lyr_mod,
      " in the derived_quants table of summary."
    )
  }
  end_depl_sum <- sum$derived_quants[end_depl_ind, "Value"]
  end_depl_ref <- ref$derived_quants[end_depl_ind_ref, "Value"]

  # R0 val and se
  r0_ind <- grep("SR_LN(R0)", row.names(sum$parameters), fixed = TRUE)
  r0_ind_ref <- grep("SR_LN(R0)", row.names(ref$parameters), fixed = TRUE)
  r0_sum <- sum$parameters[r0_ind, c("Value", "SE")]
  r0_ref <- ref$parameters[r0_ind_ref, c("Value", "SE")]

  # SSB unfished (Bo) se
  B0_se_sum <- sum$derived_quants[
    row.names(sum$derived_quants) == "SSB_unfished",
    "SE"
  ]
  B0_se_ref <- ref$derived_quants[
    row.names(ref$derived_quants) == "SSB_unfished",
    "SE"
  ]

  # construct new df rows
  tmp_df <- data.frame(
    quantity = c(
      paste0("Bratio_", lyr_mod),
      "SR_LN(R0)_val",
      "SR_LN(R0)_se",
      "SSB_unfished_se"
    ),
    value = c(end_depl_sum, r0_sum[, "Value"], r0_sum[, "SE"], B0_se_sum),
    ref_value = c(end_depl_ref, r0_ref[, "Value"], r0_ref[, "SE"], B0_se_ref)
  )

  # Fore catch last (val and se) if valid
  if (!is.na(lyr_fcast)) {
    fore_catch_last_sum <- sum$derived_quants[
      row.names(sum$derived_quants) == paste0("ForeCatch_", lyr_fcast),
    ]
    fore_catch_last_ref <- ref$derived_quants[
      row.names(ref$derived_quants) == paste0("ForeCatch_", lyr_fcast),
    ]
    tmp_df_flast <- data.frame(
      quantity = paste0("ForeCatch_", lyr_fcast, c("_val", "_se")),
      value = c(fore_catch_last_sum[1, "Value"], fore_catch_last_sum[1, "SE"]),
      ref_value = c(
        fore_catch_last_ref[1, "Value"],
        fore_catch_last_ref[1, "SE"]
      )
    )
    tmp_df <- rbind(tmp_df, tmp_df_flast)
  }

  # get diff and percent change
  tmp_df$diff <- tmp_df$value - tmp_df$ref_value
  tmp_df$perc_change <- ifelse(
    tmp_df$ref_value != 0,
    100 * tmp_df$diff / tmp_df$ref_value,
    0
  )
  tmp_df$ratio <- ifelse(
    tmp_df$ref_value != 0,
    tmp_df$value / tmp_df$ref_value,
    NA
  )
  # do comparisons  ----
  write_fail <- FALSE
  # likelihoods
  if (abs(compare_df[compare_df$quantity == "TOTAL_LogL_like", "diff"]) > tol) {
    message(
      mod_name,
      ": There has been a change greater than ",
      tol,
      " in likelihood components"
    )
    write_fail <- TRUE
  }
  if (abs(compare_df[compare_df$quantity == "maxgrad", "diff"]) > 0.001) {
    tmp_old_val <- compare_df[compare_df$quantity == "maxgrad", "ref_value"]
    tmp_new_val <- compare_df[compare_df$quantity == "maxgrad", "value"]
    # don't write to fail, but just print message to inform.
    message(
      mod_name,
      ": Max gradient changed from ",
      tmp_old_val,
      " to ",
      tmp_new_val
    )
  }
  if (!is.na(compare_df[compare_df$quantity == "nwarn", "diff"])) {
    if (abs(compare_df[compare_df$quantity == "nwarn", "diff"]) > 0) {
      # dont'write to fail, but just print the message to inform.
      tmp_old_val <- compare_df[compare_df$quantity == "nwarn", "ref_value"]
      tmp_new_val <- compare_df[compare_df$quantity == "nwarn", "value"]
      message(
        mod_name,
        ": Nwarnings changed from ",
        tmp_old_val,
        " to ",
        tmp_new_val
      )
    }
  } #else { # turn this on to fail the job if N warnings is not written
  #message(mod_name, ": N warnings was not written. This may indicate that",
  #        " the model did not run all the way through.")
  #write_fail <- TRUE
  #}
  if (
    abs(tmp_df[tmp_df$quantity == paste0("Bratio_", lyr_mod), "diff"]) > 0.001
  ) {
    write_fail <- TRUE
  }
  if (abs(tmp_df[tmp_df$quantity == "SR_LN(R0)_val", "diff"]) > 0.01) {
    write_fail <- TRUE
  }
  if (hessian) {
    if (
      tmp_df[tmp_df$quantity == "SR_LN(R0)_se", "ratio"] > 1.01 |
        tmp_df[tmp_df$quantity == "SR_LN(R0)_se", "ratio"] < 0.99
    ) {
      write_fail <- TRUE
    }
    if (
      tmp_df[tmp_df$quantity == "SSB_unfished_se", "ratio"] > 1.01 |
        tmp_df[tmp_df$quantity == "SSB_unfished_se", "ratio"] < 0.99
    ) {
      write_fail <- TRUE
    }
  }
  if (
    !is.na(lyr_fcast) &&
      !is.na(tmp_df[
        tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_val"),
        "value"
      ])
  ) {
    if (
      tmp_df[
        tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_val"),
        "ratio"
      ] >
        1.01 |
        tmp_df[
          tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_val"),
          "ratio"
        ] <
          0.99
    ) {
      write_fail <- TRUE
    }
    if (hessian) {
      if (
        tmp_df[
          tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_se"),
          "ratio"
        ] >
          1.01 |
          tmp_df[
            tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_se"),
            "ratio"
          ] <
            0.99
      ) {
        # only write if fail if ref value for se is not really small. really small indicates it is a fixed value.
        if (
          tmp_df[
            tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_se"),
            "ref_value"
          ] >
            0.0001
        ) {
          write_fail <- TRUE
        }
      }
    }
  } else {
    if (
      !is.na(lyr_fcast) &&
        is.na(tmp_df[
          tmp_df$quantity == paste0("ForeCatch_", lyr_fcast, "_val"),
          "value"
        ])
    ) {
      write_fail <- TRUE
      message(mod_name, ": ForeCatch_", lyr_fcast, "_val is NA.")
    }
  }
  compare_df$ratio <- ifelse(
    compare_df$ref_value != 0,
    compare_df$value / compare_df$ref_value,
    NA
  )
  compare_df <- rbind(compare_df, tmp_df)
  compare_df$mod_name <- mod_name # add the model name
  #print the msg
  compare_df_print <- format(
    compare_df,
    digits = 6,
    nsmall = 3,
    justify = "left"
  )
  compare_df_print <- compare_df_print[
    !is.na(compare_df_print$ratio) & compare_df_print$ratio != 1,
  ]

  # message("values and their differences:")
  if (write_fail == TRUE) {
    if (file.exists(fail_file)) {
      hdr <- FALSE
    } else {
      hdr <- TRUE
    }
    write.table(
      compare_df_print,
      fail_file,
      sep = ",",
      row.names = FALSE,
      append = TRUE,
      col.names = hdr
    )
  }
  if (!is.null(new_file)) {
    write.csv(compare_df_print, new_file, row.names = FALSE)
  }
  invisible(compare_df)
}
