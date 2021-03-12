# 2017 Blue/Deacon Rockfish Assessment for Oregon waters
# A.M. Berger, NMFS/NWFSC, aaron.berger@noaa.gov
# Stock Synthesis V3.30.03.07

0 # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
#
2 # recr_dist_method for parameters:  1=like 3.24; 2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # Recruitment: 1=global; 2=by area (future option)
1 #  number of recruitment settlement assignments
0 # year_x_area_x_settlement_event interaction requested (only for recr_dist_method=1)
#GP month area age
  1     7    1   0 # settlement month set to July (close approximation, 7cm lowest pop'n size bin matches this)
#
3 #_Nblock_Patterns  #may want to think about adding another block at 2014/2015 due to bag limit going to 3 in rec fishery and blue only bag limit in commercial fishery
2 1 1 #_blocks_per_pattern
# BLOCK 1: 2001, and 2015 bag limit changes (recreational)
1899 2000
1971 2014
# BLOCK 2: 2001 change only (recreational bage limit drops from 25 to 7-10 post 2001
1899 2000
# BLOCK 3: 2014 change only (commercial)
1899 2014
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
0 0 0 0 0 # autogen
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
0    #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
1    # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1    #_Growth_Age_for_L1
30   #_Growth_Age_for_L2 (999 to use as Linf)
0.16 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0    #_placeholder for future growth feature
0    #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1    #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1    #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2    #_First_Mature_Age
2    #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0    #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2    #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
###########
# FEMALES #
###########
#     LO        HI      INIT     PRIOR  PR_SD  PR_type  PHASE env_var dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# natural mortality
   0.001       0.4     0.1588  -1.8399   0.438       3     -2       0        0         0         0      0     0         0 # NatM_p_1_Fem_GP_1
# length-at-age
      10        30        16        16   1000        0      2       0        0         0         0      0     0         0 # L_at_Amin_Fem_GP_1
      25        45        38        38   1000        0      2       0        0         0         0      0     0         0 # L_at_Amax_Fem_GP_1
    0.01       0.3      0.21       0.21  1000        0      2       0        0         0         0      0     0         0 # VonBert_K_Fem_GP_1
    0.01       0.5       0.1       0.1   1000        0      2       0        0         0         0      0     0         0 # CV_young_Fem_GP_1
    0.01       0.5       0.1       0.1   1000        0      2       0        0         0         0      0     0         0 # CV_old_Fem_GP_1
# weight-length
2.67e-005 2.67e-005 2.67e-005 2.67e-005  1000        0     -2       0        0         0         0      0     0         0 # Wtlen_1_Fem
       1         3      2.90      2.90   1000        0     -2       0        0         0         0      0     0         0 # Wtlen_2_Fem
# maturity ogive
      22        32      28.8      28.8   1000        0     -2       0        0         0         0      0     0         0 # Mat50%_Fem
    -1.2      -0.98     -0.98     -0.6   1000        0     -2       0        0         0         0      0     0         0 # Mat_slope_Fem
# fecundity F=aL^b; 'a' has been scaled so spawning output has units of millions of eggs
       0         1 1.143e-08 1.143e-08   1000        0     -2       0        0         0         0      0     0         0 # 'a' in F=a*L^b
       2         5     4.816     4.816   1000        0     -2       0        0         0         0      0     0         0 # 'b' in F=a*L^b
#########
# MALES # -- M and vB parameters are exponential offsets; parm = ln(M/F); M = F*exp(parm)
#########
#     LO        HI      INIT     PRIOR  PR_SD  PR_type  PHASE env_var dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# natural mortality
      -3         3     0.1590   -0.0900  1000        0     -2       0        0         0         0      0     0         0 # NatM_p_1_Mal_GP_1
# length-at-age
      -3         3         0    -0.134   1000        0     -2       0        0         0         0      0     0         0 # L_at_Amin_Mal_GP_1
      -3         3     -0.236   -0.236   1000        0      2       0        0         0         0      0     0         0 # L_at_Amax_Mal_GP_1
      -3         3      0.644    0.644   1000        0      2       0        0         0         0      0     0         0 # VonBert_K_Mal_GP_1
      -3         3         0         0   1000        0     -2       0        0         0         0      0     0         0 # CV_young_Mal_GP_1
      -3         3      0.80         0   1000        0     -2       0        0         0         0      0     0         0 # CV_old_Mal_GP_1
# weight-length
2.67e-005 2.67e-005 2.67e-005 2.67e-005  1000        0     -2       0        0         0         0      0     0         0 # Wtlen_1_Mal
       1         3      2.90      2.90   1000        0     -2       0        0         0         0      0     0         0 # Wtlen_2_Mal
### recruitment apportionment
       0         0         0         0      0        0     -1       0        0         0         0      0     0         0 # RecrDist_GP_1
       0         0         0         0      0        0     -1       0        0         0         0      0     0         0 # RecrDist_Area_1
       0         0         0         0      0        0     -1       0        0         0         0      0     0         0 # RecrDist_Bseas_1
# cohort growth deviation
       1         1         1         1   1000        0     -1       0        0         0         0      0     0         0 # CohortGrowDev
# fraction female 
   0.001     0.999       0.5       0.5   1000        0     -1       0        0         0         0      0     0         0 # FracFemale_GP_1
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#
#_Spawner-Recruitment
3  #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#   LO    HI     INIT  PRIOR  PR_SD  PR_type  PHASE  env-var  use_dev  dev_mnyr  dev_mxyr  dev_PH  Block  Blk_Fxn #  parm_name
     5    12        9     10     10        0      1        0        0         0         0       0      0        0 # SR_LN(R0)
 0.201 0.999      0.718  0.718 0.158       2     -2        0        0         0         0       0      0        0 # SR_std_B-H
   0.1     1      0.50   0.5   1000        0     -1        0        0         0         0       0      0        0 # SR_sigmaR
    -5     5        0      0   1000        0     -1        0        0         0         0       0      0        0 # SR_regime
     0   0.5        0      0   1000        0     -1        0        0         0         0       0      0        0 # SR_autocorr
#
1    #do_recdev:  0=none; 1=devvector; 2=simple deviations
1980 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
3    #_recdev phase
1    # (0/1) to read 13 advanced options
 1970      #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4         #_recdev_early_phase
 -1        #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1         #_lambda for Fcast_recr_like occurring before endyr+1
 1984      #_last_early_yr_nobias_adj_in_MPD                   
 2001      #_first_yr_fullbias_adj_in_MPD                      
 2010      #_last_yr_fullbias_adj_in_MPD                       
 2029      #_first_recent_yr_nobias_adj_in_MPD                 
 0.80      #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
 0         #_period of cycles in recruitment (N parms read below)
-5         #_min rec_dev
 5         #_max rec_dev
 0         #_read_recdevs
#_end of advanced SR options
#
#Fishing Mortality info 
0.5 # F ballpark
-2002 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
4 # Number of tuning iterations in hybrid F method
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
#_Q_setup
# 1. Fleet
# 2. Link type: 1 = simple Q (proportional); 2 = mirror simple Q; 3 = Q with power, 2 parameters
# 3. Extra input for link (i.e. mirror fleet); >0 = mirror the Q from another (lower numbered survey designated by abs(value))
# 4. Do extra SD; 0 = skip (typical); 1 = estimate constant to be added to the input stddev of survey
# 5. Bias adjustment; 0 = no bias adjustment applied, 1 = apply bias adjustment
# 6. Q float; 0 = no float (parameter is estimated); 1 = float (analytical solution, parameter line still required)
#_   fleet  link link_info  extra_se  biasadj  float  #  fleetname
         6     1         0         1        0      1  #  Commercial Logbook INDEX
         7     1         0         1        0      1  #  Rec Onboard Observer INDEX
         8     1         0         1        0      1  #  Rec Dockside ORBS INDEX
         9     1         0         1        0      1  #  Rec Dockside MRFSS INDEX
 -9999 0 0 0 0 0
#
#_Q_parms(if_any); Qunits_are_ln(q)
# Q PARAMETER LINES ARE REQUIRED, EVEN WHEN USING ANALYTICAL SOLUTION
# extra_se parameter lines only needed when activated (extra_se = 1) above
# LO   HI      INIT  PRIOR  PR_SD  PR_type  PHASE  env-var  use_dev  dev_mnyr  dev_mxyr  dev_PH  Block  Blk_Fxn  #  parm_name
 -15   15        -9      0      1        0     -1        0        0         0         0       0      0        0  #  LnQ_base_Commercial Logbook INDEX
  0  0.75      0.05   0.05      1        0      2        0        0         0         0       0      0        0  #  extra_se_Commercial Logbook INDEX
 -15   15        -9      0      1        0     -1        0        0         0         0       0      0        0  #  LnQ_base_Rec Onboard Observer INDEX
  0  0.75      0.05   0.05      1        0      2        0        0         0         0       0      0        0  #  extra_se_Rec Onboard Observer INDEX
 -15   15        -9      0      1        0     -1        0        0         0         0       0      0        0  #  LnQ_base_Rec Dockside ORBS INDEX
  0  0.75      0.05   0.05      1        0      2        0        0         0         0       0      0        0  #  extra_se_Rec Dockside ORBS INDEX
 -15   15        -9      0      1        0     -1        0        0         0         0       0      0        0  #  LnQ_base_Rec Dockside MRFSS INDEX
  0  0.75      0.05   0.05      1        0      2        0        0         0         0       0      0        0  #  extra_se_Rec Dockside MRFSS INDEX
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
       24       0    0       0 # 1 Commercial fleet (landings only)
       24       0    0       0 # 2 Commercial fleet (discards only)
       24       0    0       0 # 3 Recreational ocean boat fleet (landings only)
       24       0    0       0 # 4 Recreational ocean boat fleet (discards only)
       24       0    0       0 # 5 Recreational Shore fleet (estuary and shore boats, landings only)
        5       0    0       1 # 6 Commercial logbook survey CPUE index
        5       0    0       3 # 7 Recreational onboard observer survey CPUE index
        5       0    0       3 # 8 Recreational ORBS dockside survey CPUE index
        5       0    0       3 # 9 Recreational MRFSS dockside survey CPUE index
        0       0    0       0 # 10 Research survey to get small age/length for helping to determine growth
#
#_age_selex_types
#_Pattern Discard Male Special
       10       0    0       0 # 1 Commercial fleet (landings only)
       10       0    0       0 # 2 Commercial fleet (discards only)
       10       0    0       0 # 3 Recreational ocean boat fleet (landings only)
       10       0    0       0 # 4 Recreational ocean boat fleet (discards only)
       10       0    0       0 # 5 Recreational Shore fleet (estuary and shore boats, landings only)
       10       0    0       0 # 6 Commercial logbook survey CPUE index
       10       0    0       0 # 7 Recreational onboard observer survey CPUE index
       10       0    0       0 # 8 Recreational ORBS dockside survey CPUE index
       10       0    0       0 # 9 Recreational MRFSS dockside survey CPUE index
       11       0    0       0 # 10 Research survey to get small age/length for helping to determine growth
#
###
# LO  HI      INIT  PRIOR  PR_SD  PR_type  PHASE  env-var  use_dev  dev_mnyr  dev_mxyr  dev_PH  Block  Blk_Fxn  #  parm_name
  20  50        35     35    0.5        0      4        0        0         0         0       0      3        2  #  SizeSel_PEAK_Com_Land (1)
 -12   0        -9     -9    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_TOP_Com_Land (1)
   1  10         4      4    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_Com_Land (1)
   1  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_Com_Land (1)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_INIT_Com_Land (1)
 -11  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_COM_Com_Land (1)

# REVISIT MALE SELECTIVITY LATER
 # -20  20        0      0    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_PEAK_Com_Land Male offset (1)
 # -20  20        0      0    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_Com_Land Male offset (1)
 # -20  20        -5     0    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_Com_Land Male offset (1)
 # -20  20        -20    0    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_COM_Com_Land Male offset (1)
 # -20  20        1      0    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel Apical_Com_Land Male offset (1) 

  14  45        25     25    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_PEAK_Com_Disc (2)
 -12   0       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_TOP_Com_Disc (2)
   1  10       3.5    3.5    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_Com_Disc (2)
   1  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_Com_Disc (2)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_INIT_Com_Disc (2)
 -11  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_Com_Disc (2)

# No gender specific data for commercial discards

  20  50        30     30    0.5        0      4        0        0         0         0       0      3        2  #  SizeSel_PEAK_REC_Ocean_Land (3)
 -12   0        -9     -9    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_TOP_REC_Ocean_Land (3)
   1  10         4      4    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_REC_Ocean_Land (3)
   1  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_REC_Ocean_Land (3)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_INIT_REC_Ocean_Land (3)
 -11  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_COM_REC_Ocean_Land (3)

# REVISIT MALE SELECTIVITY LATER
 # -20  20        0      0    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_PEAK_REC_Ocean_Land Male offset (3)
 # -20  20        0      0    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_REC_Ocean_Land Male offset (3)
 # -20  20        -5     0    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_REC_Ocean_Land Male offset (3)
 # -20  20        -20    0    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_REC_Ocean_Land Male offset (3)
 # -20  20        1      0    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel Apical_REC_Ocean_Land Male offset (3)

  14  30        26     26    0.5        0      4        0        0         0         0       0      3        2  #  SizeSel_PEAK_REC_Ocean_Disc (4)
 -12   0       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_TOP_REC_Ocean_Disc (4)
   1  10       3.5    3.5    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_REC_Ocean_Disc (4)
   1  10       3.5    3.5    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_REC_Ocean_Disc (4)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_INIT_REC_Ocean_Disc (4)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_REC_Ocean_Disc (4)

# No gender specific data for recreational discards

  10  40        24     24    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_PEAK_REC_Shore_Land (5)
 -12   0        -9     -9    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_TOP_REC_Shore_Land (5)
   1  10        3.5   3.5    0.5        0      4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_REC_Shore_Land (5)
   1  10       5.96   3.5    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_REC_Shore_Land (5)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_INIT_REC_Shore_Land (5)
 -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_COM_REC_Shore_Land (5)

# REVISIT MALE SELECTIVITY LATER
#   1  60        24     20     10        0     -4        0        0         0         0       0      0        0  #  SzSel_MaleDogleg_REC_Shore_Land (5)
# -10  10         0      0     10        0     -4        0        0         0         0       0      0        0  #  SzSel_MaleatZero_REC_Shore_Land (5)
# -10  10         0      0     10        0     -4        0        0         0         0       0      0        0  #  SzSel_MaleatDogleg_REC_Shore_Land (5)
# -10   0     -0.33      2     10        0     -4        0        0         0         0       0      0        0  #  SzSel_MaleatMaxage_REC_Shore_Land (5)

  -2   0        -1      1    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P1_Com_Logbook_Index (6)
  -2   0        -1     52    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P2_Com_Logbook_Index (6)

  -2   0        -1      1    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P1_Rec_Onboard_Index (7)
  -2   0        -1     52    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P2_Rec_Onboard_Index (7)

  -2   0        -1      1    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P1_Rec_ORBS_Index (8)
  -2   0        -1     52    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P2_Rec_ORBS_Index (8)

  -2   0        -1      1    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P1_Rec_MRFSS_Index (9)
  -2   0        -1     52    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_P2_Rec_MRFSS_Index (9)

#  10  30        20     14    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_PEAK_Research_Survey (5)
# -12   0        -9     -9    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_TOP_Research_Survey (5)
#   1  10        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_ASC-WIDTH_Research_Survey (5)
#   1  10         7      5    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_DSC-WIDTH_Research_Survey (5)
# -11  -9        10     10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_INIT_Research_Survey (5)
# -11  -9       -10    -10    0.5        0     -4        0        0         0         0       0      0        0  #  SizeSel_FINAL_COM_Research_Survey (5)
 
 ### AGE SELEX PARAMETERS ###
# LO  HI      INIT  PRIOR  PR_SD  PR_type  PHASE  env-var  use_dev  dev_mnyr  dev_mxyr  dev_PH  Block  Blk_Fxn  #  parm_name (UPDATE NAMES)
   0   1         1      0     10        0     -4        0        0         0         0       0      0        0  #  AgeSel_P1_ODFW_Research (10)
   9   40       35      0     10        0     -4        0        0         0         0       0      0        0  #  AgeSel_P2_ODFW_Research (10)
#
0  #_ 0/1 to request experimental 2D_AR selectivity smoother options.
0  # TG_custom:  0=no read; 1=read if tags exist
#
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
###
### WEIGHTS FOR LENGTH COMPS BASED ON FRANCIS METHOD
### CAAL WEIGHTS BASED ON HARMONIC MEAN
###
#_Factor  Fleet  Value
 4        1     0.503  #Commercial landings length comp
 4        2     0.101  #Commercial discards length comp
 4        3     0.077  #Rec Ocean boat landings length comp
 4        4     1.045  #Rec Ocean boat discards length comp
 4        5     0.393  #Rec Shore landings length comp
 4        6      1     #Com Logbook
 4        7      1     #Onboard Observer
 4        8      1     #ORBS
 4        9      1     #MRFSS
 4       10      1     #ODFW Research
 5        1     0.136  #Commercial age comp (harmonic mean)
 5        3     0.108  #Rec Ocean boat age comp (harmonic mean)
 5       10     0.250  #ODFW Reserach age comp (harmonic mean)
 -9999    1      0     # terminator
#
1 #_maxlambdaphase
1 #_sd_offset
#
#### LAMBDAS (LIKELIHOOD MULTIPLIERS)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age;
#                   6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 10=recrdev;
#                   11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp;
#                   16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
    1  6  1  1  1  #Logbook
    1  7  1  1  1  #Onboard
    1  8  1  1  1  #ORBS
    1  9  1  1  1  #MRFSS
    4  1  1  1  1  #lencomp Commercial landings
    4  2  1  1  1  #lencomp Commercial discards
    4  3  1  1  1  #lencomp Rec Ocean landings
    4  4  1  1  1  #lencomp Rec Ocean discards
    4  5  1  1  1  #lencomp Rec Shore landings
    5  1  1  1  1  #ageomp Commercial landings
    5  3  1  1  1  #ageomp Rec Ocean landings
    5 10  1  1  1  #ageomp Research samples
-9999  1  1  1  1  #  terminator
#
0 # (0/1) read specs for more stddev reporting 
# 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
# placeholder for vector of selex bins to be reported
# placeholder for vector of growth ages to be reported
# placeholder for vector of NatAges ages to be reported
999
