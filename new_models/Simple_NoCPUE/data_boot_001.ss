#V3.30.20.00;_safe;_compile_date:_Sep 30 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.0
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_Start_time: Thu Dec 29 11:13:25 2022
#_bootdata:_3
#C data file for simple example
#_bootstrap file: 1  irand_seed: 1672330405 first rand#: -1.04329
#V3.30.20.00;_safe;_compile_date:_Sep 30 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.0
1971 #_StartYr
2001 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
2 #_Ngenders: 1, 2, -1  (use -1 for 1 sex setup with SSB multiplied by female_frac parameter)
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
 1 1 1 1 0 FISHERY1  # 1
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
#_catch_biomass(mtons):_columns_are_fisheries,year,season
#_catch:_columns_are_year,season,fleet,catch,catch_se
#_Catch data: yr, seas, fleet, catch, catch_se
-999 1 1 0 0.01
1971 1 1 0 0.01
1972 1 1 202.679 0.01
1973 1 1 1001.98 0.01
1974 1 1 1011.95 0.01
1975 1 1 1977.62 0.01
1976 1 1 3032.71 0.01
1977 1 1 4006.52 0.01
1978 1 1 5032.2 0.01
1979 1 1 5986.58 0.01
1980 1 1 8112.58 0.01
1981 1 1 9838.51 0.01
1982 1 1 9857.51 0.01
1983 1 1 10036 0.01
1984 1 1 10022.8 0.01
1985 1 1 9938.51 0.01
1986 1 1 9979.72 0.01
1987 1 1 9922.28 0.01
1988 1 1 9026.79 0.01
1989 1 1 7888.66 0.01
1990 1 1 6937.38 0.01
1991 1 1 6002.81 0.01
1992 1 1 4056.75 0.01
1993 1 1 4017.9 0.01
1994 1 1 4049.63 0.01
1995 1 1 3931.85 0.01
1996 1 1 4069.33 0.01
1997 1 1 2933.07 0.01
1998 1 1 3037.22 0.01
1999 1 1 2963.64 0.01
2000 1 1 3042.76 0.01
2001 1 1 3007.96 0.01
-9999 0 0 0 0
#
 #_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; 30=spawnbio; 31=recdev; 32=spawnbio*recdev; 33=recruitment; 34=depletion(&see Qsetup); 35=parm_dev(&see Qsetup)
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
1 0 0 0 # FISHERY1
2 0 0 0 # SURVEY1
3 0 0 0 # SURVEY2
#_year month index obs err
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note: only enter units and errtype for fleets with discard 
# note: discard data is the total for an entire season, so input of month here must be to a month in that season
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  type=1 for mean length; type=2 for mean body weight 
#_yr month fleet part type obs stderr
#  -9999 0 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
2 # binwidth for population size comp 
10 # minimum size in the population (lower edge of first bin and size at age 0.00) 
94 # maximum size in the population (lower edge of last bin) 
1 # use length composition data (0/1)
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_combM+F: males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet using Theta*n, 2=dirichlet using beta, 3=MV_Tweedie
#_ParmSelect:  consecutive index for dirichlet or MV_Tweedie
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 0 0 0 0 1 #_fleet:1_FISHERY1
0 1e-07 0 0 0 0 1 #_fleet:2_SURVEY1
0 1e-07 0 0 0 0 1 #_fleet:3_SURVEY2
25 #_N_LengthBins
 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 68 72 76 80 90
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part Nsamp datavector(female-male)
 1971 7 1 3 0 125  0 0 0 0 0 0 0 0 0 2 1 1 1 2 2 6 7 1 8 5 10 3 8 0 0 0 0 0 0 0 0 0 0 4 1 2 3 0 2 1 5 5 5 5 13 9 4 9 0 0
 1972 7 1 3 0 125  0 0 0 0 0 0 0 0 0 6 1 1 2 2 2 2 5 3 4 15 4 9 5 5 0 0 0 0 0 0 0 0 0 2 3 0 2 2 4 3 4 2 8 2 5 12 7 3 0 0
 1973 7 1 3 0 125  0 0 0 0 0 0 0 0 0 0 0 0 15 4 2 4 3 10 4 9 6 8 10 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 2 3 2 4 4 10 10 9 2 1 0
 1974 7 1 3 0 125  0 0 0 0 0 0 0 0 0 3 0 0 0 3 4 7 7 4 3 9 11 9 5 0 0 0 0 0 0 0 0 0 0 0 0 1 4 1 5 4 1 5 3 5 12 9 4 5 1 0
 1975 7 1 3 0 125  0 0 0 0 0 0 0 2 0 1 2 2 1 3 2 2 2 6 5 12 11 7 8 0 0 0 0 0 0 0 0 0 0 0 2 1 0 1 3 0 4 7 5 6 12 7 8 3 0 0
 1976 7 1 3 0 125  0 0 0 0 0 0 0 3 0 3 1 2 4 3 6 3 4 2 4 9 6 4 3 3 0 0 0 0 0 0 0 1 0 0 0 2 1 2 4 3 2 3 7 3 13 12 7 5 0 0
 1977 7 1 3 0 125  0 0 0 0 0 0 0 1 0 1 0 2 4 3 2 2 2 2 6 12 7 6 4 1 0 0 0 0 0 0 0 1 1 1 0 3 0 0 7 3 2 11 3 6 8 12 6 6 0 0
 1978 7 1 3 0 125  0 0 0 0 0 0 4 0 1 1 0 1 1 3 4 4 2 7 3 7 6 4 5 0 0 0 0 0 0 0 0 0 1 1 1 2 6 3 2 1 3 3 6 8 13 11 4 7 0 0
 1979 7 1 3 0 125  0 0 0 0 0 0 0 0 0 0 5 4 0 2 1 5 1 4 8 9 10 10 4 1 0 0 0 0 0 0 0 0 0 3 1 1 2 0 3 2 4 3 3 7 13 7 6 3 3 0
 1980 7 1 3 0 125  0 0 0 0 0 0 0 4 1 1 0 1 5 3 4 1 3 2 1 8 6 7 5 5 0 0 0 0 0 0 0 0 0 3 1 1 0 3 4 9 1 3 6 2 11 12 9 3 0 0
 1981 7 1 3 0 125  0 0 0 0 0 0 2 1 1 2 3 5 2 4 0 3 2 4 3 10 8 7 4 0 0 0 0 0 0 0 1 0 0 0 1 1 2 4 3 3 3 3 5 10 11 8 4 5 0 0
 1982 7 1 3 0 125  0 0 0 0 0 0 0 0 0 1 2 0 2 7 5 2 1 3 2 12 10 13 0 0 0 0 0 0 0 0 0 0 3 1 1 1 3 3 4 3 5 3 6 5 5 8 8 6 0 0
 1983 7 1 3 0 125  0 0 0 0 0 0 0 0 0 0 5 1 0 2 3 4 3 4 4 12 12 3 6 0 0 0 0 0 0 0 0 0 0 0 5 0 5 5 3 5 4 2 6 7 8 8 6 2 0 0
 1984 7 1 3 0 125  0 0 0 0 0 0 0 0 0 0 3 1 7 5 4 4 3 2 0 6 8 9 4 0 0 0 0 0 0 0 0 0 3 0 1 3 3 1 3 3 5 6 5 6 9 9 8 4 0 0
 1985 7 1 3 0 125  0 0 0 0 0 0 0 0 2 0 0 1 4 5 1 4 6 5 7 6 9 7 4 3 0 0 0 0 0 0 0 0 0 0 2 2 2 0 6 4 9 3 5 7 10 5 2 4 0 0
 1986 7 1 3 0 125  0 0 0 0 0 0 0 0 2 0 0 2 2 3 1 8 3 5 3 12 10 2 9 0 0 0 0 0 0 0 3 0 1 1 1 1 4 1 2 4 7 4 3 4 8 9 8 2 0 0
 1987 7 1 3 0 125  0 0 0 0 3 0 1 0 0 1 1 0 4 4 4 5 6 8 6 10 4 7 5 0 0 0 0 0 0 0 0 0 5 0 2 2 1 1 1 4 8 5 4 2 6 5 6 4 0 0
 1988 7 1 3 0 125  0 0 0 0 0 4 2 0 3 2 3 1 3 2 3 4 3 5 3 11 6 3 4 0 0 0 0 0 0 0 1 0 2 4 2 0 2 6 3 1 3 4 3 3 10 8 11 0 0 0
 1989 7 1 3 0 125  0 0 0 0 0 0 0 0 2 3 2 1 4 2 3 5 2 10 7 7 5 2 3 0 0 0 0 0 0 0 0 1 0 2 6 2 3 1 3 7 3 3 5 6 12 5 5 3 0 0
 1990 7 1 3 0 125  0 0 0 0 0 0 0 3 1 3 4 4 5 6 3 0 3 7 4 7 4 5 7 0 0 0 0 0 0 0 1 0 1 0 3 4 4 4 7 4 2 2 11 5 6 3 1 1 0 0
 1991 7 1 3 0 125  0 0 0 0 0 0 0 3 3 4 3 1 2 1 7 3 6 4 2 13 2 5 0 0 0 0 0 0 0 2 0 0 0 1 2 5 2 7 7 7 7 5 3 5 7 2 4 0 0 0
 1992 7 1 3 0 125  0 0 0 0 1 0 1 0 2 1 4 5 7 3 8 4 5 3 4 5 6 5 0 0 0 0 0 0 0 0 0 0 1 0 3 5 3 5 2 8 8 6 3 4 5 4 4 0 0 0
 1993 7 1 3 0 125  0 0 0 0 0 0 3 2 0 4 3 4 5 7 9 5 5 2 3 7 4 3 0 0 0 0 0 0 0 0 0 0 5 0 2 0 1 5 4 4 9 4 5 4 7 4 1 4 0 0
 1994 7 1 3 0 125  0 0 0 0 0 0 0 0 0 0 0 4 0 3 3 6 6 5 7 10 13 3 4 0 0 0 0 0 0 0 0 0 3 2 2 0 6 4 10 6 5 4 4 4 3 3 4 1 0 0
 1995 7 1 3 0 125  0 0 0 2 0 0 0 0 1 2 4 2 4 4 8 8 2 7 6 7 10 0 0 0 0 0 0 0 0 1 0 1 0 2 2 3 1 3 2 6 4 8 7 7 5 4 2 0 0 0
 1996 7 1 3 0 125  0 0 0 3 1 1 1 0 1 1 2 2 5 3 4 2 6 10 6 4 4 5 0 0 0 0 0 0 0 0 0 3 1 2 3 2 1 7 5 2 10 1 7 7 8 3 1 1 0 0
 1997 7 1 3 0 125  0 0 0 1 1 0 0 2 1 3 1 0 4 5 9 5 7 4 2 10 12 0 0 0 0 0 0 0 0 0 1 0 1 1 1 0 1 5 3 4 5 8 7 1 9 9 2 0 0 0
 1998 7 1 3 0 125  0 0 0 0 5 3 1 0 2 2 1 3 2 1 4 5 7 4 1 5 5 3 1 0 0 0 0 0 0 4 2 1 4 1 1 3 1 5 4 4 7 7 6 2 8 5 3 2 0 0
 1999 7 1 3 0 125  0 0 0 0 2 0 2 1 4 1 2 4 1 2 3 1 4 6 3 8 4 7 0 0 0 0 0 0 0 0 0 6 2 1 4 3 4 5 2 3 7 4 4 6 11 6 2 0 0 0
 2000 7 1 3 0 125  0 0 0 0 0 6 3 0 3 0 1 3 3 1 6 6 2 7 4 4 17 0 0 0 0 0 0 0 0 0 1 1 1 2 2 4 4 4 5 2 6 5 3 4 6 4 3 2 0 0
 2001 7 1 3 0 125  0 0 0 0 0 0 1 0 3 3 2 4 5 7 4 7 4 4 3 7 6 5 0 0 0 0 0 0 0 0 2 0 1 1 4 6 1 4 4 3 6 4 5 6 6 3 4 0 0 0
 1977 7 2 3 0 125  0 0 0 0 1 1 1 0 3 1 2 4 1 4 5 4 7 2 3 7 6 10 0 0 0 0 0 0 0 0 0 5 5 4 3 1 1 2 0 0 4 4 7 0 9 10 4 4 0 0
 1980 7 2 3 0 125  0 0 0 0 0 1 3 5 6 3 3 1 7 2 2 3 2 1 4 8 7 2 1 2 0 0 0 0 0 3 1 1 7 3 2 6 0 2 2 3 4 2 1 4 9 6 2 4 0 0
 1983 7 2 3 0 125  0 0 0 0 0 1 1 4 2 3 3 6 3 1 3 3 4 2 2 10 5 10 0 0 0 0 0 0 0 0 4 1 5 1 5 0 6 2 4 6 0 5 4 5 7 7 0 0 0 0
 1986 7 2 3 0 125  0 0 0 0 2 4 3 1 1 4 4 2 4 6 4 6 0 5 0 6 1 3 3 0 0 0 0 0 2 1 0 1 5 2 1 4 7 1 2 8 2 6 2 5 7 5 5 0 0 0
 1989 7 2 3 0 125  0 0 0 0 0 6 3 3 2 6 7 3 2 3 2 5 5 6 2 4 4 2 0 0 0 0 0 0 1 1 2 3 9 10 4 2 3 2 0 3 5 0 3 2 10 0 0 0 0 0
 1992 7 2 3 0 125  0 0 0 0 0 4 2 4 4 4 3 4 4 2 2 4 1 4 3 9 6 0 0 0 0 0 0 0 0 0 4 5 5 6 8 4 5 7 2 4 3 1 5 2 2 1 1 0 0 0
 1995 7 2 3 0 125  0 0 0 0 2 3 0 2 4 4 1 7 5 5 5 5 5 2 3 7 1 3 0 0 0 0 0 0 0 1 0 0 3 1 3 3 1 5 5 5 4 2 7 5 9 4 3 0 0 0
 1998 7 2 3 0 125  0 0 0 2 3 5 6 2 8 3 3 2 4 1 1 3 3 2 4 7 4 0 0 0 0 0 0 0 0 3 4 6 5 4 2 4 3 5 4 2 6 3 3 2 3 2 1 0 0 0
 2001 7 2 3 0 125  0 0 0 0 0 1 3 5 4 8 9 3 7 5 4 2 1 2 0 5 5 0 0 0 0 0 0 0 0 0 1 2 3 3 7 9 7 3 5 6 2 2 2 3 4 2 0 0 0 0
-9999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
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
#_combM+F: males and females treated as combined gender below this bin number 
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
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
1971  7 1  3 0 2 1 -1 75  0 0 0 0 5 0 4 7 3 5 3 0 2 4 3 3 6 0 0 2 0 1 1 1 3 2 2 1 0 0 1 4 4 8
1972  7 1  3 0 2 1 -1 75  4 1 1 2 3 0 3 3 2 1 1 2 0 0 7 6 4 0 0 1 2 2 1 2 3 4 2 2 2 2 0 5 1 6
1973  7 1  3 0 2 1 -1 75  0 0 3 0 3 2 3 5 3 2 1 1 1 3 3 0 7 0 0 0 3 0 1 3 4 0 3 3 1 2 0 4 5 9
1974  7 1  3 0 2 1 -1 75  0 0 1 1 1 2 1 1 2 3 5 1 1 4 9 3 1 0 0 4 2 0 4 2 1 3 4 2 2 1 2 5 2 5
1975  7 1  3 0 2 1 -1 75  0 0 2 1 4 1 4 0 4 2 1 2 1 1 10 3 6 0 0 0 0 7 0 2 2 2 1 1 2 1 2 6 1 6
1976  7 1  3 0 2 1 -1 75  0 0 2 0 2 3 4 2 2 1 1 4 5 0 8 4 3 0 0 0 0 3 0 3 1 3 0 4 0 2 2 7 9 0
1977  7 1  3 0 2 1 -1 75  0 0 0 0 5 3 2 1 4 3 2 2 1 2 6 2 4 0 0 2 3 0 0 3 4 2 4 1 3 3 2 6 1 4
1978  7 1  3 0 2 1 -1 75  0 0 3 3 2 1 3 3 4 5 2 4 1 1 6 2 5 0 0 3 0 1 1 1 1 2 1 1 3 3 2 5 4 2
1979  7 1  3 0 2 1 -1 75  2 1 3 3 1 2 0 0 7 1 2 3 1 2 3 9 0 0 0 3 2 2 2 0 3 3 4 1 0 2 1 5 3 4
1980  7 1  3 0 2 1 -1 75  0 3 1 1 1 5 1 1 1 0 2 2 0 1 5 10 0 0 0 0 3 5 2 2 2 1 1 4 2 1 2 8 3 5
1981  7 1  3 0 2 1 -1 75  0 1 0 3 1 1 1 1 3 2 2 7 1 3 7 2 1 0 0 1 1 5 3 2 0 4 5 2 2 0 1 4 0 9
1982  7 1  3 0 2 1 -1 75  0 3 3 2 1 1 3 2 2 0 1 2 0 0 4 2 10 0 0 0 0 10 3 2 3 2 1 2 1 2 2 4 7 0
1983  7 1  3 0 2 1 -1 75  0 0 0 3 2 0 3 4 3 1 2 1 4 0 6 3 6 0 0 1 1 1 5 4 2 3 0 1 2 2 1 5 4 5
1984  7 1  3 0 2 1 -1 75  0 0 0 2 3 4 4 6 1 0 3 1 1 1 3 2 2 0 0 2 2 2 2 4 5 2 3 1 0 0 1 10 3 5
1985  7 1  3 0 2 1 -1 75  0 0 0 10 1 5 1 0 10 1 1 4 1 0 3 0 4 0 0 0 3 1 0 2 4 3 1 3 2 1 0 4 5 5
1986  7 1  3 0 2 1 -1 75  0 1 0 2 1 6 3 0 3 2 3 1 2 0 3 4 4 0 0 0 0 7 1 7 3 2 2 1 2 2 1 7 5 0
1987  7 1  3 0 2 1 -1 75  0 4 0 3 2 1 4 4 2 5 1 2 0 0 3 7 0 0 0 1 2 3 6 2 0 5 5 5 3 0 0 3 2 0
1988  7 1  3 0 2 1 -1 75  2 0 2 2 2 4 4 4 4 1 1 1 1 0 4 5 0 0 1 4 1 2 3 8 3 4 0 0 3 1 0 2 6 0
1989  7 1  3 0 2 1 -1 75  0 1 1 2 3 3 2 5 2 2 2 2 3 1 3 0 0 0 0 5 4 2 4 5 5 4 6 0 2 0 1 1 4 0
1990  7 1  3 0 2 1 -1 75  0 0 4 2 7 3 1 3 2 2 0 1 0 1 2 10 0 0 1 4 2 5 3 2 1 4 4 2 1 0 1 3 4 0
1991  7 1  3 0 2 1 -1 75  0 0 7 6 2 7 4 4 1 1 3 1 2 1 2 0 0 0 2 2 4 4 1 3 1 5 1 3 0 2 1 1 4 0
1992  7 1  3 0 2 1 -1 75  0 0 5 6 3 4 3 3 0 1 2 1 2 3 2 0 0 0 0 5 3 4 4 6 3 1 1 4 1 1 0 5 2 0
1993  7 1  3 0 2 1 -1 75  0 0 10 0 3 5 4 8 4 0 0 2 0 5 0 0 0 0 0 4 3 4 5 7 5 1 0 1 0 1 0 3 0 0
1994  7 1  3 0 2 1 -1 75  0 0 3 3 4 5 2 8 5 3 2 0 1 1 0 1 1 0 0 0 8 4 3 8 2 2 1 4 0 4 0 0 0 0
1995  7 1  3 0 2 1 -1 75  2 0 1 7 4 4 5 3 1 1 2 1 2 2 0 0 0 0 0 0 10 2 2 4 7 1 3 1 0 1 3 4 1 1
1996  7 1  3 0 2 1 -1 75  0 0 5 3 6 3 3 2 2 5 2 3 2 2 1 1 0 0 2 2 3 1 5 6 1 4 2 5 0 1 0 3 0 0
1997  7 1  3 0 2 1 -1 75  0 9 4 0 2 5 4 2 3 1 2 1 0 0 5 0 0 0 0 0 10 3 1 7 2 1 4 3 2 0 4 0 0 0
1998  7 1  3 0 2 1 -1 75  5 2 3 2 0 3 1 2 5 3 4 1 1 2 2 0 0 0 0 5 2 2 2 3 8 5 0 2 3 2 1 3 1 0
1999  7 1  3 0 2 1 -1 75  2 2 4 2 3 2 3 4 6 0 5 3 5 1 3 0 0 0 4 1 4 1 3 1 4 4 1 2 2 0 1 2 0 0
2000  7 1  3 0 2 1 -1 75  0 2 3 1 4 4 6 4 1 3 2 4 1 1 2 0 0 0 0 7 3 7 3 3 1 2 0 2 0 3 0 6 0 0
2001  7 1  3 0 2 1 -1 75  0 3 6 4 8 6 2 2 1 1 1 1 0 0 6 0 0 0 0 3 6 4 2 2 2 1 3 2 2 3 0 4 0 0
1977  7 2  3 0 2 1 -1 75  2 4 1 2 2 1 3 1 1 2 3 1 2 0 2 10 0 0 3 1 4 4 5 1 4 2 0 0 0 1 0 4 9 0
1980  7 2  3 0 2 1 -1 75  4 2 7 2 2 2 0 1 3 0 2 0 1 2 1 6 2 0 2 1 8 5 2 5 0 1 0 1 1 1 1 2 4 4
1983  7 2  3 0 2 1 -1 75  0 3 1 7 3 6 2 4 0 1 4 0 0 1 4 2 0 0 2 4 7 1 3 3 3 3 3 0 0 1 1 5 0 1
1986  7 2  3 0 2 1 -1 75  3 4 3 0 2 7 2 1 2 2 3 2 0 0 1 5 2 0 0 5 2 6 5 3 0 0 1 4 1 1 0 2 6 0
1989  7 2  3 0 2 1 -1 75  2 4 10 5 2 1 3 2 0 1 0 1 0 4 0 0 0 0 7 6 5 5 2 2 1 2 1 1 3 5 0 0 0 0
1992  7 2  3 0 2 1 -1 75  3 2 5 7 6 2 1 1 3 0 1 0 1 1 1 0 0 0 8 4 4 5 10 3 2 2 1 0 0 2 0 0 0 0
1995  7 2  3 0 2 1 -1 75  0 8 4 5 4 5 3 5 2 1 1 0 0 0 0 0 0 0 5 1 1 10 4 2 6 3 1 2 0 1 0 1 0 0
1998  7 2  3 0 2 1 -1 75  10 6 5 5 3 1 2 1 4 1 3 0 3 1 0 0 0 0 2 6 4 4 3 2 3 0 1 2 1 2 0 0 0 0
2001  7 2  3 0 2 1 -1 75  4 2 3 7 6 7 5 2 1 1 0 0 0 0 0 0 0 0 1 8 8 5 0 2 0 3 1 1 2 3 1 2 0 0
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
1 #_Use_MeanSize-at-Age_obs (0/1)
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
# ageerr codes:  positive means mean length-at-age; negative means mean bodywt_at_age
#_yr month fleet sex part ageerr ignore datavector(female-male)
#                                          samplesize(female-male)
1971  7 1  3 0 1 2 30.6775 39.4661 43.7497 48.2784 53.6145 55.8417 55.823 61.0211 60.8354 62.4673 63.165 66.572 65.7396 64.3727 69.4035 71.2901 72.2642 33.1241 39.2648 46.3179 51.3019 50.8799 54.53 59.0144 61.1922 60.9829 62.6866 63.4949 66.7961 65.9271 68.8483 70.2248 70.2594 72.2122
 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
1995  7 1  3 0 1 2 31.7618 39.6413 43.988 48.2649 51.0192 55.8903 58.8877 59.8411 63.618 64.472 65.163 64.8121 68.1369 67.4874 68.4731 73.1035 76.3423 31.3823 40.5281 45.5969 48.9285 53.1231 56.9185 58.3845 59.7925 63.6929 64.2262 63.7668 65.4003 66.2278 64.1751 67.3585 70.2711 69.9894
 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
1971  7 2  3 0 1 2 34.9801 38.5394 44.4343 47.8165 51.1049 53.3689 54.8316 59.32 60.2442 62.6723 65.0856 64.0565 66.4517 65.83 71.7195 72.5234 75.3214 34.2282 39.4538 43.0512 46.2718 49.5377 53.311 57.4603 56.4682 59.4063 65.1147 62.8365 63.392 64.8886 67.2146 66.8963 69.4133 68.6234
 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
1995  7 2  3 0 1 2 34.3096 40.7173 43.2008 49.2734 49.3275 53.9491 55.1111 55.6381 60.1695 61.3195 65.3539 64.5129 64.4844 67.0948 71.4012 72.0023 72.5863 35.5456 38.6706 43.7959 48.9187 51.3515 51.7239 56.5654 58.4663 61.0991 63.2282 60.6178 64.8922 64.8887 69.3745 69.1717 71.003 70.9301
 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
0 #_N_environ_variables
# -2 in yr will subtract mean for that env_var; -1 will subtract mean and divide by stddev (e.g. Z-score)
#Yr Variable Value
#
# Sizefreq data. Defined by method because a fleet can use multiple methods
0 # N sizefreq methods to read (or -1 for expanded options)
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
 # Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
 # feature not yet implemented
#
999

