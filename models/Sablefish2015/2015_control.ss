#V3.30.21.00;_safe;_compile_date:_Feb 10 2023;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: 2015_data.ss // 2015_control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
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
5 #_Nblock_Patterns
 1 1 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1970 1996
 1982 2010
 1970 1981
 1970 2002
 1979 1979
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
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
#_NATMORT
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0.5 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
1 #_fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.11 0.0994793 -2.1791 0.3384 3 3 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 22 30 22 22 99 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 60 70 64.4759 66 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.15 0.35 0.35 0.25 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.03 0.15 0.141931 0.05 99 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.03 0.15 0.110799 0.11 99 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 3.26728e-06 0 99 6 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 0 4 3.27596 3.3 99 6 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 57 59 58 55 99 6 -50 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.13 -0.25 99 6 -50 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 99 6 -50 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 99 6 -50 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.01 0.11 0.0751053 -2.0565 0.3375 3 3 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0 0 99 0 -50 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 50 60 55.9351 0 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.2 0.5 0.483438 0 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 99 0 -50 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.03 0.15 0.0750235 0 99 0 2 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 3.32942e-06 0 99 6 -50 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 0 4 3.27292 3.3 99 6 -50 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution 
 -4 4 0 0 99 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 0 0 99 0 -50 0 0 0 0 0 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             8            12       11.9947           9.8            99             0          7          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.6           0.6         0.223             2         -9          0          0          0          0          0          0          0 # SR_BH_steep
           0.2           1.5          0.95           0.6            99             0        -50          0          0          0          0          0          0          0 # SR_sigmaR
            -1             1             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
            -1             1             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1970 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
6 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -6 #_recdev_early_phase
 6 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1971.37 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1980.72 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2014 #_last_yr_fullbias_adj_in_MPD
 2014.96 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.9253 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -4 #min rec_dev
 4 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.02 # F ballpark value in units of annual_F
-2000 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
0.9 # max F (methods 2-4) or harvest fraction (method 1)
# F_Method 1:  no additional input needed
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# HKL 0.0023655 0.00176248 0.00404852 0.00137222 0.00286019 0.00238166 0.00182067 0.00243733 0.00312135 0.00801001 0.00302966 0.00400617 0.00383345 0.00269696 0.0026127 0.00776525 0.0104902 0.013137 0.0114081 0.00978488 0.00940879 0.0154515 0.0144667 0.0114323 0.0123 0.0160315 0.0183246 0.0145819 0.00724472 0.011123 0.0110848 0.0095566 0.00694962 0.00792418 0.00854149 0.00933448 0.00848592 0.00660564 0.00728562 0.010317 0.0107135 0.0103665 0.00828504 0.00601897 0.00596807 0.00943975 0.00997882 0.0137018 0.0138536 0.0140799 0.0143027 0.0145005 0.0146624 0.0147925 0.0148986 0.0149871 0.0150623
# POT 0.0018707 0.00297749 0.00450815 0.00753551 0.0533947 0.149039 0.336025 0.0670171 0.108092 0.235765 0.0610498 0.0843741 0.168505 0.163773 0.129543 0.120761 0.098077 0.0749027 0.0846073 0.0885172 0.0770532 0.0520335 0.0412974 0.0462685 0.0783055 0.0628731 0.0458201 0.0270039 0.0210992 0.0358514 0.042212 0.033868 0.02376 0.0224432 0.0228928 0.0279065 0.029291 0.0189264 0.0183733 0.023427 0.0248999 0.0400336 0.032704 0.0236458 0.0290529 0.0325815 0.0350271 0.057723 0.0583629 0.059316 0.0602548 0.061088 0.0617701 0.0623182 0.062765 0.0631379 0.0634547
# TWL 0.0614059 0.0538621 0.0776669 0.095392 0.0787728 0.0921272 0.0938668 0.089038 0.121072 0.198105 0.131436 0.170236 0.567343 0.431867 0.52866 0.495899 0.486265 0.518291 0.464853 0.5167 0.491837 0.499458 0.575485 0.544708 0.436245 0.455587 0.511631 0.470217 0.278374 0.414894 0.352094 0.339104 0.206354 0.302747 0.324511 0.317199 0.334159 0.328061 0.381199 0.403627 0.337243 0.170196 0.149769 0.139337 0.122593 0.0974816 0.10412 0.278265 0.281349 0.285944 0.29047 0.294486 0.297774 0.300416 0.302571 0.304368 0.305895
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         0         0         1  #  ENV
         5         1         0         1         1         0  #  AKSHLF
         6         1         0         1         0         1  #  AKSLP
         7         1         0         1         0         1  #  NWSLP
         8         1         0         1         0         1  #  NWCBO
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      0.894433             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ENV(4)
            -3           0.5      -2.75912             0            99             0          1          0          1       1980       2004         -5          0          0  #  LnQ_base_AKSHLF(5)
           0.1           1.3      0.422492             0            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_AKSHLF(5)
           -15            15      -1.87462             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_AKSLP(6)
         0.001           0.7     0.0573009             0            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_AKSLP(6)
           -15            15      -2.57304             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWSLP(7)
         0.001           0.8     0.0955847             0            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_NWSLP(7)
           -15            15      -1.70248             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWCBO(8)
             0           0.4             0             0            99             0         -3          0          0          0          0          0          0          0  #  Q_extraSD_NWCBO(8)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_AKSHLF(5)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_AKSHLF(5)_dev_autocorr
# info on dev vectors created for Q parms are reported with other devs after tag parameter section 
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 0 2 0 0 # 1 HKL
 0 2 0 0 # 2 POT
 0 2 0 0 # 3 TWL
 0 0 0 0 # 4 ENV
 0 0 0 0 # 5 AKSHLF
 0 0 0 0 # 6 AKSLP
 0 0 0 0 # 7 NWSLP
 0 0 0 0 # 8 NWCBO
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic. Recommend using pattern 18 instead.
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 27 0 1 4 # 1 HKL
 27 0 1 4 # 2 POT
 27 0 1 5 # 3 TWL
 11 0 0 0 # 4 ENV
 20 0 0 0 # 5 AKSHLF
 20 0 0 0 # 6 AKSLP
 20 0 0 0 # 7 NWSLP
 20 0 0 0 # 8 NWCBO
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   HKL LenSelex
            25            45            25            30            99             0          6          0          0          0          0          0          3          2  #  Retain_L_infl_HKL(1)
         0.001             4             1             1            99             0         -6          0          0          0          0          0          0          0  #  Retain_L_width_HKL(1)
           -10            10       8.26614            10            99             0          6          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_HKL(1)
           -10            10             0             0            99             0        -50          0          0          0          0          0          0          0  #  Retain_L_maleoffset_HKL(1)
             8            70            28            18            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_infl_HKL(1)
         0.001             2          0.01             1            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_width_HKL(1)
          0.01           0.8           0.2           0.1            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_level_old_HKL(1)
           -10            10             0             0            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_HKL(1)
# 2   POT LenSelex
            35            60       46.5601            30            99             0          6          0          0          0          0          0          3          2  #  Retain_L_infl_POT(2)
             3            20       3.66139             1            99             0          6          0          0          0          0          0          0          0  #  Retain_L_width_POT(2)
           -10            10            10            10            99             0         -6          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_POT(2)
           -10            10             0             0            99             0        -50          0          0          0          0          0          0          0  #  Retain_L_maleoffset_POT(2)
             8            70            28            18            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_infl_POT(2)
         0.001             2          0.01             1            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_width_POT(2)
          0.01           0.8           0.2           0.1            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_level_old_POT(2)
           -10            10             0             0            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_POT(2)
# 3   TWL LenSelex
            35            55       45.0201            32            99             0          6          0          0          0          0          0          3          2  #  Retain_L_infl_TWL(3)
             1             5       2.09988             1            99             0          6          0          0          0          0          0          0          0  #  Retain_L_width_TWL(3)
           -10            10            10            10            99             0        -99          0          0          0          0          0          2          2  #  Retain_L_asymptote_logit_TWL(3)
           -10            10             0             0            99             0        -50          0          0          0          0          0          0          0  #  Retain_L_maleoffset_TWL(3)
             8            70            28            18            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_infl_TWL(3)
         0.001             2          0.01             1            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_width_TWL(3)
           0.1           0.8           0.5           0.5            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_level_old_TWL(3)
           -10            10             0             0            99             0        -50          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_TWL(3)
# 4   ENV LenSelex
# 5   AKSHLF LenSelex
# 6   AKSLP LenSelex
# 7   NWSLP LenSelex
# 8   NWCBO LenSelex
# 1   HKL AgeSelex
            -2             2             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Code_HKL_1
            -5             5      0.488307             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_GradLo_HKL_1
            -5             2     -0.751059             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_GradHi_HKL_1
             0            35             2             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_1_HKL_1
             0            35             6             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_2_HKL_1
             0            35             9             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_3_HKL_1
             0            35            13             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_4_HKL_1
            -5             3      -1.12207             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_Val_1_HKL_1
            -5             3             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Val_2_HKL_1
            -5             3     -0.347769             0            99             0          5          0          0          0          0          0          4          2  #  AgeSpline_Val_3_HKL_1
            -5             3     -0.814129             0            99             0          5          0          0          0          0          0          4          2  #  AgeSpline_Val_4_HKL_1
             1            25            10             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSel_1MaleDogleg_HKL
            -1             1             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSel_1MaleatZero_HKL
            -3             1      -1.26917             0            99             0          5          0          0          0          0          0          0          0  #  AgeSel_1MaleatDogleg_HKL
            -4             1      -1.09801             0            99             0          5          0          0          0          0          0          0          0  #  AgeSel_1MaleatMaxage_HKL
# 2   POT AgeSelex
            -2             2             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Code_POT_2
            -2             5    -0.0256871             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_GradLo_POT_2
            -5             2     -0.390806             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_GradHi_POT_2
             0            35             2             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_1_POT_2
             0            35             4             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_2_POT_2
             0            35             8             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_3_POT_2
             0            35            12             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_4_POT_2
            -5             3      -2.19554             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_Val_1_POT_2
            -5             3     -0.602696             0            99             0          5          0          0          0          0          0          4          2  #  AgeSpline_Val_2_POT_2
            -5             3             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Val_3_POT_2
            -5             3     0.0635753             0            99             0          5          0          0          0          0          0          4          2  #  AgeSpline_Val_4_POT_2
             1            25            10             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSel_2MaleDogleg_POT
            -1             1             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSel_2MaleatZero_POT
            -3             1      -1.23717             0            99             0          5          0          0          0          0          0          0          0  #  AgeSel_2MaleatDogleg_POT
            -4             1      -1.43776             0            99             0          5          0          0          0          0          0          0          0  #  AgeSel_2MaleatMaxage_POT
# 3   TWL AgeSelex
            -2             2             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Code_TWL_3
            -1             5            -1             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_GradLo_TWL_3
            -5             2     -0.183205             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_GradHi_TWL_3
             0            35             1             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_1_TWL_3
             0            35             2             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_2_TWL_3
             0            35             4             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_3_TWL_3
             0            35             8             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_4_TWL_3
             0            35            12             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Knot_5_TWL_3
            -5             3      0.853508             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_Val_1_TWL_3
            -5             3      0.728733             0            99             0          5          0          0          0          0          0          4          2  #  AgeSpline_Val_2_TWL_3
            -5             3             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSpline_Val_3_TWL_3
            -5             3      0.210905             0            99             0          5          0          0          0          0          0          4          2  #  AgeSpline_Val_4_TWL_3
            -5             3     -0.950131             0            99             0          5          0          0          0          0          0          0          0  #  AgeSpline_Val_5_TWL_3
             1            25             4             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSel_3MaleDogleg_TWL
            -1             1             0             0            99             0        -99          0          0          0          0          0          0          0  #  AgeSel_3MaleatZero_TWL
            -3             1    0.00470775             0            99             0          5          0          0          0          0          0          0          0  #  AgeSel_3MaleatDogleg_TWL
            -1             1     -0.139024             0            99             0          5          0          0          0          0          0          0          0  #  AgeSel_3MaleatMaxage_TWL
# 4   ENV AgeSelex
             0             5             0             3            99             0        -99          0          0          0          0          0          0          0  #  minage@sel=1_ENV(4)
             1            60            50             3            99             0        -99          0          0          0          0          0          0          0  #  maxage@sel=1_ENV(4)
# 5   AKSHLF AgeSelex
             1            12           1.5             1            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_peak_AKSHLF(5)
            -5             5            -4           0.3            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_top_logit_AKSHLF(5)
         0.001            10           0.5             5            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_ascend_se_AKSHLF(5)
         0.001            10       1.80155             4            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_descend_se_AKSHLF(5)
            -5             5      -2.84122            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_start_logit_AKSHLF(5)
            -5             5         -4.99            -5            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_end_logit_AKSHLF(5)
# 6   AKSLP AgeSelex
             1            12       2.47448             1            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_peak_AKSLP(6)
            -5             5            -4           0.3            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_top_logit_AKSLP(6)
         0.001            10           0.1             5            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_ascend_se_AKSLP(6)
         0.001            10      0.924459             4            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_descend_se_AKSLP(6)
            -5             5      -1.61349            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_start_logit_AKSLP(6)
            -5             5     -0.900192            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_end_logit_AKSLP(6)
# 7   NWSLP AgeSelex
             1            12             3             1            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_peak_NWSLP(7)
            -5             5            -4           0.3            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_top_logit_NWSLP(7)
         0.001            10       1.19262             5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_ascend_se_NWSLP(7)
         0.001            10      0.857718             4            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_descend_se_NWSLP(7)
            -5             5      -3.74973            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_start_logit_NWSLP(7)
            -5             5    -0.0760728            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_end_logit_NWSLP(7)
# 8   NWCBO AgeSelex
           0.1             5           1.5             1            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_peak_NWCBO(8)
            -5             5            -4           0.3            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_top_logit_NWCBO(8)
         0.001             5           0.5             5            99             0         -4          0          0          0          0          0          0          0  #  Age_DblN_ascend_se_NWCBO(8)
         0.001            10       2.99422             4            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_descend_se_NWCBO(8)
            -5             5     -0.732126            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_start_logit_NWCBO(8)
            -5             5     -0.832841            -5            99             0          4          0          0          0          0          0          0          0  #  Age_DblN_end_logit_NWCBO(8)
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            25            45            25            30            99             0      -99  # Retain_L_infl_HKL(1)_BLK3repl_1970
           0.7             1             1             1            99             0      -99  # Retain_L_asymptote_logit_HKL(1)_BLK1repl_1970
            25            45            25            30            99             0      -99  # Retain_L_infl_POT(2)_BLK3repl_1970
           0.7             1             1             1            99             0      -99  # Retain_L_asymptote_logit_POT(2)_BLK1repl_1970
            25            45            25            30            99             0      -99  # Retain_L_infl_TWL(3)_BLK3repl_1970
           0.7             1             1             1            99             0      6  # Retain_L_asymptote_logit_TWL(3)_BLK2repl_1982
            -5             3     -0.776336             0            99             0      5  # AgeSpline_Val_3_HKL_1_BLK4repl_1970
            -5             3     -0.913952             0            99             0      5  # AgeSpline_Val_4_HKL_1_BLK4repl_1970
            -5             3     -0.447535             0            99             0      5  # AgeSpline_Val_2_POT_2_BLK4repl_1970
            -5             3     -0.239366             0            99             0      5  # AgeSpline_Val_4_POT_2_BLK4repl_1970
            -5             3      0.676126             0            99             0      5  # AgeSpline_Val_2_TWL_3_BLK4repl_1970
            -5             3     -0.242855             0            99             0      5  # AgeSpline_Val_4_TWL_3_BLK4repl_1970
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      3     2     1     0     0     0     0     1     1  1980  2004    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     3     3     2     0     0     0     0     0     0     0
#      5     3     4     1     2     0     0     0     0     0     0     0
#      5     9     5     3     2     0     0     0     0     0     0     0
#      5    11     6     1     2     0     0     0     0     0     0     0
#      5    17     7     3     2     0     0     0     0     0     0     0
#      5    19     8     2     2     0     0     0     0     0     0     0
#      5    34     9     4     2     0     0     0     0     0     0     0
#      5    35    10     4     2     0     0     0     0     0     0     0
#      5    48    11     4     2     0     0     0     0     0     0     0
#      5    50    12     4     2     0     0     0     0     0     0     0
#      5    64    13     4     2     0     0     0     0     0     0     0
#      5    66    14     4     2     0     0     0     0     0     0     0
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
      2      1     0.015
      3      1     0.206
      4      1    0.1459
      5      1    0.8444
      2      2     0.024
      3      2     0.087
      4      2    1.0423
      5      2     2.116
      2      3     0.097
      4      3    0.2461
      5      3     1.675
      4      5    0.1843
      5      5    0.2735
      4      6    1.2635
      5      6    0.0041
      4      7     0.557
      5      7    0.2011
      4      8     0.742
      5      8    0.2366
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 1 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 4 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_discard:_1
#  1 #_discard:_2
#  1 #_discard:_3
#  0 #_discard:_4
#  0 #_discard:_5
#  0 #_discard:_6
#  0 #_discard:_7
#  0 #_discard:_8
#  1 #_meanbodywt:1
#  1 #_meanbodywt:2
#  1 #_meanbodywt:3
#  1 #_meanbodywt:4
#  1 #_meanbodywt:5
#  1 #_meanbodywt:6
#  1 #_meanbodywt:7
#  1 #_meanbodywt:8
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  0 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  0 #_agecomp:_4
#  1 #_agecomp:_5
#  1 #_agecomp:_6
#  1 #_agecomp:_7
#  1 #_agecomp:_8
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_init_equ_catch7
#  1 #_init_equ_catch8
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

