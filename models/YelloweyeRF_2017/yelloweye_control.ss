#C Yelloweye 2017 control file
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  1=like 3.24; 2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # Recruitment: 1=global; 2=by area (future option)
2 #  number of recruitment settlement assignments 
0 # year_x_area_x_settlement_event interaction requested (only for recr_dist_method=1)
#GPat month  area age (for each settlement assignment)
 1 1 1 0
 1 1 2 0
0 #_N_movement_definitions
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) if do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, GP=1, source=1 dest=2, age1=4, age2=10
#
4 #_Nblock_Patterns
1	1	1	1	 #_blocks_per_pattern 
# begin and end years of blocks
1992 	2004 	# allow change Triennial catchability
2005	2016	# to allow chance OR_Rec index catchability
2002 	2016 	#	to allow change selex with IFQ
2002	2016	#	No yelloweye retention allowed in rec fisheries
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
1 1 1 1 1 # autogen
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
# 1st element for biology, 2nd for SR, 3rd for Q, 5th for selex, 4th reserved
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
1 		#_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
1 		#_N_breakpoints
4 		# age(real) at M breakpoints
1 		# GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1 		#_Growth_Age_for_L1
70 		#_Growth_Age_for_L2 (999 to use as Linf)
-999 	#_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0 		#_placeholder for future growth feature
0 		#_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 		#_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 		#_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2 		#_First_Mature_Age
2 		#_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 		#_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 		#_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO 			HI 				INIT 					PRIOR 					PR_SD 			PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.01 			0.15 			0.04390336 	 -3.12576436 		0.4384383 	3 		 -1 		0 	0 	0 	0 	0 	0 	0 	#	Hamel prior, maxage = 123
 1  				35 				23 						30 						99 					0 			2 		0 	0 	0 	0 	0 	0 	0 	# L_at_Amin_Fem_GP_1
 40 				120 			61 						66 						99 					0 			2 		0 	0 	0 	0 	0 	0 	0 	# L_at_Amax_Fem_GP_1
 0.01 			0.2 			0.05 					0.05 					99 					0 			1 		0 	0 	0 	0 	0 	0 	0 	# VonBert_K_Fem_GP_1
 0.01 			0.5				0.1 					0.1 					99 					0 			3 		0 	0 	0 	0 	0 	0 	0 	# CV_young_Fem_GP_1
 0.01				0.5				0.1 					0.1 					99 					0 		  7 		0 	0 	0 	0 	0 	0 	0 	# CV_old_Fem_GP_1
 -3 				3 				7.312807e-06	7.312807e-06 	99 					0 		 -50  	0 	0 	0 	0 	0 	0 	0 	# Wtlen_1_Fem
 -3 				4 				3.242482 			3.242482 			99 					0 		 -50  	0 	0 	0 	0 	0 	0 	0 	# Wtlen_2_Fem

#Maturity updated with Melissa Head data 
 38 			 45		 		  42.0704515		41.765 			  99 					0 		 -50  	0 	0 	0 	0 	0 	0 	0 	# Mat50%_Fem
 -3 			 3 		     -0.4022141 	 -0.36886 	 		99 					0  	 	 -50  	0 	0 	0 	0 	0 	0 	0 	# Mat_slope_Fem
# Fecundity updated with E.J.Dick 2017 results 
 -3 				300000 		7.21847E-08		7.21847E-08 	 1 					6 		 	-6 		0 	0 	0 	0 	0 	0 	0 	# Million_Eggs/cm_a_Fem
 -3 				39000 		4.043 				4.043 				 1 					6 		 	-6 		0 	0 	0 	0 	0 	0 	0 	# Million_Eggs/cm_b_Fem
#
  0 				2 				1 						1 						99 					0 		-50 		0 	0 	0 	0 	0 	0 	0 	# RecrDist_GP_1
 -4 				4 				0 						0 						99 					0 		-50 		0 	0 	0 	0 	0 	0 	0 	# RecrDist_Area_1
 -4 				4 		 	 -0.1 					0 						99 					0 		  3 		0 	0 	0 	0 	0 	0 	0 	# RecrDist_Area_2
  0 				2 				1 						1 						99 					0 		-50 		0 	0 	0 	0 	0 	0 	0 	# RecrDist_Bseas_1
  0 				2 				1 						1 						99 					0 		-50 		0 	0 	0 	0 	0 	0 	0 	# CohortGrowDev
  0.000001 	0.999999  0.5        		0.5  					0.5 				0 		-99 		0 	0 	0 	0 	0 	0 	0 	# FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 	0 	0 	0 	0 	0 	0 	0 	0 	0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_LO          HI         INIT      PRIOR        PR_SD      PR_type   PHASE   env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn #  parm_name
  3           15         6.1        5           99            0      3       0      	0      	0       	0         0       0      0 			# SR_LN(R0)
  0.2          1         0.718      0.718      	0.158         2     -3       0      	0      	0       	0         0       0      0 			# SR_BH_steep
  0            5         0.5     		0.5       	99            0     -2       0      	0      	0       	0         0       0      0 			# SR_sigmaR
 -5            5         0          0           99            0     -50      0      	0      	0       	0         0       0      0 			# SR_regime
 -1            2         0          1           99            0     -50      0      	0      	0       	0         0       0      0 			# SR_autocorr

 1 		#do_recdev:  0=none; 1=devvector; 2=simple deviations
 1980 	# first year of main recr_devs; early devs can preceed this era
 2015 	# last year of main recr_devs; forecast devs start in following year
 7 		#_recdev phase 
 1 		# (0/1) to read 13 advanced options
 1889 	#_recdev_early_start (0=none; neg value makes relative to recdev_start)
 7			#_recdev_early_phase
 0			#_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 		#_lambda for Fcast_recr_like occurring before endyr+1
 1917 	#_last_early_yr_nobias_adj_in_MPD
 1975 	#_first_yr_fullbias_adj_in_MPD
 2013 	#_last_yr_fullbias_adj_in_MPD
 2014 	#_first_recent_yr_nobias_adj_in_MPD
 0.36 	#_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 		#_period of cycles in recruitment (N parms read below)
 -5 		#min rec_dev
 5 		#max rec_dev
 0 		#_read_recdevs
#_end of advanced SR options
#
#Fishing Mortality info 
0.09 # F ballpark
1999 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_Q_setup
#_    fleet       link  link_info   extra_se    biasadj      float  #  fleetname
          3          1          0          1          0          1  #  3_CA_REC
          6          1          0          1          0          1  #  6_OR_REC
          7          1          0          1          0          1  #  7_WA_REC
          8          1          0          1          0          1  #  8_CACPFV
          9          1          0          1          0          1  #  9_OR_RECOB
         10          1          0          1          0          1  #  10_TRI_ORWA
         11          1          0          1          0          1  #  11_NWFSC_ORWA
         12          1          0          1          0          1  #  12_IPHC_ORWA
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_         LO           HI         INIT        PRIOR        PR_SD      PR_type     PHASE   env-var   use_dev  dev_mnyr  dev_mxyr    dev_PH     Block   Blk_Fxn  #  parm_name
           -15          15           0            0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_CA_REC(3)
          	0            5    		 0            0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_CA_REC(3)
           -15          15           0            0           99            0        -1         0         0         0         0         0         2         1 	#  LnQ_base_OR_REC(6)
          	0            5    		 0 		      0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_OR_REC(6)
           -20          15           0            0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_WA_REC(7)
          	0            5    		 0            0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_WA_REC(7)
 #          -15           15     -2.21024          0           99            0        -1         0         0         0         0         0         1         1 	#  LnQ_base_CACPFV(8)
           -15          15      -2.21024          0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_CACPFV(10)
          	0            5    		 0            0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_CACPFV(8)
           -15          15      -16.1653          0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_OR_RECOB(9)
          	0            5    		 0            0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_OR_RECOB(9)
#           -15           15     -2.21024          0           99            0        -1         0         0         0         0         0         1         1 	#  LnQ_base_TRI_ORWA(10)
           -15          15      -2.21024          0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_TRI_ORWA(10)
           	0            5    		 0            0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_TRI_ORWA(10)
           -15          15       -3.1832          0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_NWFSC_ORWA(11)
            0            5    		 0       	  0.01        99            0        -5         0         0         0         0         0         0         0 	#  Q_extraSD_NWFSC_ORWA(11)
           -15          15      -12.0696          0           99            0        -1         0         0         0         0         0         0         0 	#  LnQ_base_IPHC_ORWA(12)
            0            5    		 0         	  0.01        99            0         5         0         0         0         0         0         0         0 	#  Q_extraSD_IPHC_ORWA(12)
#_timevary Q parameters
#	HI	LO		init			PRIOR		PR_SD		PRIOR_TYPE PHASE
#  -4    4       -0.6    0       99      -1      1   # OR_rec deviation, to accomodate two rec dockside surveys
#  -4    4       -0.6    0       99      -1      1   # Triennial 1995 deviation
  -4    4       -0.6    0       99      -1      1   # Triennial 1995 deviation

#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
24 0 0 0 #  1_CA_TWL  		
24 0 0 0 #  2_CA_NONTWL   
24 0 0 0 #  3_CA_REC  		
24 0 0 1 #  4_ORWA_TWL  	
24 0 0 2 #  5_ORWA_NONTWL 
24 0 0 0 #  6_OR_REC  		
24 0 0 0 #  7_WA_REC  		
15 0 0 3 #  8_CACPFV  		
24 0 0 0 #  9_OR_RECOB 	  
24 0 0 0 #  10_TRI_ORWA   
24 0 0 0 #  11_NWFSC_ORWA 
24 0 0 0 #  12_IPHC_ORWA  	  
#_age_selex_types
#_Pattern Discard Male Special
 10 0 0 0 #	1_CA_TWL  		  
 10 0 0 0 #	2_CA_NONTWL    
 10 0 0 0 #	3_CA_REC  		  
 10 0 0 0 #	4_ORWA_TWL  	  
 10 0 0 0 #	5_ORWA_NONTWL  
 10 0 0 0 #	6_OR_REC  		  
 10 0 0 0 #	7_WA_REC  		  
 10 0 0 0 #	8_CACPFV  		  
 10 0 0 0 #	9_OR_RECOB 	  
 10 0 0 0 #	10_TRI_ORWA    
 10 0 0 0 #	11_NWFSC_ORWA  
 10 0 0 0 #	12_IPHC_ORWA  	  

#_size_selex_settings
#_         LO           HI         INIT        PRIOR        PR_SD      PR_type     PHASE   env-var   use_dev  dev_mnyr  dev_mxyr    dev_PH     Block   Blk_Fxn  #  parm_name
#CA_TWL
           20           60           45           40          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30           20           9           99            0         5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999         9           -999    		 -999  		  	99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999         9           -999       	  9        	  99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#CA_NONTWL       
           20           60           45           30          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30           20           9           99            0         5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999   			 -5     	 	 	99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999         9          	-999       	  9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#CA_REC        
           20           60           44           40          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30         	 20           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999   			 -5   		  	99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999         9           -999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#ORWA_TWL       
           20           60           40           40          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30         	 20           9           99            0         5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999         9           -999     	 	 -999   	  	99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9          	-999       	  9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#ORWA_NONTWL       
           20           60           50           30          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30           20           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999       	9           -999     		 -5    		 		99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9          	-999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
##OR_REC        
           20           60           40           30          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30           12           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999         -5    		  	99            0      	 -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9           -999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#WA_REC        
           20           60           44.4         30          99            0         6         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            4.49         6           99            0         6         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30         	 20           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999     	 	 -5    		  	99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9           -999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#OR_observer
           20           60           40           30          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30           20           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999     	 	 -5 		  		99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9           -999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#TRI_ORWA        
           20           80           50           30          99            0         4         0         0         0         0         0         0         0  #  PEAK     
           -15          4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1           9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1           30           12           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999     	 	 -5    		 		99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9           -999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#NWFSC_ORWA                                                                                      
           20           60           50           40          99            0         4         0         0         0         0         0         0         0  #  PEAK     
          -15           4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1        		9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1        		30         	 20           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999    	 	 -5    	      99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9           -999          9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
#IPHC_ORWA                                                             
           20           60           50           40          99            0         4         0         0         0         0         0         0         0  #  PEAK     
          -15           4           -15          -15          99            0        -5         0         0         0         0         0         0         0  #  TOP      
           -1        		9            6            6           99            0         4         0         0         0         0         0         0         0  #  ASC-WIDTH
           -1        		30         	 20           9           99            0        -5         0         0         0         0         0         0         0  #  DSC-WIDTH
           -999        	9           -999   		 	 -5    		  	99            0        -4         0         0         0         0         0         0         0  #  INIT     
           -999        	9           -999       	  9           99            0        -5         0         0         0         0         0         0         0  #  FINAL    
   
#_no_timevary selex parameters
#
0  #_ 0/1 to request experimental 2D_AR selectivity smoother options
# Tag loss and Tag reporting parameters go next
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
#_Factor  Fleet  Value
4					1				0.84204012
4					2				0.35975036
4					3				0.60066279
4					4				0.18238518
4					5				0.48699458
4					6				0.39562332
4					7				0.89221425
4					8				0.705075
4					9				0.78070068
4					10			0.53747932
4					11			0.65413296
4					12			1
5					2				0.555437771
5					3				0.587597465
5					4				0.470739516
5					5				0.4781385
5					6				0.361229574
5					7				1
5					11			1
5					12			0.02779525
-9999   	1    		0  					# terminator
#
1 #_maxlambdaphase
1 #_sd_offset
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_CPUE/survey:_9
#  1 #_CPUE/survey:_10
#  1 #_CPUE/survey:_11
#  1 #_CPUE/survey:_12
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  1 #_lencomp:_9
#  1 #_lencomp:_10
#  1 #_lencomp:_11
#  1 #_lencomp:_12
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_agecomp:_4
#  1 #_agecomp:_5
#  1 #_agecomp:_6
#  0 #_agecomp:_7
#  0 #_agecomp:_8
#  1 #_agecomp:_9
#  0 #_agecomp:_10
#  1 #_agecomp:_11
#  0 #_agecomp:_12
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  1 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

