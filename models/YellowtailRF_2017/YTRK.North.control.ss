#_First-pass-YTRK-control-file
#_Watch-out-for-TOADS
#
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  1=like 3.24; 2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # Recruitment: 1=global; 2=by area (future option)
1 #  number of recruitment settlement assignments
0 # year_x_area_x_settlement_event interaction requested (only for recr_dist_method=1)
#
#GPat month  area age (for each settlement assignment)
#
 1 1 1 0 
#
#
3  #_Nblock_Patterns
#
10 1 1 #_blocks_per_pattern
# begin and end years of blocks
2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2016
#2002 2010 2011 2016
2002 2016
2003 2016
#
#
# controls for all timevary parameters
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
1 1 1 1 1 # autogen
#
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
## 1st element for biology, 2nd for SR, 3rd for Q, 5th for selex, 4th reserved
#
## setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
#
# Changed to age 0 because males were trying to shrink from age-0 to age-1
2 #_Growth_Age_for_L1
25 #_Growth_Age_for_L2 (999 to use as Linf)
#
#
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
#
#
#
0 #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
5 #_First mature age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env-var use_dev dev_mnyr dev_mxyr dev_PH Block  Blk_Fxn # parm_name
# female parameters
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env_var&link    dev_link        dev_minyr       dev_maxyr       dev_PH  Block   Block_Fxn               
0.02    0.25    0.145109        -2.12   0.438   3       2       0       0       0       0       0       0       0       #       NatM_p_1_Fem_GP_1
1       25      15.0337 22      99      0       3       0       0       0       0       0       0       0       #       L_at_Amin_Fem_GP_1
35      70      53.8936 55      99      0       2       0       0       0       0       0       0       0       #       L_at_Amax_Fem_GP_1
0.1     0.4     0.13556 0.1     99      0       3       0       0       0       0       0       0       0       #       VonBert_K_Fem_GP_1
0.03    0.16    0.09890 0.1     99      0       5       0       0       0       0       0       0       0       #       CV_young_Fem_GP_1
0.03    0.16    0.04357 0.1     99      0       5       0       0       0       0       0       0       0       #       CV_old_Fem_GP_1
0       3    1.1843E-05 99      99      0       -50     0       0       0       0       0       0       0       #       Wtlen_1_Fem
2       4       3.0672  99      99      0       -50     0       0       0       0       0       0       0       #       Wtlen_2_Fem
30      56      42.49   42.49   99      0       -50     0       0       0       0       0       0       0       #       Mat50%_Fem
-2      1     -0.40078 -0.40078 99      0       -50     0       0       0       0       0       0       0       #       Mat_slope_Fem
0       6    1.1185E-11 99      99      0       -50     0       0       0       0       0       0       0       #       Eggs_scalar_Fem
2       7       4.59    4.59    99      0       -50     0       0       0       0       0       0       0       #       Eggs_exp_len_Fem
# male parameters (offset from female)
-3      3       -0.1386 0       99      0       2       0       0       0       0       0       0       0       #       NatM_p_1_Mal_GP_1
-1      1       0       0       99      0       -2      0       0       0       0       0       0       0       #       L_at_Amin_Mal_GP_1
-1      1       -0.1490 0       99      0       2       0       0       0       0       0       0       0       #       L_at_Amax_Mal_GP_1
-1      1       0.37790 0       99      0       3       0       0       0       0       0       0       0       #       VonBert_K_Mal_GP_1
-1      1       0       0       99      0       -5      0       0       0       0       0       0       0       #       CV_young_Mal_GP_1
-1      1       0.16921 0       99      0       5       0       0       0       0       0       0       0       #       CV_old_Mal_GP_1
0       3    1.1843E-05 99      99      0       -50     0       0       0       0       0       0       0       #       Wtlen_1_Mal
2       4       3.0672  99      99      0       -50     0       0       0       0       0       0       0       #       Wtlen_2_Mal
# recruit distribution parameters
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_GP_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_Area_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_Bseas_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       CohortGrowDev
0.001   0.999   0.5     0.5     0.5     0       -99     0       0       0       0       0       0       0       #       FracFemale_GP_1
#
#
#_no timevary MG parameters

#
#_seasonal_effects_on_biology_parms
#
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env-var use_dev dev_mnyr dev_mxyr dev_PH Block  Blk_Fxn # parm_name
5       20      12      10      5       0       1       0       0       0       0       0       0       0       # SR_LN(R0)
### if fixing steepness, use line below
0.2     1       0.718   0.718   0.158   0       -6      0       0       0       0       0       0       0       # SR_BH_steep
### if estimating steepness, use line below with Type-C prior for Yellowtail
#0.2     1       0.4     0.715   0.160   0       6       0       0       0       0       0       0       0       # SR_BH_steep
0.5     1.2     0.4997   0.67     99      0       -6      0       0       0       0       0       0       0       # SR_sigmaR
-5      5       0       0       99      0       -50     0       0       0       0       0       0       0       # SR_regime
0       2       0       1       99      0       -50     0       0       0       0       0       0       0       # SR_autocorr
#
#
#
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1962 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase
1 # (0/1) to read 13 advanced options
#
1932 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
5 #_recdev_early_phase
5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#
1 #_lambda for Fcast_recr_like occurring before endyr+1
1945.4   #_last_early_yr_nobias_adj_in_MPD 
1976.7   #_first_yr_fullbias_adj_in_MPD 
2010.5   #_last_yr_fullbias_adj_in_MPD 
2013.0   #_first_recent_yr_nobias_adj_in_MPD 
0.8154   #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)   
0 #_period of cycles in recruitment (N parms read below)
-6 #min rec_dev
6 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
#
#Fishing Mortality info
0.3 # F ballpark
1984 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.95 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_Q_setup
#_fleet link link_info extra_se biasadj float   #       fleetname
1       1       0       0       0       1       #       CommercialTrawl
2       1       0       0       0       1       #       HakeByCatch
# no fleets 3 or 4 because no index (yet)
5       1       0       1       0       1       #       Triennial
6       1       0       1       0       1       #       NWFSCcombo
-9999   0       0       0       0       0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env-var use_dev dev_mnyr dev_mxyr dev_PH Block  Blk_Fxn # parm_name
-30     15      -15     0       1       0       -1      0       0       0       0       0       0       0       # LnQ_base_1
#0       0.5     0.01    0       1       0        1      0       0       0       0       0       0       0       # Extra_SD_logbook
-30     15      -15     0       1       0       -1      0       0       0       0       0       0       0       # LnQ_base_2
#0       0.5     0.01    0       1       0        1      0       0       0       0       0       0       0       # Extra_SD_hake_bycatch
-30     15      -15     0       1       0       -1      0       0       0       0       0       0       0       # LnQ_base_4
0       0.5     0.01    0       1       0        1      0       0       0       0       0       0       0       # Extra_SD_triennial
-30     15      -15     0       1       0       -1      0       0       0       0       0       0       0       # LnQ_base_5
0       0.5     0.01    0       1       0        1      0       0       0       0       0       0       0       # Extra_SD_NWFSCcombo
#_no    timevary        Q       parameters
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#Pattern Discard Male   Special
24      1       0       0       #       1       CommercialTrawl
24      0       0       0       #       2       HakeByCatch
24      0       0       0       #       3       Rec
24      0       0       0       #       4       Triennial
24      0       0       0       #       5       NWFSCcombo
24      0       0       0       #       6       WA_Sport
#
#_age_selex_types
#Pattern Discard Male   Special
10      0       0       0       #       1       CommercialTrawl
10      0       0       0       #       2       HakeByCatch
10      0       0       0       #       3       Rec
10      0       0       0       #       4       Triennial
10      0       0       0       #       5       NWFSCcombo
10      0       0       0       #       6       WA_Sport
#
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env-var use_dev dev_mnyr        dev_mxyr        dev_PH  Block   Blk_Fxn #       parm_name
#CommercialTrawl selectivity
20      55      48.6485 0       99      0       1       0       0       0       0       0       0       0       #       SizeSel_P1_CommercialTrawl(1)
-20     70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P2_CommercialTrawl(1)
-5      20      4.27222 0       99      0       3       0       0       0       0       0       0       0       #       SizeSel_P3_CommercialTrawl(1)
-5      70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P4_CommercialTrawl(1)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P5_CommercialTrawl(1)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P6_CommercialTrawl(1)
#CommercialTrawl retention
20      55      24.5115 27      99      0       3       0       0       0       0       0       0       0       #       Retain_P1_CommercialTrawl(1)
0.1     40      1.59935 15      99      0       3       0       0       0       0       0       0       0       #       Retain_P2_CommercialTrawl(1)
-10     20      3.06533 3       99      0       3       0       0       0       0       0       1       2       #       Retain_P3_CommercialTrawl(1)
-3      3       0       0       3       0       -4      0       0       0       0       0       0       0       #       Retain_P4_CommercialTrawl(1)
#HakeByCatch
20      55      52.2551 0       99      0       1       0       0       0       0       0       0       0       #       SizeSel_P1_HakeByCatch(2)
-20     70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P2_HakeByCatch(2)
-5      20      4.2846  0       99      0       3       0       0       0       0       0       0       0       #       SizeSel_P3_HakeByCatch(2)
-5      70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P4_HakeByCatch(2)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P5_HakeByCatch(2)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P6_HakeByCatch(2)
#RecORandCA
20      55      30.811  0       99      0       6       0       0       0       0       0       3       2       #       SizeSel_P1_RecORandCA(3)
-20     70      -20     0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P2_RecORandCA(3)
-5      20      3.173   0       99      0       6       0       0       0       0       0       3       2       #       SizeSel_P3_RecORandCA(3)
-5      20      20      0       99      0       -4      0       0       0       0       0       3       2       #       SizeSel_P4_RecORandCA(3)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P5_RecORandCA(3)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P6_RecORandCA(3)
#RecWA (initial values from previously estimated run)
20      55      55      0       99      0       -6      0       0       0       0       0       3       2       #       SizeSel_P1_RecWA(4)
-20     70      -20     0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P2_RecWA(4)
-5      20      5.365   0       99      0       6       0       0       0       0       0       3       2       #       SizeSel_P3_RecWA(4)
-5      70      20      0       99      0       -4      0       0       0       0       0       3       2       #       SizeSel_P4_RecWA(4)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P5_RecWA(4)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P6_RecWA(4)
#Triennial
20      55      55.0    0       99      0       -1      0       0       0       0       0       0       0       #       SizeSel_P1_Triennial(5)
-20     70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P2_Triennial(5)
-5      20      5.11635 0       99      0       3       0       0       0       0       0       0       0       #       SizeSel_P3_Triennial(5)
-5      70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P4_Triennial(5)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P5_Triennial(5)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P6_Triennial(5)
#NWFSCcombo
20      55      49.7058 0       99      0       1       0       0       0       0       0       0       0       #       SizeSel_P1_NWFSCcombo(6)
-20     70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P2_NWFSCcombo(6)
-5      20      4.53247 0       99      0       3       0       0       0       0       0       0       0       #       SizeSel_P3_NWFSCcombo(6)
-5      70      70      0       99      0       -4      0       0       0       0       0       0       0       #       SizeSel_P4_NWFSCcombo(6)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P5_NWFSCcombo(6)
-999    25      -999    0       99      0       -99     0       0       0       0       0       0       0       #       SizeSel_P6_NWFSCcombo(6)
#
#_no timevary selex parameters (initial values from previously estimated run)
#
#20      55      35      0       99      0       3              #       SizeSel_P1
# timevary selex parameters
# (copied from control.ss_new to get initial values to speed optimiztation)
#LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
-10            20       2.22742             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2002
-10            20       3.70725             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2003
-10            20       1.12665             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2004
-10            20     -0.119847             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2005
-10            20       1.76073             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2006
-10            20       -0.5268             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2007
-10            20       2.39693             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2008
-10            20      0.475635             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2009
-10            20      0.138629             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2010
-10            20       7.37535             3            99             0      6  # Retain_P3_CommercialTrawl(1)_BLK1repl_2011
#
#LO     HI      INIT    PRIOR   PR_SD  PR_type  PHASE   # parm_name
#RecORandCA blocks
20      55      31.22   0       99      0       6       # SizeSel_P1_RecORandCA(3)
-5      20      2.904   0       99      0       6       # SizeSel_P3_RecORandCA(3)
-5      20      4.248   0       99      0       6       # SizeSel_P4_RecORandCA(3)
#RecWA blocks
20      55      33.46   0       99      0       6       # SizeSel_P1_RecWA(4)
-5      20      2.726   0       99      0       6       # SizeSel_P3_RecWA(4)
-5      70      8.841   0       99      0       6       # SizeSel_P4_RecWA(4)

#
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#
#
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors:
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
  #Factor Fleet New_Var_adj hash Old_Var_adj New_Francis   New_MI Francis_mult Francis_lo Francis_hi  MI_mult Type            Name Note
        4     1    0.034445    #    0.034646    0.034445 0.032181     0.994208   0.757131   1.475207 0.928847  len CommercialTrawl     
        4     2    0.111832    #    0.113822    0.111832 0.080316     0.982515   0.649763   1.825709 0.705631  len     HakeByCatch     
        4     3    0.105365    #    0.093773    0.105365 0.061105     1.123614   0.723761   2.276493 0.651628  len      RecORandCA     
        4     4    0.032220    #    0.028657    0.032220 0.038488     1.124346   0.636596   3.387543 1.343044  len           RecWA     
        4     5    0.037147    #    0.037539    0.037147 0.271632     0.989553   0.538021   5.476215 7.236003  len       Triennial     
        4     6    0.027307    #    0.028395    0.027307 0.224192     0.961685   0.561170   4.168205 7.895461  len      NWFSCcombo     
        5     1    0.128648    #    0.126374    0.128648 0.432362     1.017995   0.679252   1.736141 3.421285  age CommercialTrawl     
        5     4    0.021984    #    0.024747    0.021984 0.033729     0.888341   0.486756   9.799211 1.362970  age           RecWA     
        5     5    0.094145    #    0.092872    0.094145 0.850602     1.013712   0.594811   3.292327 9.158869  age       Triennial     
        5     6    0.320667    #    0.310368    0.320667 0.222916     1.033183   0.718329   2.399408 0.718230  age      NWFSCcombo     
-9999     1 0.00000000
#
5 #_maxlambdaphase
1 #_sd_offset
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch;
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
1      1  1  0  0 # turn off commercial fishery logbook CPUE index from phase 1
1      2  1  0  0 # turn off hake CPUE index from phase 1
17     1  5  0  0 # turn off ballpark likelihood in phase 5
-9999  1  1  1  1  #  terminator
#
0 # (0/1) read specs for more stddev reporting
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported

999
