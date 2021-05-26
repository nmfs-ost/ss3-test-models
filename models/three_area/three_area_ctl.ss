#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: three_area_dat.ss // three_area_ctl.ss
#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
4 #_N_movement_definitions
0 # first age that moves (real age at begin of season, not integer)
# seas,GP,source_area,dest_area,minage,maxage
 1 1 1 1 1 10
 1 1 1 2 1 10
 1 1 2 2 5 20
 1 1 2 3 5 20
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1944 1944
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
2 #_N_breakpoints
 4 15 # age(real) at M breakpoints
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1.66 #_Age(post-settlement)_for_L1;linear growth below this
25 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.01 0.1 0.07 0.07 0.007 6 -3 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 -3 3 0 0 99 6 -3 0 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP_1
 10 45 38.98 38.5 5 6 -3 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 40 90 66.07 66.795 5 6 -3 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.4 0.2891 0.21 0.5 6 -4 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.03 0.25 0.0628 0.05 0.5 6 -4 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 -3 3 0.9824 0 99 6 -6 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 0 1 2.44e-06 2.44e-06 0.8 6 -2 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 0 4 3.34694 3.34694 0.8 6 -2 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 55 55 55 55 0.8 6 -2 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.25 -0.25 0.8 6 -2 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 3 1 1 0.8 6 -2 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 0.8 6 -2 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -3 3 0 0 99 6 -3 0 0 0 0 0.5 0 0 # NatM_p_1_Mal_GP_1
 -3 3 0 0 99 6 -3 0 0 0 0 0.5 0 0 # NatM_p_2_Mal_GP_1
 -3 3 0 0 99 6 -3 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.1789 0 99 6 -4 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.2425 0 99 6 -4 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 99 6 -3 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 0.5671 0 99 6 -6 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
 0 1 2.44e-06 2.44e-06 0.8 6 -2 0 0 0 0 0.5 0 0 # Wtlen_1_Mal
 0 4 3.34694 3.34694 0.8 6 -2 0 0 0 0 0.5 0 0 # Wtlen_2_Mal
 -4 4 0 0 99 0 -2 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -1 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 0 99 0 -2 0 0 0 0 0.5 0 0 # RecrDist_Area_2
 -4 4 0 0 99 0 -2 0 0 0 0 0.5 0 0 # RecrDist_Area_3
 -4 4 0 0 99 0 -2 0 0 0 0 0.5 0 0 # RecrDist_timing_1
 1 1 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
 -4 4 0 0 99 0 -1 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_1to_1
 -4 4 0 0 99 0 -1 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_1to_1
 -5 4 -5 0 99 0 3 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_1to_2
 -5 4 0 0 99 0 3 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_1to_2
 -4 4 0 0 99 0 -1 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_2to_2
 -4 4 0 0 99 0 -1 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_2to_2
 -5 4 -5 0 99 0 3 0 0 0 0 0.5 0 0 # MoveParm_A_seas_1_GP_1from_2to_3
 -5 4 -2.19723 0 99 0 3 0 0 0 0 0.5 0 0 # MoveParm_B_seas_1_GP_1from_2to_3
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             8            12            10           9.2            99             6          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.6           0.6            99             6         -2          0          0          0          0          0          0          0 # SR_BH_steep
           0.2           1.5           0.5           0.5             1             6         -5          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             6         -6          0          0          0          0          0          0          0 # SR_regime
             0             2             0            -1             1             6         -3          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1970 # first year of main recr_devs; early devs can preceed this era
2007 # last year of main recr_devs; forecast devs start in following year
4 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 945 #_last_early_yr_nobias_adj_in_MPD
 1905 #_first_yr_fullbias_adj_in_MPD
 2008 #_last_yr_fullbias_adj_in_MPD
 2009 #_first_recent_yr_nobias_adj_in_MPD
 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008F 2009F 2010F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0
#
#Fishing Mortality info 
0.02 # F ballpark
-2000 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
1.5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2010 2028
# F rates by fleet
# Yr:  1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Shallow_Fishery 0.0106938 0.0192943 0.0216477 0.0193036 0.0229417 0.0178636 0.0147467 0.025045 0.0282222 0.0306529 0.0306459 0.0333967 0.0170405 0.0213455 0.0220287 0.0179841 0.0256919 0.0146104 0.0109422 0.0191218 0.0191361 0.0153156 0.0278451 0.0116181 0.0189845 0.0269419 0.0155576 0.0151177 0.0128722 0.0198464 0.0164935 0.0144886 0.0534275 0.0299804 0.0660591 0.0223496 0.0239947 0.0558143 0.0179815 0.0389422 0.0276981 0.0194644 0.0228856 0.0272828 0.0680764 0.0233859 0.0319728 0.0283494 0.0193514 0.0171277 0.0472831 0.0610682 0.0707013 0.0556253 0.0453634 0.0394605 0.0608567 0.0550443 0.0417214 0.0425332 0.0534813 0.0606715 0.0654496 0.094436 0.0944424 0.0946575
# Middle_Fishery 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00365927 0.0049717 0.00547115 0.00821786 0.0141298 0.0155163 0.0222691 0.0280256 0.0388131 0.0581705 0.160491 0.0572211 0.0899929 0.161873 0.0647795 0.0812253 0.148377 0.123069 0.120046 0.107465 0.0922915 0.0842606 0.074445 0.0751807 0.066489 0.0579572 0.059557 0.0549514 0.0487222 0.0456367 0.0456772 0.0397693 0.104303 0.104303 0.104305
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         3         1         0         0         0         1  #  Shallow_Survey
         4         1         0         0         0         1  #  Middle_Survey
         5         1         0         0         0         1  #  Deep_Survey
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15     -0.409009             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Shallow_Survey(3)
           -15            15      -1.06138             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Middle_Survey(4)
           -15            15     -0.401708             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Deep_Survey(5)
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
 1 0 0 0 # 1 Shallow_Fishery
 1 0 0 0 # 2 Middle_Fishery
 1 0 0 0 # 3 Shallow_Survey
 1 0 0 0 # 4 Middle_Survey
 1 0 0 0 # 5 Deep_Survey
#
#_age_selex_types
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
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 10 0 0 0 # 1 Shallow_Fishery
 10 0 0 0 # 2 Middle_Fishery
 10 0 0 0 # 3 Shallow_Survey
 10 0 0 0 # 4 Middle_Survey
 10 0 0 0 # 5 Deep_Survey
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
             1            80            55            55            99             6          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Shallow_Fishery(1)
             0            60            10            10            99             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_Shallow_Fishery(1)
             1            80            55            55            99             6          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Middle_Fishery(2)
             0            60            10            10            99             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_Middle_Fishery(2)
             1            80            55            55            99             6          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Shallow_Survey(3)
             0            60            10            10            99             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_Shallow_Survey(3)
             1            80            55            55            99             6          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Middle_Survey(4)
             0            60            10            10            99             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_Middle_Survey(4)
             1            80            55            55            99             6          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Deep_Survey(5)
             0            60            10            10            99             6          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_Deep_Survey(5)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
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
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  1 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_agecomp:_4
#  1 #_agecomp:_5
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

