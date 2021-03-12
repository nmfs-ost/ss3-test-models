#V3.30.14.05-safe;_2019_09_05;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: vermilion.dat // vermilion.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_between/within_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
 3 4 1 #_blocks_per_pattern 
# begin and end years of blocks
 1990 2004 2005 2007 2008 2017
 1990 1996 1997 2004 2005 2007 2008 2017
 2008 2016
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
 #_Age_natmort_by sex x growthpattern
 0.234 0.342 0.287 0.257 0.239 0.228 0.22 0.215 0.212 0.209 0.207 0.206 0.205 0.204 0.204
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0.5 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
# Sex: 1  BioPattern: 1  Growth
 0.0001 1e+006 11.83 11.83 0 0 -1 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 0.0001 1e+006 34.4 34.4 0 0 -1 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0 1e+006 0.3254 0.3254 0 0 -1 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0 1e+006 0.2535 0.0001 0 0 -1 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0 1e+006 0.2535 0.0001 0 0 -1 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1e+006 2.19e-005 2.19e-005 0 0 -1 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 0 1e+006 2.916 2.916 0 0 -1 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 0 1e+006 14.087 14.087 0 0 -1 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -1 1e+006 -0.574 -0.574 0 0 -1 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 1e+006 278.715 278.715 0 0 -1 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 0 1e+006 3.042 3.042 0 0 -1 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-006 0.999999 0.5 0.5 0.5 0 -1 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
1  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             0         13.82       10.2164          6.91             0             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.22          0.96      0.714061           0.6          0.74             0          2          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.3           0.2             0             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             0             0         -3          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0             0             0         -2          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1994 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
1970.0   #_last_early_yr_nobias_adj_in_MPD 
1999.3   #_first_yr_fullbias_adj_in_MPD 
2014.7   #_last_yr_fullbias_adj_in_MPD 
2018.2   #_first_recent_yr_nobias_adj_in_MPD 
0.9293   #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)   
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016F 2017F 2018F
#  -0.490348 -0.242193 -0.231156 -0.160269 -0.260471 0.285795 0.19588 0.166765 0.12511 0.119568 -0.148796 -0.0146184 0.20955 -0.230986 -0.311202 -0.481099 -0.167283 0.145358 0.259514 0.116869 0.260858 0.853155 0.39313 -0.114871 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.5 # F ballpark
-2001 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
3 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
 0.05 1 0 # overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)

#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2018 2038
# F rates by fleet
# Yr:  1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# CM_E 3.35642e-005 6.70799e-005 0.000101719 0.000136993 0.000173634 0.000211503 0.000250409 0.000291357 0.000334533 0.00038004 0.000428778 0.000478981 0.000528947 0.000576564 0.000638023 0.000641634 0.000339013 0.000695897 0.00140316 0.00181558 0.00172288 0.00191343 0.00171323 0.00292358 0.00280535 0.00617707 0.0054919 0.00754216 0.00658777 0.00510805 0.00379662 0.00559587 0.00589477 0.00945059 0.0135966 0.0178405 0.0192141 0.015754 0.0153669 0.0156343 0.0394273 0.0334753 0.0451458 0.0667222 0.0689394 0.0722888 0.0614297 0.0609565 0.0511046 0.0625665 0.0497076 0.0558122 0.0648911 0.0728792 0.0577289 0.0852835 0.0911045 0.0920053 0.102839 0.152304 0.0732397 0.142046 0.102519 0.0587922 0.0657483 0.0352883 0.0382144 0.0382333 0.0382333
# CM_W 2.97616e-005 5.96173e-005 8.98152e-005 0.000120753 0.0001527 0.000185742 0.000219931 0.000255469 0.000292614 0.000331804 0.000373423 0.000417509 0.000463189 0.000508591 0.000539352 0.000481644 0.000156322 0.000374681 0.00121253 0.000663338 0.00110534 0.0012171 0.00119768 0.00143687 0.00177129 0.0029377 0.00164717 0.00538834 0.0045794 0.00628051 0.0042954 0.0033996 0.00439639 0.00495998 0.0267497 0.0242245 0.0324558 0.0369085 0.0390869 0.0420144 0.0429166 0.0379455 0.0525523 0.055091 0.0604697 0.041246 0.0443371 0.0797954 0.0732685 0.0982714 0.0728111 0.0901626 0.101156 0.123377 0.115058 0.105384 0.0703268 0.1261 0.0856603 0.0796273 0.0614443 0.0572594 0.0725951 0.0445782 0.0585716 0.0571478 0.0558899 0.04343 0.04343
# REC 0.000146044 0.000396389 0.000657222 0.000929091 0.00121084 0.0015041 0.00180939 0.00213031 0.00247381 0.00284481 0.0032405 0.00363744 0.00399333 0.00430905 0.00463394 0.00498324 0.00535779 0.00574949 0.0061624 0.00660019 0.00706824 0.00753541 0.00795718 0.00835217 0.00874336 0.00915002 0.00956625 0.0100195 0.0105406 0.0111131 0.0117092 0.0123058 0.0275791 0.0106401 0.0165542 0.032521 0.0467499 0.0603293 0.091821 0.0509323 0.0698147 0.0914415 0.11636 0.0903718 0.0796988 0.117603 0.0505117 0.0911418 0.0486832 0.0978607 0.0578296 0.149162 0.118633 0.108944 0.109258 0.134443 0.126009 0.122353 0.0582702 0.0832678 0.0611143 0.146937 0.114544 0.198255 0.175589 0.136419 0.123313 0.140918 0.140918
# SMP_BYC 0.0497649 0.0678587 0.0801493 0.0842824 0.109272 0.113912 0.145658 0.1668 0.204336 0.220338 0.22033 0.166867 0.160718 0.183323 0.193747 0.215227 0.211941 0.231153 0.235123 0.267733 0.252521 0.241266 0.236328 0.240558 0.240005 0.242124 0.252002 0.277197 0.293917 0.308541 0.315997 0.286983 0.273429 0.276505 0.313552 0.303182 0.330898 0.274654 0.251442 0.276051 0.242523 0.253171 0.318937 0.361006 0.550439 0.426907 0.402567 0.414399 0.502832 0.32835 0.262954 0.290981 0.360275 0.308514 0.284381 0.237136 0.154533 0.106944 0.0762657 0.122585 0.0913044 0.109893 0.097378 0.108884 0.0868988 0.0712916 0.0735476 0.0796385 0.100764
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         0         0         1  #  CM_E
         2         1         0         0         0         1  #  CM_W
         3         1         0         0         0         1  #  REC
         4         1         0         0         0         0  #  SMP_BYC
         5         1         0         0         0         1  #  HB_E
         6         1         0         0         0         1  #  HB_W
         7         1         0         0         0         1  #  LARVAL
         8         1         0         0         0         1  #  VIDEO
         9         1         0         0         0         1  #  SEAMAP
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -25            25      -8.91163             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CM_E(1)
           -25            25      -8.55842             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CM_W(2)
           -25            25      -9.50297             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_REC(3)
           -10            20       1.38557             0             0             0          2          0          0          0          0          0          0          0  #  LnQ_base_SMP_BYC(4)
           -25            25       -9.8828             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_HB_E(5)
           -25            25       -9.8033             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_HB_W(6)
           -27            25      -26.2164             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_LARVAL(7)
           -25            25      -10.4723             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_VIDEO(8)
           -25            25      -10.5735             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_SEAMAP(9)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 0 2 0 0 # 1 CM_E
 0 2 0 0 # 2 CM_W
 0 2 0 0 # 3 REC
 0 3 0 0 # 4 SMP_BYC
 0 0 0 0 # 5 HB_E
 0 0 0 0 # 6 HB_W
 0 0 0 0 # 7 LARVAL
 24 0 0 0 # 8 VIDEO
 24 0 0 0 # 9 SEAMAP
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 12 0 0 0 # 1 CM_E
 12 0 0 0 # 2 CM_W
 20 0 0 0 # 3 REC
 19 0 0 0 # 4 SMP_BYC
 15 0 0 3 # 5 HB_E
 15 0 0 3 # 6 HB_W
 0 0 0 0 # 7 LARVAL
 0 0 0 0 # 8 VIDEO
 0 0 0 0 # 9 SEAMAP
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   CM_E LenSelex
            10           100         10.16         10.16            -1             0         -3          0          0          0          0          0          1          2  #  Retain_L_infl_CM_E(1)
            -1            20        1e-006             1            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_width_CM_E(1)
           -10            10            10            10            -1             0         -2          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_CM_E(1)
            -1             2             0             0            -1             0         -4          0          0          0          0          0          0          0  #  Retain_L_maleoffset_CM_E(1)
           -10            10            -5            -5            -1             0         -2          0          0          0          0          0          0          0  #  DiscMort_L_infl_CM_E(1)
            -1             2        1e-006             1            -1             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_width_CM_E(1)
            -1             2          0.15          0.15            -1             0         -2          0          0          0          0          0          3          2  #  DiscMort_L_level_old_CM_E(1)
            -1             2             0             0            -1             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_CM_E(1)
# 2   CM_W LenSelex
            10           100         10.16         10.16            -1             0         -3          0          0          0          0          0          1          2  #  Retain_L_infl_CM_W(2)
            -1            20        1e-006             1            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_width_CM_W(2)
           -10            10            10            10            -1             0         -2          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_CM_W(2)
            -1             2             0             0            -1             0         -4          0          0          0          0          0          0          0  #  Retain_L_maleoffset_CM_W(2)
           -10            10            -5            -5            -1             0         -2          0          0          0          0          0          0          0  #  DiscMort_L_infl_CM_W(2)
            -1             2        1e-006             1            -1             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_width_CM_W(2)
            -1             2          0.15          0.15            -1             0         -2          0          0          0          0          0          3          2  #  DiscMort_L_level_old_CM_W(2)
            -1             2             0             0            -1             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_CM_W(2)
# 3   REC LenSelex
            10           100         10.16         10.16            -1             0         -3          0          0          0          0          0          2          2  #  Retain_L_infl_REC(3)
            -1            20        1e-006             1            -1             0         -3          0          0          0          0          0          0          0  #  Retain_L_width_REC(3)
           -10            10            10            10            -1             0         -2          0          0          0          0          0          2          2  #  Retain_L_asymptote_logit_REC(3)
            -1             2             0             0            -1             0         -4          0          0          0          0          0          0          0  #  Retain_L_maleoffset_REC(3)
           -10            10            -5            -5            -1             0         -2          0          0          0          0          0          0          0  #  DiscMort_L_infl_REC(3)
            -1             2        1e-006             1            -1             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_width_REC(3)
            -1             2          0.15          0.15            -1             0         -2          0          0          0          0          0          3          2  #  DiscMort_L_level_old_REC(3)
            -1             2             0             0            -1             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_REC(3)
# 4   SMP_BYC LenSelex
# 5   HB_E LenSelex
# 6   HB_W LenSelex
# 7   LARVAL LenSelex
# 8   VIDEO LenSelex
           7.5          52.5       19.2284          42.7          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_peak_VIDEO(8)
           -10             3      -1.57507          -0.4          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_VIDEO(8)
            -6            12       1.10234           5.5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_VIDEO(8)
            -4             6       1.30579           5.1          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_VIDEO(8)
           -15             5      -1.48478          -4.2          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_VIDEO(8)
            -8             5      0.594704           0.4          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_VIDEO(8)
# 9   SEAMAP LenSelex
           7.5          52.5       14.8883            13          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_peak_SEAMAP(9)
           -10             3      -3.63803          -1.1          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_SEAMAP(9)
            -6            12       1.34398           3.1          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_SEAMAP(9)
            -4             6       3.04162             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_SEAMAP(9)
           -15             5      -1.25553          -4.5          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_SEAMAP(9)
            -8             5       -5.4132           0.1          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_SEAMAP(9)
# 1   CM_E AgeSelex
           0.5            14       2.12032          2.66             0             0          3          0          0          0          0          0          0          0  #  Age_inflection_CM_E(1)
           0.5            14       0.91584        7.2774             0             0          1          0          0          0          0          0          0          0  #  Age_95%width_CM_E(1)
# 2   CM_W AgeSelex
           0.5            14       3.68149          2.66             0             0          3          0          0          0          0          0          0          0  #  Age_inflection_CM_W(2)
           0.5            14       2.09726        7.2774             0             0          1          0          0          0          0          0          0          0  #  Age_95%width_CM_W(2)
# 3   REC AgeSelex
             1            10       3.33151           4.3          0.05             0          2          0          0          0          0        0.5          0          0  #  Age_DblN_peak_REC(12)
           -10             3      -9.16309          -4.6          0.05             0          3          0          0          0          0        0.5          0          0  #  Age_DblN_top_logit_REC(12)
            -6            12      0.547825           0.7          0.05             0          3          0          0          0          0        0.5          0          0  #  Age_DblN_ascend_se_REC(12)
            -4             6       2.95149           2.7          0.05             0          3          0          0          0          0        0.5          0          0  #  Age_DblN_descend_se_REC(12)
           -15             5      -12.1067         -11.2          0.05             0          2          0          0          0          0        0.5          0          0  #  Age_DblN_start_logit_REC(12)
            -8             5      -1.82219          -3.3          0.05             0          2          0          0          0          0        0.5          0          0  #  Age_DblN_end_logit_REC(12)
# 4   SMP_BYC AgeSelex
        1e-007             2           0.5           0.5             0             0         -4          0          0          0          0          0          0          0  #  AgeSel_P1_SMP_BYC(4)
           0.5        1e+007           100           100             0             0         -4          0          0          0          0          0          0          0  #  AgeSel_P2_SMP_BYC(4)
           0.3             3           1.5           1.5             0             0         -4          0          0          0          0          0          0          0  #  AgeSel_P3_SMP_BYC(4)
           0.5        1e+007        2.4096        2.4096             0             0         -4          0          0          0          0          0          0          0  #  AgeSel_P4_SMP_BYC(4)
            -1             1             0             0             0             0         -4          0          0          0          0          0          0          0  #  AgeSel_P5_SMP_BYC(4)
            -1             1             0             0             0             0         -4          0          0          0          0          0          0          0  #  AgeSel_P6_SMP_BYC(4)
# 5   HB_E AgeSelex
# 6   HB_W AgeSelex
# 7   LARVAL AgeSelex
# 8   VIDEO AgeSelex
# 9   SEAMAP AgeSelex
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            10           100         20.32         20.32            -1             0      -4  # Retain_L_infl_CM_E(1)_BLK1repl_1990
            10           100         27.94         27.94            -1             0      -4  # Retain_L_infl_CM_E(1)_BLK1repl_2005
            10           100          25.4          25.4            -1             0      -4  # Retain_L_infl_CM_E(1)_BLK1repl_2008
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_CM_E(1)_BLK1repl_1990
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_CM_E(1)_BLK1repl_2005
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_CM_E(1)_BLK1repl_2008
            -1             2          0.15          0.15            -1             0      -4  # DiscMort_L_level_old_CM_E(1)_BLK3repl_2008
            10           100         20.32         20.32            -1             0      -4  # Retain_L_infl_CM_W(2)_BLK1repl_1990
            10           100         27.94         27.94            -1             0      -4  # Retain_L_infl_CM_W(2)_BLK1repl_2005
            10           100          25.4          25.4            -1             0      -4  # Retain_L_infl_CM_W(2)_BLK1repl_2008
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_CM_W(2)_BLK1repl_1990
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_CM_W(2)_BLK1repl_2005
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_CM_W(2)_BLK1repl_2008
            -1             2          0.15          0.15            -1             0      -4  # DiscMort_L_level_old_CM_W(2)_BLK3repl_2008
            10           100         20.32         20.32            -1             0      -4  # Retain_L_infl_REC(3)_BLK2repl_1990
            10           100          25.4          25.4            -1             0      -4  # Retain_L_infl_REC(3)_BLK2repl_1997
            10           100         27.94         27.94            -1             0      -4  # Retain_L_infl_REC(3)_BLK2repl_2005
            10           100          25.4          25.4            -1             0      -4  # Retain_L_infl_REC(3)_BLK2repl_2008
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_REC(3)_BLK2repl_1990
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_REC(3)_BLK2repl_1997
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_REC(3)_BLK2repl_2005
           -10            10            10            10            -1             0      -4  # Retain_L_asymptote_logit_REC(3)_BLK2repl_2008
            -1             2          0.15          0.15            -1             0      -4  # DiscMort_L_level_old_REC(3)_BLK3repl_2008
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     1     1     1     2     0     0     0     0     0     0     0
#      5     3     4     1     2     0     0     0     0     0     0     0
#      5     7     7     3     2     0     0     0     0     0     0     0
#      5     9     8     1     2     0     0     0     0     0     0     0
#      5    11    11     1     2     0     0     0     0     0     0     0
#      5    15    14     3     2     0     0     0     0     0     0     0
#      5    17    15     2     2     0     0     0     0     0     0     0
#      5    19    19     2     2     0     0     0     0     0     0     0
#      5    23    23     3     2     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
10 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 3 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 2 1 1 0 1
 2 2 1 0 1
 2 3 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_1
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_2
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_3
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_4
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_9
#  0 0 0 0 0 0 0 0 0 0 #_discard:_1
#  0 0 0 0 0 0 0 0 0 0 #_discard:_2
#  0 0 0 0 0 0 0 0 0 0 #_discard:_3
#  1 1 1 1 1 1 1 1 1 1 #_discard:_4
#  0 0 0 0 0 0 0 0 0 0 #_discard:_5
#  0 0 0 0 0 0 0 0 0 0 #_discard:_6
#  0 0 0 0 0 0 0 0 0 0 #_discard:_7
#  0 0 0 0 0 0 0 0 0 0 #_discard:_8
#  0 0 0 0 0 0 0 0 0 0 #_discard:_9
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_1
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_2
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_3
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_4
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_5
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_6
#  0 0 0 0 0 0 0 0 0 0 #_lencomp:_7
#  1 1 1 1 1 1 1 1 1 1 #_lencomp:_8
#  1 1 1 1 1 1 1 1 1 1 #_lencomp:_9
#  1 1 1 1 1 1 1 1 1 1 #_agecomp:_1
#  1 1 1 1 1 1 1 1 1 1 #_agecomp:_2
#  1 1 1 1 1 1 1 1 1 1 #_agecomp:_3
#  0 0 0 0 0 0 0 0 0 0 #_agecomp:_4
#  0 0 0 0 0 0 0 0 0 0 #_agecomp:_5
#  0 0 0 0 0 0 0 0 0 0 #_agecomp:_6
#  0 0 0 0 0 0 0 0 0 0 #_agecomp:_7
#  0 0 0 0 0 0 0 0 0 0 #_agecomp:_8
#  0 0 0 0 0 0 0 0 0 0 #_agecomp:_9
#  1 1 1 1 1 1 1 1 1 1 #_init_equ_catch
#  1 1 1 1 1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, year, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

