#V3.30.18.00;_safe;_compile_date:_Sep 30 2021;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: BLK_WA_dat.ss // BLK_WA_ctl.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
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
 0.001 2 0.0964 -2.33925 0.524 3 2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 5 30 27.53 27.53 10 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 35 65 51.17 51.17 10 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 1 0.173 0.173 0.8 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.03 0.2 0.1 0.1 0.8 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.03 0.2 0.1 0.1 0.8 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 2.48e-05 2.48e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 0 4 2.9006 2.9006 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 1000 43.69 43.69 0.8 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.66 -0.4139 0.8 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 0.2747 0.2747 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0.0941 0.0941 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 0 0 50 0 2 0 0 0 0 0.5 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0.063 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.063 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 -0.023 0 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 0 0 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
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
             1            20            11             8            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
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
 2012 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
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
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
# Trawl 3.93862e-05 8.38988e-05 0.000163227 0.000493217 0.000770417 0.00115251 0.000658559 0.000549159 0.000378843 0.000484248 0.000359648 0.000300399 0.00037827 0.00030194 0.000326728 0.000354256 0.00024942 0.000388414 0.000434268 0.000216869 0.000254793 0.000223677 0.000499741 0.000287397 0.000302136 0.000176279 0.000318749 0.000303711 0.000237847 0.000229769 0.000185527 0.00015114 0.000237311 0.000211183 0.000190372 0.000225009 0.000473662 0.000409175 0.000322217 0.000321463 0.000604974 0.000827164 0.000518025 0.000342995 0.000280269 0.000259616 0.000221748 0.000139724 0.000225894 0.000219983 7.73166e-05 8.50219e-05 0.000106153 8.39752e-05 5.57649e-06 9.94609e-06 7.13946e-06 1.28568e-05 0.000115623 3.05436e-06 3.20327e-07 0 8.5739e-08 1.46607e-07 1.66039e-06 4.3524e-09 3.45528e-06 1.55109e-06 8.58495e-08 4.9547e-09 6.03055e-08 1.79243e-06 1.71341e-06 1.65134e-08 1.8879e-06 1.78649e-06 1.7781e-06 0.000142943 0.000142943 0.000142943 0.000142943 0.000142943 0.000142943 0.000142943 0.000142943 0.000142943 0.000142943
# nonTrawl 0 2.18892e-06 4.11415e-07 1.73108e-05 1.26571e-07 3.78469e-05 1.41558e-07 6.55466e-07 1.39719e-06 5.80425e-07 4.75873e-06 3.79582e-06 4.03067e-06 2.37772e-06 4.87829e-06 2.31143e-06 3.11812e-06 1.50303e-06 2.95062e-06 1.42303e-06 2.88041e-06 1.08037e-06 2.28392e-06 6.25674e-07 7.87949e-07 5.48268e-07 4.48956e-07 4.0742e-07 3.51607e-07 3.96418e-07 4.73298e-06 4.59105e-06 4.87087e-06 4.25916e-06 6.9428e-06 9.3479e-06 6.0111e-06 9.09807e-06 6.02567e-05 0.000107825 4.67019e-05 3.3572e-05 5.63442e-05 9.86937e-05 0.000135944 0.000145912 0.000134414 0.00034227 0.00017922 0.000222922 0.000151422 0.000114177 2.12968e-08 0.000110338 0.000133066 0.000118225 9.26062e-06 7.82129e-06 3.7203e-06 3.13556e-06 3.28543e-09 1.64392e-10 1.64495e-10 1.33328e-08 1.64701e-10 9.88804e-10 5.93678e-08 0 0 0 0 0 7.2713e-08 0 2.4724e-08 3.38329e-12 3.38329e-12 1.872e-06 1.872e-06 1.872e-06 1.872e-06 1.872e-06 1.872e-06 1.872e-06 1.872e-06 1.872e-06 1.872e-06
# Rec 1.57094e-06 1.571e-06 1.57112e-06 1.57135e-06 1.57207e-06 1.57313e-06 1.57475e-06 1.57552e-06 1.57607e-06 9.72402e-07 5.82399e-06 6.79285e-06 1.57111e-05 8.62738e-06 1.64436e-05 1.82564e-05 3.22875e-05 3.55708e-05 2.956e-05 4.17839e-05 2.02914e-05 6.37769e-05 5.23847e-05 4.44731e-05 3.57646e-05 7.56623e-05 5.94913e-05 7.22724e-05 6.58899e-05 6.42361e-05 7.40856e-05 0.000104258 8.64201e-05 7.89176e-05 9.43021e-05 0.000107898 6.23429e-05 0.00015765 0.000146263 9.90827e-05 8.52722e-05 0.000401676 0.000549413 0.000440541 0.000470791 0.000586667 0.000689754 0.000675956 0.000615839 0.000625684 0.000714132 0.000552162 0.000571768 0.000552159 0.000632617 0.000429144 0.000461532 0.000395022 0.000413408 0.000383144 0.000387793 0.000336609 0.000410196 0.000417014 0.000464786 0.000582501 0.000558664 0.000513991 0.000398861 0.000450506 0.000392601 0.000414614 0.000504237 0.000583701 0.000636418 0.000503788 0.000501422 0.0481868 0.0481868 0.0481868 0.0481868 0.0481868 0.0481868 0.0481868 0.0481868 0.0481868 0.0481868
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
           -15            15      -10.9731             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_DocksideCPUE(4)
             0             5          0.01          0.01            99             0          1          0          0          0          0          0          0          0  #  Q_extraSD_DocksideCPUE(4)
           -15            15      -12.6372             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Tag_CPUE(5)
             0             5          0.01          0.01            99             0          1          0          0          0          0          0          0          0  #  Q_extraSD_Tag_CPUE(5)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_2;  parm=6; modification of pattern 24 with improved sex-specific offset
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
            15            50            40            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Trawl(1)
           -10            10            -1          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Trawl(1)
            -4            12             4           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Trawl(1)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Trawl(1)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Trawl(1)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Trawl(1)
# 2   nonTrawl LenSelex
            15            50            40            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_nonTrawl(2)
           -10            10            -1          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_nonTrawl(2)
            -4            12             4           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_nonTrawl(2)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_nonTrawl(2)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_nonTrawl(2)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_nonTrawl(2)
# 3   Rec LenSelex
            15            50            40            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Rec(3)
           -10            10            -1          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Rec(3)
            -4            12             4           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Rec(3)
            -2             6           2.2             6            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Rec(3)
           -15            10            -4          -3.7            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Rec(3)
            -5            10             5           0.1            99             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Rec(3)
# 4   DocksideCPUE LenSelex
            -5             5            -1            -1            99             0        -99          0          0          0          0          0          0          0  #  SizeSel_P1_DocksideCPUE(4)
            -5             5            -1            -1            99             0        -99          0          0          0          0          0          0          0  #  SizeSel_P2_DocksideCPUE(4)
# 5   Tag_CPUE LenSelex
            15            50            40            30            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Tag_CPUE(5)
           -10            10            -1          -2.6            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Tag_CPUE(5)
            -4            12             4           5.2            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Tag_CPUE(5)
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

