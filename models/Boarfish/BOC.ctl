#V3.30.20.00;_safe;_compile_date:_Sep 30 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.0
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

# Control file for Boarfish
# Data_and_control_files: BOCV1.dat // BOCV1.ctl

# 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
0
#_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1
#_N_platoons_Within_GrowthPattern 
1 
#_Cond  1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 # vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
# recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
4
# not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1
# number of recruitment settlement assignments 
1 
# unused option
0
#
# GPattern month  area  age (for each settlement assignment)
1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
#_Nblock_Patterns
0
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
# controls for all timevary parameters 
#_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
1
#
# AUTOGEN
# autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
1 1 1 1 1
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
# Natural Mortality
# _natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
0
# _N_breakpoints
#6
# age (real) at M breakpoints
#0.5 2 4 6 8 29
#
# GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1
# Age(post-settlement)_for_L1;linear growth below this
1
#_Growth_Age_for_L2 (999 to use as Linf)
999
#_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
-999
#_placeholder for future growth feature
0
#
#_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0
#_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1
#
# maturity_option: 1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1
# First_Mature_Age
2
# fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
1
# hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
0
# parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
# ** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
1
#
# growth_parms
# LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
#const
0.1 0.2 0.174 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_1_Fem_GP_1
#Gislason
#0.03 2.4 1.0199556 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_1_Fem_GP_1
#0.1  2.4 0.5566928 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_2_Fem_GP_1
#0.1  2.4 0.4338750 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_3_Fem_GP_1
#0.1  2.4 0.3145245 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_4_Fem_GP_1
#0.1  2.4 0.2422301 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_5_Fem_GP_1
#0.1  2.4 0.1782075 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_6_Fem_GP_1
#Charnov
#0.03 2.4 0.812053249 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_1_Fem_GP_1
#0.1  2.4 0.483882421 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_2_Fem_GP_1
#0.1  2.4 0.330972184 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_3_Fem_GP_1
#0.1  2.4 0.265509415 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_4_Fem_GP_1
#0.1  2.4 0.231187105 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_5_Fem_GP_1
#0.1  2.4 0.174212797 0.15 0.8 0 -1 0 0 0 0 0 0 0 # NatM_break_6_Fem_GP_1

# Sex: 1  BioPattern: 1  Growth
#0    20   6.63 16   -1 0  2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
0    20   6.63  6.6    1  6  1 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
10   40   15.205    34.1 -1 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
0.05 0.36 0.176   0.36  2 0 -2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
0.01 0.4  0.1    0.5  -1 0  2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
0.01 0.4  0.15    0.5  -1 0  -2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1

# Sex: 1  BioPattern: 1  WtLen
-1 1 0.000022 2.27e-05 -1 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
-3 5 2.94 2.946  -1 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1

# Sex: 1  BioPattern: 1  Maturity and Fecundity
#0  25 8.9  15  -1 0 -99 0 0 0 0 0 0 0 # Mat50%_GP_1
#-3 3 -1.6 -0.2 -1 0 -99 0 0 0 0 0 0 0 # Mat_slope_GP_1
0  25 8.78  15  -1 0 -99 0 0 0 0 0 0 0 # Mat50%_GP_1
-3 3 -2.34 -0.2 -1 0 -99 0 0 0 0 0 0 0 # Mat_slope_GP_1
-3 3  1    1   -1 0 -99 0 0 0 0 0 0 0 # Eggs/kg_inter_GP_1
-3 3  0    0   -1 0 -99 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_GP_1

# Hermaphroditism

# Recruitment Distribution 

# Cohort growth dev base
0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev

# Movement
# Age Error from parameters
# catch multiplier
# fraction female, by GP
1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
# M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
# seasonal_effects_on_biology_parms
# femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
0 0 0 0 0 0 0 0 0 0
# LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
3
# 0/1 to use steepness in initial equ recruitment calculation
0
# future feature:  0/1 to make realized sigmaR a function of SR curvature
0
# LO HI INIT     PRIOR  PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn # parm_name
3    45 28.9747  12.545 2     0       1     0       0       0        0        0      0     0       # SR_LN(R0)
0.1  1  0.7      0.74   0.113 -2      -1    0       0       0        0        0      0     0       # SR_BH_steep
0    2  1.2      0.23   0.05  0       -2    0       0       0        0        0      0     0       # SR_sigmaR
-5   5  0        0      1     0       -1    0       0       0        0        0      0     0       # SR_regime
0    1  0        0.456  0.054 0       -2    0       0       0        0        0      0     0       # SR_autocorr
# timevary SR parameters
# 0.0001 20 5 0.02 0.5 0 -5 # SR_regime_dev_se
# -0.99 0.99 0 0.89 0.5 0 -6 # SR_regime_dev_autocorr
# do_recdev: 0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
2
# first year of main recr_devs; early devs can preceed this era
2002
# last year of main recr_devs; forecast devs start in following year
2020
# recdev phase 
3 
# (0/1) to read 13 advanced options
1
-15  #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4    #_recdev_early_phase
-1   #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1    #_lambda for Fcast_recr_like occurring before endyr+1

1964.0   #_last_early_yr_nobias_adj_in_MPD 
2000.0   #_first_yr_fullbias_adj_in_MPD 
2020.0   #_last_yr_fullbias_adj_in_MPD 
2028.3   #_first_recent_yr_nobias_adj_in_MPD 
0.4511  #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models) 

#1995 #_last_yr_nobias_adj_in_MPD; begin of ramp
#2010 #_first_yr_fullbias_adj_in_MPD; begin of plateau
#2020 #_last_yr_fullbias_adj_in_MPD
#2022 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
#0.76 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)

0    #_period of cycles in recruitment (N parms read below)
-10  # min rec_dev
10   # max rec_dev
0    #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1994E 1995E 1996E 1997E 1998E 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021F 2022F 2023F 2024F
#  0.00653982 0.00764329 0.00806797 0.00673583 0.00336529 1.55563 -0.0244111 -0.024667 -0.0264682 -0.0339323 -0.0622268 -0.158955 -0.554279 -1.27955 -1.3175 -1.54533 -1.84677 0.263643 -1.72935 3.01691 -1.93438 0.141481 -2.27661 1.3492 1.14004 2.1719 3.1756 0 0 0 0
#
#Fishing Mortality info 
# F ballpark value in units of annual_F
0.23
# F ballpark year (neg value to disable)
-2008
# F_Method: 1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
4
# max F (methods 2-4) or harvest fraction (method 1)
10
# read list of fleets that do F as parameter; unlisted fleets stay hybrid, bycatch fleets must be included with start_PH=1, high F fleets should switch early
# (A) fleet, (B) F_starting_value (used if start_PH=1), (C) start_PH for parms (99 to stay in hybrid, <0 to stay at starting value)
# (A) (B) (C)  (terminate list with -9999 for fleet)
#1 0.05 1 # Fleet
1 0.05 99 # Fleet
-9999 1 1 
# end of list
#
#_number of loops for hybrid tuning; 4 good; 3 faster; 2 enough if switching to parms is enabled
4
#
# initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
# for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#  LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fleet 7.3266e-06 4.45375e-06 4.66409e-06 5.47506e-06 0.00329309 0.00403609 0.0130222 0.0498658 0.428901 1.0036 3.76649 8.82148 3.25027 10 10 6.6589 6.60317 9.46929 10 7.89287 9.96882 6.54502 1 1 1 1
#
# Catchabilities
# Q_setup for fleets with cpue or survey data
# 1: fleet number
# 2: link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
# 3: extra input for link, i.e. mirror fleet# or dev index number
# 4: 0/1 to select extra sd parameter
# 5: 0/1 for biasadj or not
# 6: 0/1 to float
# fleet link link_info extra_se biasadj float
  2     1    0         1        0       0      # Acoustic
  3     1    0         1        0       0      # IBTS
-9999 0 0 0 0 0
#
# Q_parms;Qunits_are_ln(q)
# LO    HI      INIT     PRIOR   PR_SD   PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn
-25	25	-0.14	-0.1	 0.1	 6	 1	0	0	0	0	0	0	0	#LnQ_base_Acoustic
0	1	0	 0.1	 0.1	 0	 -4	0	0	0	0	0	0	0	#Q_extraSD_Acoustic
#-25	25	-0.29	-0.2	 0.2	 6	 1	0	0	0	0	0	0	0	#LnQ_base_IBTS
-25	25	-0.29	-0.2	 0.2	 0	 1	0	0	0	0	0	0	0	#LnQ_base_IBTS
0	1	0	 0.1	 0.1	 0 	 -4	0	0	0	0	0	0	0	#Q_extraSD_IBTS

# no timevary Q parameters
#
# size_selex_patterns
# Pattern:_0;  parm=0; selex=1.0 for all sizes
# Pattern:_1;  parm=2; logistic; with 95% width specification
# Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
# Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
# Pattern:_15; parm=0; mirror another age or length selex
# Pattern:_6;  parm=2+special; non-parm len selex
# Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
# Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
# Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
# Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
# Pattern:_22; parm=4; double_normal as in CASAL
# Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
# Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
# Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
# Pattern:_25; parm=3; exponential-logistic in length
# Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
# Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (average over bin range)
# discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
# Pattern Discard Male Special
1  0 0 0 # 1 Fishery        #logistic
#0 0 0 0 # 2 Acoustic selex=1
11 0 0 0 # 2 Acoustic sel=1 for range
#15 0 0 1 # 2 Acoustic mirror fishery
#1 0 0 0 # 2 Acoustic
#24 0 0 0 # 3 Acoustic double normal
#27 0 0 4 # 2 Acoustic cubic spline
#0 0 0 0 # 3 IBTS selex=1
#11 0 0 0 # 3 IBTS sel=1 for range
#15 0 0 1 # 3 IBTS mirror fishery
#1 0 0 0 # 3 IBTS
#24 0 0 0 # 3 IBTS double normal
27 0 0 4 # 3 IBTS cubic spline
#
#
# age_selex_patterns
# Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
# Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
# Pattern:_11; parm=2; selex=1.0  for specified min-max age
# Pattern:_12; parm=2; age logistic
# Pattern:_13; parm=8; age double logistic. Recommend using pattern 18 instead.
# Pattern:_14; parm=nages+1; age empirical
# Pattern:_15; parm=0; mirror another age or length selex
# Pattern:_16; parm=2; Coleraine - Gaussian
# Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
# Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
# Pattern:_18; parm=8; double logistic - smooth transition
# Pattern:_19; parm=6; simple 4-parm double logistic with starting age
# Pattern:_20; parm=6; double_normal,using joiners
# Pattern:_26; parm=3; exponential-logistic in age
# Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
# Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
# Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
# Pattern Discard Male Special
0 0 0 0 # 1 Fishery
0 0 0 0 # 2 Acoustic
0 0 0 0 # 3 IBTS

# 1 Fishery LenSelex
# Logistic
# LO HI INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
# 5  20 	11	18    0     0       4     0       0       0        0        0      0     0        # Size_Inflection_Fishery
  5  20	        11	18    0     0       4     0       23	2002	2022	    5      0     0        # Size_Inflection_Fishery
-2  20 	1       0.1   10    0       5     0       0       0        0        0      0     0        # Size_95%width_Fishery

# 2 Acoustic LenSelex
# Logistic
# LO  HI  INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
# 5  20 	11 	18    0     0       4     0       0       0        0        0      0     0        # Size_Inflection_Acoustic
#-2  20 	1	0.1   10    0       5     0       0       0        0        0      0     0         # Size_95%width_Acoustic

# Range
# LO  HI  INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
1 7 5 2 0 0 -4 0 0 0 0 0 0 0  #SizeSel_P1_Acoustic
17 19 18 18 0 0 -4 0 0 0 0 0 0 0  #SizeSel_P2_Acoustic

#Double Normal (24)
#P1 peak: beginning size for the plateau
#P2 top: width of plateau, as logistic between peak and max length
#P3 ascending width (ln)
#P4 descending width (ln)
#P5 initial: selectivity for first bin
#P6 final: selectivity for last bin
# LO HI INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
# 2.5  20   10.0001   18    0     0    4   0   0   0   0   0   0   0  #SizeSel_P1_Acoustic
#-15   3   -12.5094  -2.2   0     0   -5   0   0   0   0   0   0   0  #SizeSel_P2_Acoustic
#-2    6    2.23739   2.5   0     0    5   0   0   0   0   0   0   0  #SizeSel_P3_Acoustic
#-12   20   20        3.8   0     0   -5   0   0   0   0   0   0   0  #SizeSel_P4_Acoustic
#-999  9   -999      -999  -99    0   -4   0   0   0   0   0   0   0  #SizeSel_P5_Acoustic
#-999  9   -999      -999  -99    0   -5   0   0   0   0   0   0   0  #SizeSel_P6_Acoustic

#Cubic Spline (27) - 4 nodes
# LO HI INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
#             0             2             0             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Code_Acoustic(2)
#       -0.001            10       0.53674             0         0.001             0          4          0          0          0          0          0          0          0  #  SizeSpline_GradLo_Acoustic(2)
#            -1           1    -0.0968763             0         0.001             0          5          0          0          0          0          0          0          0  #  SizeSpline_GradHi_Acoustic(2)
#             1            22       4.81197            11             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_1_Acoustic(2)
#             1            22       10.2054            11             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_2_Acoustic(2)
#             1            22       12.9836            11             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_3_Acoustic(2)
#             1            22       15.5619            11             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_4_Acoustic(2)
#            -9             7      -2.73206             0         0.001             0          5          0          0          0          0          0          0          0  #  SizeSpline_Val_1_Acoustic(2)
#            -9             7      -2.51502             0         0.001             0          5          0          0          0          0          0          0          0  #  SizeSpline_Val_2_Acoustic(2)
#            -9             7            -1             0             1             0        -99          0          0          0          0          0          0          0  #  SizeSpline_Val_3_Acoustic(2)
#            -9             7   -0.00910631             0         0.001             0          5          0          0          0          0          0          0          0  #  SizeSpline_Val_4_Acoustic(2)

# 3 IBTS Len Selex
# LO HI INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
# 5  20 	11 	18    0     0       4     0       0       0        0        0      0     0        # Size_Inflection_IBTS
#-2  20 	1       0.1   10    0       5     0       0       0        0        0      0     0        # Size_95%width_IBTS

# Range
# LO  HI  INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
#1 3 2 2 0 0 -4 0 0 0 0 0 0 0  #SizeSel_P1_IBTS
#17 19 18 18 0 0 -4 0 0 0 0 0 0 0  #SizeSel_P2_IBTS

#Double Normal
#P1 peak: beginning size for the plateau
#P2 top: width of plateau, as logistic between peak and max length
#P3 ascending width (ln)
#P4 descending width (ln)
#P5 initial: selectivity for first bin
#P6 final: selectivity for last bin
# LO HI INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
# 2.5  20   10.0001   18    0     0    4   0   0   0   0   0   0   0  #SizeSel_P1_IBTS
#-15   3   -12.5094  -2.2   0     0   -5   0   0   0   0   0   0   0  #SizeSel_P2_IBTS
#-2    6    2.23739   2.5   0     0    5   0   0   0   0   0   0   0  #SizeSel_P3_IBTS
#-12   20   20        3.8   0     0   -5   0   0   0   0   0   0   0  #SizeSel_P4_IBTS
#-999  9   -999      -999  -99    0   -4   0   0   0   0   0   0   0  #SizeSel_P5_IBTS
#-999  9   -999      -999  -99    0   -5   0   0   0   0   0   0   0  #SizeSel_P6_IBTS

#Cubic Spline (27) - 4 nodes
# LO    HI     INIT     PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
 0      2      0        0     1     0        -99          0          0          0          0          0          0          0  #  SizeSpline_Code_IBTS(4)
-0.001  10     1        0     0.001 0          4          0          0          0          0          0          0          0  #  SizeSpline_GradLo_IBTS(4)
-1      0.001 -0.894674 0     0.001 0          5          0          0          0          0          0          0          0  #  SizeSpline_GradHi_IBTS(4)
 1      22     5.04789  11    1     0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_1_IBTS(4)
 1      22     8.97694  11    1     0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_2_IBTS(4)
 1      22     12.5888  11    1     0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_3_IBTS(4)
 1      22     15.2556  11    1     0        -99          0          0          0          0          0          0          0  #  SizeSpline_Knot_4_IBTS(4)
-9      7     -4.19142  0     0.001 0          5          0          0          0          0          0          0          0  #  SizeSpline_Val_1_IBTS(4)
-9      7     -2.17355  0     0.001 0          5          0          0          0          0          0          0          0  #  SizeSpline_Val_2_IBTS(4)
-9      7     -1        0     1     0        -99          0          0          0          0          0          0          0  #  SizeSpline_Val_3_IBTS(4)
-9      7     -0.135724 0     0.001 0          5          0          0          0          0          0          0          0  #  SizeSpline_Val_4_IBTS(4)

# 1   Fishery AgeSelex
# 2   Acoustic AgeSelex
#_No_Dirichlet parameters
# LO  HI  INIT    PRIOR PR_SD PR_type PHASE env-var use_dev dev_mnyr dev_mxyr dev_PH Block Blk_Fxn  # parm_name
 -5   10  5.73579 0     1.813 6       6     0       0       0        0        0      0     0        # ln(DM_theta)_1
 -5   10  5.76823 0     1.813 6       6     0       0       0        0        0      0     0        # ln(DM_theta)_2
 -5   10  5.76823 0     1.813 6       6     0       0       0        0        0      0     0        # ln(DM_theta)_3

#
# Timevary selex parameters
#
#Annual deviations
#LO   HI   INIT   PRIOR    PR_SD   PR_type    PHASE
 0.0001  20     5      0.02      0.5     0        -5            # PEAK	value_FLEET1_dev_se
-0.99    0.99   0.00   0.89      0.5     0        -6            # PEAK	value_FLEET1_dev_autocorr

# use 2D_AR1 selectivity (0/1)
0
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
# TG_custom:  0=no read and autogen if tag data exist; 1=read
0
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
# base   base first block   block  env  env   dev   dev   dev   dev   dev
# type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
# 2     4     1     0     0     0     0     1     3  1999  2000     2 1.04955 -2.0365
#
# Input variance adjustments factors: 
# 1=add_to_survey_CV
# 2=add_to_discard_stddev
# 3=add_to_bodywt_CV
# 4=mult_by_lencomp_N
# 5=mult_by_agecomp_N
# 6=mult_by_size-at-age_N
# 7=mult_by_generalized_sizecomp
# Factor  Fleet  Value
  5       1         1
  5       2         1
 -9999    1         0  # terminator
#
# maxlambdaphase
4
# sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
1
# read 2 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
# like_comp fleet  phase  value  sizefreq_method
4 1 1 1 1
4 2 1 1 1
4 3 1 1 1
-9999      1      1      1      1  # terminator
#
# lambdas (for info only; columns are phases)
# 0 0 0 0 #_CPUE/survey:_1
# 1 1 1 1 #_CPUE/survey:_2
# 1 1 1 1 #_lencomp:_1
# 1 1 1 1 #_lencomp:_2
# 1 1 1 1 #_init_equ_catch1
# 1 1 1 1 #_init_equ_catch2
# 1 1 1 1 #_recruitments
# 1 1 1 1 #_parameter-priors
# 1 1 1 1 #_parameter-dev-vectors
# 1 1 1 1 #_crashPenLambda
# 0 0 0 0 # F_ballpark_lambda
#(0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
0
# 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
# 0 0 # Growth: (1) growth pattern, (2) growth ages
# 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
# -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
# -1 # list of ages for growth std (-1 in first bin to self-generate)
# -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999
