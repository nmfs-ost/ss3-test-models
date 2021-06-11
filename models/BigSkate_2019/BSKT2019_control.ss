#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#C Control file Big Skate 2019
#_data_and_control_files: BSKT2019_data.ss // BSKT2019_control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
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
2 #_Nblock_Patterns
 1 13 #_blocks_per_pattern 
# begin and end years of blocks
 1995 2004
 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2030
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
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
  #_no additional input for selected M option; read 1P per morph
#
8 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
5 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.1 0.6 0.378578 -1.02165 0.438 3 3 0 0 0 0 0.5 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 40 20.322 20 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 100 300 178.398 200 99 0 2 0 0 0 0 0.5 0 0 # Linf_Fem_GP_1
 0.005 30 11.9546 0.15 99 0 1 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.1 10 2.5 1 99 0 3 0 0 0 0 0.5 0 0 # Cessation_Fem_GP_1
 1 20 5.68435 0.1 99 0 5 0 0 0 0 0.5 0 0 # SD_young_Fem_GP_1
 1 20 7.86676 0.1 99 0 5 0 0 0 0 0.5 0 0 # SD_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 7.49e-06 7.49e-06 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 2 4 2.9925 2.9925 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 10 150 148.245 148.245 99 0 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -0.09 -0.05 -0.13155 -0.13155 99 0 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 99 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 99 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 0 0 99 0 -2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -1 1 0 0 99 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 1 -0.393901 0 99 0 2 0 0 0 0 0 0 0 # Linf_Mal_GP_1
 -10 20 0.124862 0 99 0 3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -3 3 0.2 0 99 0 -3 0 0 0 0 0 0 0 # Cessation_Mal_GP_1
 -1 1 0 0 99 0 -5 0 0 0 0 0 0 0 # SD_young_Mal_GP_1
 -1 1 0 0 99 0 -5 0 0 0 0 0 0 0 # SD_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 3 7.49e-06 7.49e-06 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 2 4 2.9925 2.9925 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
#  Cohort growth dev base
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.001 0.999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
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
             5            15             9          11.1            10             0          3          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.4           0.6           0.2             0         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0           0.4           0.3           0.3           0.8             0         -2          0          0          0          0          0          0          0 # SR_sigmaR
            -2             2             0             0            99             0         -1          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1995 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
-3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -4 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1995 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1970 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2016 #_last_yr_fullbias_adj_in_MPD
 2018 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.3 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
4  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028 2029 2030
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fishery_current 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.005711 0.0165627 0.0285544 0.0105713 0.0152898 0.0195614 0.0117719 0.0112606 0.0182373 0.0134771 0.0104498 0.01316 0.00894061 0.0127049 0.00632779 0.00509851 0.00668763 0.00628443 0.00353973 0.00954788 0.00716473 0.0096854 0.00620546 0.00403998 0.0073305 0.00732482 0.0525465 0.0520054 0.0515244 0.0510434 0.0505625 0.0500815 0.0496606 0.0491797 0.0486987 0.0482778
# Discard_historical 0 0.000267508 0.000535207 0.000805448 0.00107403 0.00134326 0.00161324 0.00188627 0.00215806 0.00243089 0.00270485 0.00298221 0.00325868 0.00353651 0.00381578 0.00409877 0.00438112 0.00466508 0.0049507 0.00524027 0.00552937 0.00582027 0.00611302 0.00538362 0.00596803 0.00577329 0.00662415 0.00738799 0.00782779 0.00808796 0.00833447 0.00858824 0.00876117 0.00904624 0.00908371 0.00911135 0.00913814 0.00917273 0.00920541 0.00923091 0.0092554 0.00927515 0.00929325 0.00931007 0.00932646 0.00934747 0.00937179 0.00939308 0.00941332 0.00942852 0.00943997 0.00945335 0.00947164 0.00948903 0.00949671 0.00949832 0.00950087 0.00950599 0.00951049 0.0095149 0.00952183 0.0095308 0.00954927 0.00958081 0.00960055 0.00961308 0.00962957 0.00963585 0.0096348 0.00963268 0.00963247 0.00963066 0.00962867 0.00962519 0.00962295 0.00962301 0.00962307 0.00962335 0.00962487 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# Fishery_historical 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00205618 0.00149144 0.00249249 0.00140395 0.000488557 0.000218525 0.00031143 0.000437317 0.000559396 0.000845376 0.000913738 0.000853503 0.000712633 0.0011063 0.00302127 0.00100751 0.00197533 0.00110138 0.00124499 0.000933163 0.00113672 0.000958165 0.00240805 0.00187726 0.00207792 0.00196576 0.0012315 0.00138895 0.00184235 0.00267719 0.00178562 0.000691294 0.000529591 0.000873079 0.00102323 0.000682477 0.00102665 0.00128301 0.00159667 0.00367526 0.00485718 0.0014101 0.00395293 0.00243846 0.00195005 0.000813263 0.00163114 0.000939874 0.00106648 0.000658647 0.000628594 0.000864426 0.00110538 0.000896729 0.00124701 0.00125963 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# Fishery_tribal 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.48597e-05 2.98255e-05 0 2.48398e-06 2.484e-06 0 1.49045e-05 2.48448e-06 2.47743e-06 2.47155e-06 4.96979e-06 4.9853e-06 9.95018e-06 7.47042e-06 9.96015e-06 0.000119191 0.000134056 0.000114288 0.00038964 0.00061785 0.000493457 7.92582e-05 0.000432568 0.000307562 0.000647158 0.00101726 0.000214388 0.000695183 0.0018625 0.00189297 0.00146463 0.000742138 0.00132458 0.00132367 0.0096527 0.0095533 0.00946494 0.00937659 0.00928824 0.00919988 0.00912257 0.00903422 0.00894586 0.00886855
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         5         1         0         1         0         0  #  WCGBTS
         6         1         0         1         0         0  #  Triennial
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            -2             2             0        -0.355         0.326             6          1          0          0          0          0          0          0          0  #  LnQ_base_WCGBTS(5)
             0             2           0.1          0.01            99             0          1          0          0          0          0          0          0          0  #  Q_extraSD_WCGBTS(5)
           -10             2             0             0            99             0          1          0          0          0          0          0          1          2  #  LnQ_base_Triennial(6)
             0             2           0.1          0.01            99             0          1          0          0          0          0          0          0          0  #  Q_extraSD_Triennial(6)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
            -7             0             0             0            99             0      1  # LnQ_base_Triennial(6)_BLK1repl_1995
# info on dev vectors created for Q parms are reported with other devs after tag parameter section 
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
 24 2 4 0 # 1 Fishery_current
 15 0 0 1 # 2 Discard_historical
 15 0 0 1 # 3 Fishery_historical
 15 0 0 1 # 4 Fishery_tribal
 24 0 4 0 # 5 WCGBTS
 24 0 4 0 # 6 Triennial
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
 0 0 0 0 # 1 Fishery_current
 0 0 0 0 # 2 Discard_historical
 0 0 0 0 # 3 Fishery_historical
 0 0 0 0 # 4 Fishery_tribal
 0 0 0 0 # 5 WCGBTS
 0 0 0 0 # 6 Triennial
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Fishery_current LenSelex
            80           150       80.0095            85            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Fishery_current(1)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Fishery_current(1)
            -1             9        7.0738           5.8            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Fishery_current(1)
            -1            20            20           6.7            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Fishery_current(1)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Fishery_current(1)
          -999             9          -999          -999            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Fishery_current(1)
            15           150       66.7519            67            99             0          2          0          0          0          0          0          0          0  #  Retain_L_infl_Fishery_current(1)
           0.1            10       5.61124             8            99             0          2          0          0          0          0          0          0          0  #  Retain_L_width_Fishery_current(1)
           -10            20     0.0729519            10            99             0          3          0          0          0          0          0          2          2  #  Retain_L_asymptote_logit_Fishery_current(1)
             0             0             0             0            99             0         -3          0          0          0          0          0          0          0  #  Retain_L_maleoffset_Fishery_current(1)
             5            15             5             5            99             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_infl_Fishery_current(1)
         0.001            10             0             0            99             0         -4          0          0          0          0          0          0          0  #  DiscMort_L_width_Fishery_current(1)
             0             1           0.5           0.5            99             0         -5          0          0          0          0          0          0          0  #  DiscMort_L_level_old_Fishery_current(1)
             0             0             0             0            99             0         -5          0          0          0          0          0          0          0  #  DiscMort_L_male_offset_Fishery_current(1)
           -50            50             0             0            99             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_Fishery_current(1)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_Fishery_current(1)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_Fishery_current(1)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_Fishery_current(1)
           0.5           1.5             1             1            99             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_Fishery_current(1)
# 2   Discard_historical LenSelex
# 3   Fishery_historical LenSelex
# 4   Fishery_tribal LenSelex
# 5   WCGBTS LenSelex
            50           150       61.7687            85            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_WCGBTS(5)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_WCGBTS(5)
            -1             9       6.15752           5.8            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_WCGBTS(5)
            -1            20       9.56599           6.7            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_WCGBTS(5)
          -999             9            -5          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_WCGBTS(5)
          -999             9          -999          -999            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_WCGBTS(5)
           -50            50             0             0            99             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_WCGBTS(5)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_WCGBTS(5)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_WCGBTS(5)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_WCGBTS(5)
           0.5           1.5             1             1            99             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_WCGBTS(5)
# 6   Triennial LenSelex
            50           200       176.434            75            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Triennial(6)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Triennial(6)
            -1             9       8.93782             9            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Triennial(6)
            -1            20            20           7.2            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Triennial(6)
           -15             9            -5            -5            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Triennial(6)
          -999             9          -999          -999            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Triennial(6)
           -50            50             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Peak_Triennial(6)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Ascend_Triennial(6)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Descend_Triennial(6)
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0  #  SzSel_Fem_Final_Triennial(6)
           0.5           1.5             1             1            99             0          4          0          0          0          0          0          0          0  #  SzSel_Fem_Scale_Triennial(6)
# 1   Fishery_current AgeSelex
# 2   Discard_historical AgeSelex
# 3   Fishery_historical AgeSelex
# 4   Fishery_tribal AgeSelex
# 5   WCGBTS AgeSelex
# 6   Triennial AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
           -10            20       1.37269           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2005
           -10            20       1.37269           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2006
           -10            20       1.37269           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2007
           -10            20       1.37269           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2008
           -10            20       1.58009           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2009
           -10            20       7.91782           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2010
           -10            20       9.77089           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2011
           -10            20       9.27732           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2012
           -10            20       3.83195           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2013
           -10            20       4.29056           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2014
           -10            20       3.67212           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2015
           -10            20       2.84151           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2016
           -10            20       3.20117           0.6            99             0      4  # Retain_L_asymptote_logit_Fishery_current(1)_BLK2repl_2017
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
#      3     3     1     1     2     0     0     0     0     0     0     0
#      5     9     2     2     2     0     0     0     0     0     0     0
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
      4      1  0.239885
      4      5   0.06742
      4      6         1
      5      1  0.084412
      5      5  0.053605
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 1 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 7 5 1 0 99
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_discard:_1
#  0 #_discard:_2
#  0 #_discard:_3
#  0 #_discard:_4
#  0 #_discard:_5
#  0 #_discard:_6
#  1 #_meanbodywt:1
#  1 #_meanbodywt:2
#  1 #_meanbodywt:3
#  1 #_meanbodywt:4
#  1 #_meanbodywt:5
#  1 #_meanbodywt:6
#  1 #_lencomp:_1
#  0 #_lencomp:_2
#  0 #_lencomp:_3
#  0 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_agecomp:_1
#  0 #_agecomp:_2
#  0 #_agecomp:_3
#  0 #_agecomp:_4
#  1 #_agecomp:_5
#  0 #_agecomp:_6
#  0 #_size-age:_1
#  0 #_size-age:_2
#  0 #_size-age:_3
#  0 #_size-age:_4
#  0 #_size-age:_5
#  0 #_size-age:_6
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
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

