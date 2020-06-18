#V3.30.03.05
# Pacific ocean perch 2017
# Chantel Wetzel, Lee Cronin-Fine
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
#GPat month  area age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
4 #_Nblock_Patterns
 5 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1918 1991 1992 2001 2002 2007 2008 2008 2009 2010 #Fishery retention blocks
 1918 2010 # Fishery retention blocks for the ascending limb inflection - not in use
 1995 2004 # Q Block for the triennial survey - not in use
 1918 1999 # final fishery
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
1 1 1 1 1 # autogen
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
# 1st element for biology, 2nd for SR, 3rd for Q, 5th for selex, 4th reserved
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
3 #_Growth_Age_for_L1
20 #_Growth_Age_for_L2 (999 to use as Linf)
0.055 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
3 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Maturity by growth pattern
# 0 0 0 0 0 0.24 0.49 0.73 0.89 0.95 0.91 0.85 0.81 0.84 0.89 0.94 0.96 0.95 0.94 0.94 0.94 0.95 0.95 0.98 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
0 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms	
#_LO	HI	INIT		PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn		
0.02	0.1	0.054	 	-2.92	0.44	3	-5	0	0	0	0	0	0	0	#	NatM_p_1_Fem_GP_1	
15	25	20.8	 	20.8	10	0	3	0	0	0	0	0	0	0	#	L_at_Amin_Fem_GP_1	
35	45	41.4	 	41.4	10	0	2	0	0	0	0	0	0	0	#	L_at_Amax_Fem_GP_1	
0.1	0.4	0.166	 	0.166	0.05	0	3	0	0	0	0	0	0	0	#	VonBert_K_Fem_GP_1	
0.03	5	1.31	 	1.31	0.50	0	5	0	0	0	0	0	0	0	#	CV_young_Fem_GP_1	
0.03	5	2.68	 	2.68	0.50	0	5	0	0	0	0	0	0	0	#	CV_old_Fem_GP_1	
0	3	1.003E-05	1.003E-05	99	0	-99	0	0	0	0	0	0	0	#	Wtlen_1_Fem	
2	4	3.1026		3.1026	99	0	-99	0	0	0	0	0	0	0	#	Wtlen_2_Fem	
20	40	32.1		32.1	99	0	-99	0	0	0	0	0	0	0	#	Mat50%_Fem	
-2	4	-1		-1	99	0	-99	0	0	0	0	0	0	0	#	Mat_slope_Fem	
0	6	8.66E-10	1	99	0	-99	0	0	0	0	0	0	0	#	Eggs_scalar_Fem	
-3	5	4.9767		5	99	0	-99	0	0	0	0	0	0	0	#	Eggs_exp_len_Fem	
-1	1	0		0.05	0.1	6	-5	0	0	0	0	0	0	0	#	NatM_p_1_Mal_GP_1	
-1	1	0		0	0.1	0	-2	0	0	0	0	0	0	0	#	L_at_Amin_Mal_GP_1	
-1	1	-0.066		-0.066	0.1	0	2	0	0	0	0	0	0	0	#	L_at_Amax_Mal_GP_1	
-1	1	0.167		0.167	0.1	0	3	0	0	0	0	0	0	0	#	VonBert_K_Mal_GP_1	
-5	5	 0 	        0	0.5	0      -5	0	0	0	0	0	0	0	#	CV_young_Mal_GP_1	
-5	5	-0.100		0	0.5	0	5	0	0	0	0	0	0	0	#	CV_old_Mal_GP_1	
0	3	9.881E-06	9.881E-06	99	0	-99	0	0	0	0	0	0	0	#	Wtlen_1_Mal	
2	4	3.1039		3.1039	99	0	-99	0	0	0	0	0	0	0	#	Wtlen_2_Mal	
0	2	1		1	99	0	-99	0	0	0	0	0	0	0	#	RecrDist_GP_1	
0	2	1		1	99	0	-99	0	0	0	0	0	0	0	#	RecrDist_Area_1	
0	2	1		1	99	0	-99	0	0	0	0	0	0	0	#	RecrDist_Bseas_1	
0	2	1		1	99	0	-99	0	0	0	0	0	0	0	#	CohortGrowDev	
0.01	0.99	0.5		0.5	0.5	0	-99	0	0	0	0	0	0	0	#	FracFemale_GP_1	

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
             5            20           9.5            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.15             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
           0.5           1.2           0.7          0.70            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -99          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -99          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1940 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1900 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1955 #_last_early_yr_nobias_adj_in_MPD
 1975 #_first_yr_fullbias_adj_in_MPD
 2012 #2006 #_last_yr_fullbias_adj_in_MPD
 2014 #2009 #_first_recent_yr_nobias_adj_in_MPD
 0.70 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -6 #min rec_dev
 6 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
#Fishing Mortality info 
0.03 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
5 # if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; count = 0
#_Q_setup
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         0         0         1  #  POP
         5         1         0         1         0         1  #  Triennial - not used in the model
         6         1         0         0         0         1  #  AFSCSlope
         7         1         0         0         0         1  #  NWFSCSlope
         8         1         0         1         0         1  #  NWFSCcombo
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -0.03012             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_POP(4)
           -15            15      -1.76258             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial(5)
             0           0.5       0.38530             0             1             0         -2          0          0          0          0          0          0          0  #  ExtraSD_base_Triennial(5)
           -15            15      -2.36684             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_AFSCSlope(6)
           -15            15      -3.03473             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCSlope(7)
           -15            15      -2.54651             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCcombo(8)
             0           0.5      0.036141             0             1             0          2          0          0          0          0          0          0          0  #  ExtraSD_base_NWFSCcombo(8)
#_no timevary Q parameters
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 24 1 0 0 # 1 Fishery
 24 0 0 0 # 2 ASHOP 
 15 0 0 1 # 3 Foreign
  1 0 0 0 # 4 POP
 24 0 0 0 # 5 Triennial
 24 0 0 0 # 6 AFSCSlope
 24 0 0 0 # 7 NWFSCSlope
 24 0 0 0 # 8 NWFSCcombo
#
#_age_selex_types
#_Pattern Discard Male Special
 10 0 0 0 # 1 Fishery
 10 0 0 0 # 2 ASHOP
 10 0 0 0 # 3 Foreign
 10 0 0 0 # 4 POP
 10 0 0 0 # 5 Triennial
 10 0 0 0 # 6 AFSCSlope
 10 0 0 0 # 7 NWFSCSlope
 10 0 0 0 # 8 NWFSCcombo
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# Fishery - Double Normal
            20            45       38.2359            28            10             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_Fishery(1)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P2_Fishery(1)
            -1             9       3.54865             4             2             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_Fishery(1)
            -9             9         -1.65             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P4_Fishery(1)
            -5             9          -3.5             4             2             0          4          0          0          0          0          0          0          0  #  SizeSel_P5_Fishery(1)
            -5             9      0.627262            -2             2             0          2          0          0          0          0          0          4          2  #  SizeSel_P6_Fishery(1)
# Fishery - Retention
            15            45       28.2494            35            10             0          1          0          0          0          0        0.5          0          0  #  Inflection for logistic_Fishery(1)
           0.1            10       1.09467             1             2             0          1          0          0          0          0        0.5          2          1  #  95% Width for logistic_Fishery(1)
           -10            10           6.5           6.5             2             0          1          0          0          0          0        0.5          1          2  #  Final_Fishery(1)
             0             0             0             0            99             0         -3          0          0          0          0        0.5          0          0  #  Male offest_Fishery(1)
# ASHOP - Double Normal
            20           49.5           45            28            10             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_ASHOP (2)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P2_ASHOP (2)
            -1             9       4.96786             4             2             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_ASHOP (2)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P4_ASHOP (2)
            -9             9         -4.35            -4             2             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_ASHOP (2)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P6_ASHOP (2)
# POP - Logistic
            20            70       23.0092            30            10             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_POP(4)
         0.001            50       12.1564            15             5             0          3          0          0          0          0          0          0          0  #  SizeSel_P2_POP(4)
# Triennial - Double Normal
# All parameters fixed- only retained to remove the catch associated with the survey
            20            45       27.6542            28            10             0         -1          0          0          0          0          0          0          0  #  SizeSel_P1_Triennial(5)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P2_Triennial(5)
            -1             9           5.5             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P3_Triennial(5)
            -1             9        3.2432             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P4_Triennial(5)
            -5             9            -5            -5             2             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_Triennial(5)
            -5             9      -0.67802            -2             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P6_Triennial(5)
# AFSC - Double Normal
            20            45       22.0613            28            10             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_AFSC_slope(6)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P2_AFSC_slope(6)
            -1             9       1.42853             4             2             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_AFSC_slope(6)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P4_AFSC_slope(6)
            -9             9       	-9            -9             2             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_AFSC_slope(6)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P6_AFSC_slope(6)
# NWFSC Slope - Double Normal
            20            45       36.6071            28            10             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_NWFSC Slope(7)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P2_NWFSC Slope(7)
            -1             9       1.84426             4             2             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_NWFSC Slope(7)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P4_NWFSC Slope(7)
            -9             9       	-9            -9             2             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_NWFSC Slope(7)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P6_NWFSC Slope(7)
# NWFSC Combo - Double Normal
            18          49.5         21.43            28            10             0          1          0          0          0          0          0          0          0  #  SizeSel_P1_NWFSCcombo(8)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P2_NWFSCcombo(8)
            -1             9       2.90756             4             2             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_NWFSCcombo(8)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  SizeSel_P4_NWFSCcombo(8)
            -9             9            -9            -4             2             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_NWFSCcombo(8)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  SizeSel_P6_NWFSCcombo(8)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -5             9      0.627262            -2             2             0     4  # Final fishery 1918-2002
           0.1            10       1.09467             1             2             0     4  # Width 1918-2010
           -10            10       3.93772           3.9            2             0      4  # Final Retain_P3_Fishery(1)_BLK1repl_1918 - 1993
           -10            10        2.3021           1.7            2             0      4  # Final Retain_P3_Fishery(1)_BLK1repl_1992 - 2001
           -10            10       1.74548           0.6            2             0      4  # Final Retain_P3_Fishery(1)_BLK1repl_2002 - 2007
           -10            10      0.635019             0            2             0      4  # Final Retain_P3_Fishery(1)_BLK1repl_2008
           -10            10      -0.06241             0            2             0      4  # Final Retain_P3_Fishery(1)_BLK1repl_2009 - 2010
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
0 # 2D AR
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
# Francis Weights based on the final model
4	1	0.09559767  # fishery lengths
4	2	0.1046477   # ashop lengths
4	4	1      	    # pop lengths
4	6	0.07697898  # afsc lengths
4	7	0.5645395   # nwfsc slope lengths
4	8 	0.03074499  # nwfsc combo lengths
5	1	0.217385    # fishery ages
5	2	0.0318      # ashop ages
5	4	1           # pop ages
5	7	0.303584    # nwfsc slope lengths
5	8	0.3630111   # nwfsc combo cal
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
4 1 1 0.5 1 # Fishery Lengths
4 2 1 0.5 1 # ASHOP Lengths
4 4 1 0.5 1 # POP Lengths
4 6 1 0.5 1 # AFSC Slope Lengths
4 7 1 0.5 1 # NWFSC Slope Lengths
5 1 1 0.5 1 # Fishery Ages
5 2 1 0.5 1 # ASHOP Ages
5 4 1 0.5 1 # POP Ages
5 7 1 0.5 1 # NWFSC Slope Ages

# Remove all Triennial Data
1 5 1 0.0 1 # Triennial Survey
4 5 1 0.0 1 # Triennial Lengths
5 5 1 0.0 1 # Triennial Ages
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

