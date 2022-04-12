#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: BLK_WA_dat.ss // BLK_WA_ctl.ss
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
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1939 1939
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
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
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
3 #_Age(post-settlement)_for_L1;linear growth below this
20 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.001 2 0.161946 -2.33925 0.524 3 2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 5 30 20.1687 27.53 10 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 35 65 53.9024 51.17 10 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 1 0.137077 0.173 0.8 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.03 0.2 0.116262 0.1 0.8 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.03 0.2 0.0793255 0.1 0.8 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 2.48e-05 2.48e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 0 4 2.9006 2.9006 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 1000 43.69 43.69 0.8 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.66 -0.4139 0.8 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 0.2747 0.2747 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0.0941 0.0941 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 -0.114711 0 50 0 2 0 0 0 0 0.5 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 -0.0796217 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.136232 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.522456 0 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0.182926 0 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 -0.317191 0 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -3 3 2.58e-05 2.58e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 -3 4 2.887 2.887 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_month_1
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
             1            20       7.63452             8            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.25          0.99         0.773         0.773         0.147             2         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.8           0.8             0         -4          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1950 # first year of main recr_devs; early devs can preceed this era
2011 # last year of main recr_devs; forecast devs start in following year
6 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -1 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1946 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1976 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2008 #_last_yr_fullbias_adj_in_MPD
 2012 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.98 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1950R 1951R 1952R 1953R 1954R 1955R 1956R 1957R 1958R 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012F 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  -0.165363 -0.157658 -0.152129 -0.143211 -0.153757 -0.238715 -0.373581 -0.452969 -0.433834 -0.349725 -0.236979 -0.242271 -0.264672 0.0810451 -0.0266002 -0.28061 -0.181131 -0.0240947 0.63355 -0.335993 -0.324819 0.106656 -0.0673465 0.163948 0.592651 -0.110522 0.357452 0.0451695 0.489523 0.369329 0.222823 0.239428 0.0103783 0.587311 0.1857 0.401179 -0.10858 0.462497 0.175011 0.547436 0.310845 -0.0840769 -0.0631881 -0.292256 0.335482 -0.179626 -0.474353 0.196127 -0.397774 0.434979 0.00613173 -0.583075 -0.505963 0.306087 -0.0801121 0.0426101 0.733049 0.0318916 0.68806 -1.20935 0.402954 -0.464967 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
0.9 # max F (methods 2-4) or harvest fraction (method 1)
# F_Method 1:  no additional input needed
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Trawl 0.0055531 0.0118734 0.0232803 0.0713702 0.116823 0.18779 0.120662 0.105999 0.0756519 0.0975229 0.073815 0.0617581 0.077251 0.0619251 0.066589 0.0721109 0.0509442 0.0788685 0.0896241 0.0459314 0.05404 0.0477927 0.107954 0.0654303 0.0704785 0.0423643 0.0780341 0.0773715 0.0628369 0.0618115 0.0502975 0.0406949 0.0630153 0.0558375 0.049647 0.0573557 0.118028 0.102697 0.0818855 0.0823341 0.155899 0.220127 0.151898 0.106741 0.088521 0.0826937 0.0718676 0.0462955 0.0780667 0.0785214 0.0287377 0.0319137 0.0389691 0.0298812 0.00194896 0.00342049 0.00233689 0.00396371 0.0336156 0.0008673 8.82781e-05 0 2.28262e-05 3.90732e-05 0.000445978 1.18762e-06 0.00096904 0.000443351 2.48487e-05 1.43393e-06 1.76128e-05 0.00052129 0.000492458 4.67019e-06 0.000522058 0.000482611 0.000463685 0.00043755 0.00043755 0.00043755 0.00043755 0.00043755 0.00043755 0.00043755 0.00043755 0.00043755 0.00043755
# nonTrawl 0 0.000190628 3.60423e-05 0.00153313 1.16137e-05 0.00366125 1.49078e-05 7.14121e-05 0.000155426 6.4768e-05 0.000537385 0.000428847 0.00045336 0.000268665 0.000549745 0.000261401 0.000356422 0.000172971 0.000347605 0.000172472 0.000352132 0.000133984 0.000289357 8.37873e-05 0.000108965 7.81784e-05 6.49982e-05 6.04522e-05 5.29467e-05 5.93614e-05 0.000700442 0.000670379 0.000701224 0.000601639 0.000946692 0.00123758 0.000786644 0.00120829 0.00811721 0.0144512 0.0061449 0.00441664 0.00785155 0.0142891 0.0196883 0.0210461 0.0196253 0.0513452 0.0281146 0.0356762 0.0247653 0.0188438 3.47599e-06 0.0176293 0.0208996 0.018243 0.00137774 0.00113454 0.000533284 0.000454754 4.74324e-07 2.37568e-08 2.37866e-08 1.94735e-06 2.41269e-08 1.4455e-07 8.80122e-06 0 0 0 0 0 1.02878e-05 0 3.23328e-06 3.38329e-12 3.38329e-12 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06 2.7099e-06
# Rec 0.000135113 0.000135506 0.000136312 0.000137805 0.000142769 0.000150509 0.00016381 0.000169443 0.000173001 0.00010706 0.000648783 0.000757095 0.0017436 0.000961887 0.00182875 0.00203821 0.00364551 0.00404609 0.00344266 0.00500593 0.0024525 0.00782276 0.00656845 0.00589589 0.00489708 0.0106776 0.00851827 0.0105957 0.00979155 0.00947971 0.0108001 0.0150045 0.0122663 0.0109727 0.0126365 0.0140522 0.00804006 0.0206426 0.0194157 0.0130622 0.0110182 0.0518605 0.0750792 0.0625021 0.0667403 0.0827843 0.0985572 0.0993146 0.0945913 0.0979104 0.1141 0.0890757 0.0913033 0.0863259 0.0971756 0.0647344 0.0672103 0.0562407 0.0583192 0.0547363 0.0551445 0.0479453 0.058507 0.0600711 0.0670781 0.0837536 0.0814628 0.0770262 0.0612973 0.0690658 0.0596373 0.0606472 0.0698447 0.0769427 0.081529 0.06446 0.0641428 0.0683315 0.0683315 0.0683315 0.0683315 0.0683315 0.0683315 0.0683315 0.0683315 0.0683315 0.0683315
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         1         0         1  #  DocksideCPUE
         5         1         0         1         0         1  #  Tag_CPUE
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -6.17019             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_DocksideCPUE(4)
             0             5     0.0783803          0.01            99             0          1          0          0          0          0          0          0          0  #  Q_extraSD_DocksideCPUE(4)
           -15            15      -8.02916             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Tag_CPUE(5)
             0             5      0.464823          0.01            99             0          1          0          0          0          0          0          0          0  #  Q_extraSD_Tag_CPUE(5)
#_no timevary Q parameters
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
 24 0 0 0 # 1 Trawl
 24 0 0 0 # 2 nonTrawl
 24 0 0 0 # 3 Rec
 5 0 0 3 # 4 DocksideCPUE
 24 0 0 0 # 5 Tag_CPUE
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
 10 0 0 0 # 1 Trawl
 10 0 0 0 # 2 nonTrawl
 10 0 0 0 # 3 Rec
 15 0 0 3 # 4 DocksideCPUE
 15 0 0 3 # 5 Tag_CPUE
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Trawl LenSelex
            15            50       49.9992            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Trawl(1)
           -10            10       2.07755          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Trawl(1)
            -4            12       3.63199           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Trawl(1)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Trawl(1)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Trawl(1)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Trawl(1)
# 2   nonTrawl LenSelex
            15            50       41.2871            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_nonTrawl(2)
           -10            10       2.58287          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_nonTrawl(2)
            -4            12       3.69257           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_nonTrawl(2)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_nonTrawl(2)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_nonTrawl(2)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_nonTrawl(2)
# 3   Rec LenSelex
            15            50       40.3875            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Rec(3)
           -10            10      -4.67644          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Rec(3)
            -4            12        3.5263           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Rec(3)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Rec(3)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Rec(3)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Rec(3)
# 4   DocksideCPUE LenSelex
            -5             5            -1            -1            99             0        -99          0          0          0          0          0          0          0  #  SizeSel_P1_DocksideCPUE(4)
            -5             5            -1            -1            99             0        -99          0          0          0          0          0          0          0  #  SizeSel_P2_DocksideCPUE(4)
# 5   Tag_CPUE LenSelex
            15            50       39.7399            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Tag_CPUE(5)
           -10            10      -3.04193          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Tag_CPUE(5)
            -4            12       3.60541           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Tag_CPUE(5)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Tag_CPUE(5)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Tag_CPUE(5)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Tag_CPUE(5)
# 1   Trawl AgeSelex
# 2   nonTrawl AgeSelex
# 3   Rec AgeSelex
# 4   DocksideCPUE AgeSelex
# 5   Tag_CPUE AgeSelex
#_No_Dirichlet parameters
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
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
      4      1       0.9
      4      2       0.2
      4      3      0.45
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 9 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 3 1 1 1
 1 4 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 5 1 1 1
 5 1 1 1 1
 5 2 1 1 1
 5 3 1 1 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  1 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  0 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  0 #_agecomp:_4
#  0 #_agecomp:_5
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
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

