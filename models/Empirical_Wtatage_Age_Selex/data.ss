#V3.30.23.2;_safe;_compile_date:_Apr 17 2025;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.2
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:_https://groups.google.com/g/ss3-forum_and_NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:_https://nmfs-ost.github.io/ss3-website/
#_Source_code_at:_https://github.com/nmfs-ost/ss3-source-code

#_Start_time: Thu Apr 17 21:29:09 2025
#_echo_input_data
#C data file for simple example
#V3.30.23.2;_safe;_compile_date:_Apr 17 2025;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.2
1971 #_StartYr
2001 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
2 #_Nsexes: 1, 2, -1  (use -1 for 1 sex setup with SSB multiplied by female_frac parameter)
40 #_Nages=accumulator age, first age is always age 0
1 #_Nareas
3 #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=predator(M2) 
#_sample_timing: -1 for fishing fleet to use season-long catch-at-age for observations, or 1 to use observation month;  (always 1 for surveys)
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type fishery_timing area catch_units need_catch_mult fleetname
 1 -1 1 1 0 FISHERY1  # 1
 3 1 1 2 0 SURVEY1  # 2
 3 1 1 2 0 SURVEY2  # 3
#Bycatch_fleet_input_goes_next
#a:  fleet index
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years
#d:  F or first year of range
#e:  last year of range
#f:  not used
# a   b   c   d   e   f 
#_Catch data: year, seas, fleet, catch, catch_se
#_catch_se:  standard error of log(catch)
#_NOTE:  catch data is ignored for survey fleets
-999 1 1 0 0.01
1971 1 1 0 0.01
1972 1 1 200 0.01
1973 1 1 1000 0.01
1974 1 1 1000 0.01
1975 1 1 2000 0.01
1976 1 1 3000 0.01
1977 1 1 4000 0.01
1978 1 1 5000 0.01
1979 1 1 6000 0.01
1980 1 1 8000 0.01
1981 1 1 10000 0.01
1982 1 1 10000 0.01
1983 1 1 10000 0.01
1984 1 1 10000 0.01
1985 1 1 10000 0.01
1986 1 1 10000 0.01
1987 1 1 10000 0.01
1988 1 1 9000 0.01
1989 1 1 8000 0.01
1990 1 1 7000 0.01
1991 1 1 6000 0.01
1992 1 1 4000 0.01
1993 1 1 4000 0.01
1994 1 1 4000 0.01
1995 1 1 4000 0.01
1996 1 1 4000 0.01
1997 1 1 3000 0.01
1998 1 1 3000 0.01
1999 1 1 3000 0.01
2000 1 1 3000 0.01
2001 1 1 3000 0.01
-9999 0 0 0 0
#
#_CPUE_and_surveyabundance_and_index_observations
#_units: 0=numbers; 1=biomass; 2=F; 30=spawnbio; 31=exp(recdev); 36=recdev; 32=spawnbio*recdev; 33=recruitment; 34=depletion(&see Qsetup); 35=parm_dev(&see Qsetup)
#_errtype:  -1=normal; 0=lognormal; 1=lognormal with bias correction; >1=df for T-dist
#_SD_report: 0=not; 1=include survey expected value with se
#_note that link functions are specified in Q_setup section of control file
#_dataunits = 36 and 35 should use Q_type 5 to provide offset parameter
#_fleet units errtype SD_report
1 1 0 0 # FISHERY1
2 1 0 0 # SURVEY1
3 0 0 0 # SURVEY2
#_year month fleet obs stderr
1977 7 2 339689 0.3 #_ SURVEY1
1980 7 2 193353 0.3 #_ SURVEY1
1983 7 2 151984 0.3 #_ SURVEY1
1986 7 2 55221.8 0.3 #_ SURVEY1
1989 7 2 59232.3 0.3 #_ SURVEY1
1992 7 2 31137.5 0.3 #_ SURVEY1
1995 7 2 35845.4 0.3 #_ SURVEY1
1998 7 2 27492.6 0.3 #_ SURVEY1
2001 7 2 37338.3 0.3 #_ SURVEY1
1990 7 3 5.19333 0.7 #_ SURVEY2
1991 7 3 1.1784 0.7 #_ SURVEY2
1992 7 3 5.94383 0.7 #_ SURVEY2
1993 7 3 0.770106 0.7 #_ SURVEY2
1994 7 3 16.318 0.7 #_ SURVEY2
1995 7 3 1.36339 0.7 #_ SURVEY2
1996 7 3 4.76482 0.7 #_ SURVEY2
1997 7 3 51.0707 0.7 #_ SURVEY2
1998 7 3 1.36095 0.7 #_ SURVEY2
1999 7 3 0.862531 0.7 #_ SURVEY2
2000 7 3 5.97125 0.7 #_ SURVEY2
2001 7 3 1.69379 0.7 #_ SURVEY2
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note: only enter units and errtype for fleets with discard 
# note: discard data is the total for an entire season, so input of month here must be to a month in that season
#_fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  type=1 for mean length; type=2 for mean body weight 
#_year month fleet part type obs stderr
#  -9999 0 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
2 # binwidth for population size comp 
10 # minimum size in the population (lower edge of first bin and size at age 0.00) 
94 # maximum size in the population (lower edge of last bin) 
0 # use length composition data (0/1/2) where 2 invokes new comp_control format
# see manual for format of length composition data 
#
17 #_N_age_bins
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 20 25
2 #_N_ageerror_definitions
 0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.5 21.5 22.5 23.5 24.5 25.5 26.5 27.5 28.5 29.5 30.5 31.5 32.5 33.5 34.5 35.5 36.5 37.5 38.5 39.5 40.5
 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001
 0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.5 21.5 22.5 23.5 24.5 25.5 26.5 27.5 28.5 29.5 30.5 31.5 32.5 33.5 34.5 35.5 36.5 37.5 38.5 39.5 40.5
 0.5 0.65 0.67 0.7 0.73 0.76 0.8 0.84 0.88 0.92 0.97 1.03 1.09 1.16 1.23 1.32 1.41 1.51 1.62 1.75 1.89 2.05 2.23 2.45 2.71 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined sex below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet using Theta*n, 2=dirichlet using beta, 3=MV_Tweedie
#_ParmSelect:  consecutive index for dirichlet or MV_Tweedie
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 1 0 0 0 1 #_fleet:1_FISHERY1
0 1e-07 1 0 0 0 1 #_fleet:2_SURVEY1
0 1e-07 1 0 0 0 1 #_fleet:3_SURVEY2
1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sex*length distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_year month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
 1971 7 1 3 0 2 1 -1 75 0 0 0 0 3 1 1 4 2 1 0 1 2 2 13 2 3 0 0 4 2 1 1 2 1 2 2 1 2 1 2 6 5 8
 1972 7 1 3 0 2 1 -1 75 2 1 1 1 0 3 1 2 2 5 3 1 2 2 9 8 3 0 0 1 2 3 1 3 0 5 1 3 0 2 1 2 3 2
 1973 7 1 3 0 2 1 -1 75 0 0 1 0 1 1 2 3 3 1 1 5 2 2 7 4 3 0 0 0 4 1 3 5 1 2 3 1 3 2 0 5 3 6
 1974 7 1 3 0 2 1 -1 75 0 0 2 0 1 4 2 2 2 4 1 1 1 2 6 6 6 0 0 4 1 2 2 1 2 0 0 1 2 1 1 6 5 7
 1975 7 1 3 0 2 1 -1 75 0 0 1 2 3 1 1 1 2 1 2 2 2 3 10 3 4 0 0 0 0 10 1 2 3 2 1 0 0 0 0 9 3 6
 1976 7 1 3 0 2 1 -1 75 0 0 1 0 2 2 2 1 3 1 2 3 1 1 7 1 3 0 0 0 0 7 4 3 2 1 2 4 4 0 0 8 10 0
 1977 7 1 3 0 2 1 -1 75 0 0 0 0 7 1 0 0 2 4 2 2 3 1 7 2 3 0 0 2 1 4 2 3 3 4 2 2 2 0 1 8 3 4
 1978 7 1 3 0 2 1 -1 75 0 0 3 2 1 1 0 2 0 2 4 3 1 0 9 4 6 0 0 2 2 5 1 0 2 3 2 4 2 0 4 4 3 3
 1979 7 1 3 0 2 1 -1 75 2 0 1 5 2 1 2 3 3 3 2 2 1 0 3 7 0 0 0 2 0 1 0 2 3 2 5 1 3 1 2 6 9 1
 1980 7 1 3 0 2 1 -1 75 0 1 0 2 0 1 1 2 2 3 2 1 1 0 7 8 0 0 0 0 3 2 1 1 1 2 2 4 2 2 2 11 3 8
 1981 7 1 3 0 2 1 -1 75 0 4 0 3 7 2 2 2 2 1 1 2 2 1 4 4 6 0 0 3 2 2 1 1 3 2 2 0 1 2 2 5 3 3
 1982 7 1 3 0 2 1 -1 75 0 2 1 1 3 3 2 1 1 2 2 1 0 2 6 3 9 0 0 0 0 3 5 0 1 4 1 1 1 2 1 8 9 0
 1983 7 1 3 0 2 1 -1 75 0 0 0 6 1 2 2 2 1 1 4 5 0 0 6 2 7 0 0 3 1 3 5 1 0 1 1 3 0 3 3 5 3 4
 1984 7 1 3 0 2 1 -1 75 0 0 0 3 4 0 3 6 3 1 4 0 2 0 7 2 3 0 0 3 1 5 4 2 3 5 1 2 1 2 0 1 2 5
 1985 7 1 3 0 2 1 -1 75 0 0 0 5 1 2 4 5 0 2 4 3 2 3 3 4 5 0 0 0 1 2 3 2 4 2 0 2 3 1 1 7 2 2
 1986 7 1 3 0 2 1 -1 75 0 2 2 1 3 7 4 3 2 2 2 2 2 0 4 2 2 0 0 0 0 4 4 4 1 2 3 4 0 0 1 5 7 0
 1987 7 1 3 0 2 1 -1 75 0 3 1 3 1 2 3 4 2 3 3 2 2 1 3 2 0 0 0 7 1 5 1 4 2 4 3 2 3 1 0 2 1 4
 1988 7 1 3 0 2 1 -1 75 1 0 5 0 2 3 3 3 4 3 3 1 0 3 3 5 0 0 1 3 3 2 2 1 4 3 2 1 2 4 0 5 3 0
 1989 7 1 3 0 2 1 -1 75 0 3 1 1 4 3 7 1 5 1 1 4 1 0 1 7 0 0 0 5 3 4 1 1 5 3 1 5 2 1 0 2 2 0
 1990 7 1 3 0 2 1 -1 75 0 0 7 3 7 3 0 1 3 0 1 1 1 1 3 4 0 0 1 0 8 4 3 3 2 4 5 1 5 1 0 1 2 0
 1991 7 1 3 0 2 1 -1 75 0 0 4 1 7 4 2 3 2 1 0 1 1 3 3 3 0 0 3 4 2 5 4 4 1 3 3 0 4 2 0 4 1 0
 1992 7 1 3 0 2 1 -1 75 0 0 7 4 5 10 4 3 0 3 1 0 2 0 2 1 1 0 0 5 1 3 8 3 3 1 2 0 1 3 0 1 1 0
 1993 7 1 3 0 2 1 -1 75 0 0 7 4 3 7 5 7 2 1 0 1 0 4 0 0 0 0 0 3 3 4 3 7 0 0 4 2 1 1 1 5 0 0
 1994 7 1 3 0 2 1 -1 75 0 0 3 6 4 4 4 9 4 5 1 0 0 0 0 0 3 0 0 0 9 0 7 2 2 3 4 0 3 2 0 0 0 0
 1995 7 1 3 0 2 1 -1 75 3 1 2 0 8 5 2 6 2 5 0 2 1 4 0 0 0 0 0 0 2 5 3 2 3 5 6 1 0 1 1 3 1 1
 1996 7 1 3 0 2 1 -1 75 0 0 1 1 5 4 3 7 2 3 2 3 3 1 5 1 0 0 2 5 0 5 4 1 2 3 4 2 3 0 1 2 0 0
 1997 7 1 3 0 2 1 -1 75 0 5 3 5 0 2 4 3 4 5 1 1 3 2 2 0 0 0 0 0 3 1 6 5 5 2 3 4 1 2 3 0 0 0
 1998 7 1 3 0 2 1 -1 75 5 3 1 4 1 2 3 4 3 2 0 2 0 1 5 0 0 0 0 4 6 4 2 7 2 1 1 6 3 0 0 2 1 0
 1999 7 1 3 0 2 1 -1 75 2 2 3 3 6 3 3 3 8 3 3 3 0 1 1 0 0 0 1 3 3 3 5 4 0 4 2 4 0 1 0 1 0 0
 2000 7 1 3 0 2 1 -1 75 0 2 1 9 4 4 2 2 4 3 1 0 1 0 5 0 0 0 0 8 11 3 1 2 2 1 1 2 1 0 2 3 0 0
 2001 7 1 3 0 2 1 -1 75 0 1 1 6 8 1 1 0 5 2 2 2 0 3 4 0 0 0 0 5 3 4 6 3 3 1 4 3 1 1 2 3 0 0
 1977 7 2 3 0 2 1 -1 75 2 1 2 1 0 4 3 3 2 1 1 0 1 1 4 7 0 0 2 2 7 1 0 1 0 1 2 4 1 2 2 7 10 0
 1980 7 2 3 0 2 1 -1 75 3 3 4 6 5 2 0 2 3 0 3 2 2 2 2 1 4 0 2 3 5 3 1 2 1 1 2 1 1 1 0 3 1 4
 1983 7 2 3 0 2 1 -1 75 3 4 3 2 3 0 0 7 0 0 3 1 1 0 5 6 0 0 2 2 4 1 2 3 4 3 2 0 1 1 2 7 1 2
 1986 7 2 3 0 2 1 -1 75 3 0 2 5 3 5 5 3 1 3 2 1 1 1 3 0 2 0 0 2 3 6 6 1 3 3 1 1 1 1 2 2 3 0
 1989 7 2 3 0 2 1 -1 75 7 3 7 3 2 1 0 3 2 1 2 1 1 5 0 0 0 0 4 8 6 1 2 3 5 1 1 2 0 4 0 0 0 0
 1992 7 2 3 0 2 1 -1 75 2 5 3 4 0 5 0 5 2 0 0 0 1 0 3 0 0 0 4 5 5 10 8 6 2 1 2 0 0 1 0 1 0 0
 1995 7 2 3 0 2 1 -1 75 0 5 2 3 2 3 5 4 2 1 1 2 0 0 3 0 0 0 2 3 5 11 2 6 5 1 2 1 2 0 0 2 0 0
 1998 7 2 3 0 2 1 -1 75 9 4 4 3 1 1 1 1 3 3 1 2 1 7 0 0 0 0 6 5 3 5 1 3 3 2 3 2 0 1 0 0 0 0
 2001 7 2 3 0 2 1 -1 75 4 0 4 11 5 3 4 2 2 0 0 0 0 0 2 0 0 0 2 4 7 11 5 2 0 2 2 2 0 0 0 1 0 0
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
0 #_Use_MeanSize-at-Age_obs (0/1)
#
0 #_N_environ_variables
# -2 in year will subtract mean for that env_var; -1 will subtract mean and divide by stddev (e.g. Z-score)
#_year variable value
#
# Sizefreq data. Defined by method because a fleet can use multiple methods
0 # N sizefreq methods to read (or -1 for expanded options)
# 
0 # do tags (0/1/2); where 2 allows entry of TG_min_recap
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#_year, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
#_year, seas, fleet, age/size, bin, selex_prior, prior_sd
# feature not yet implemented
#
999

