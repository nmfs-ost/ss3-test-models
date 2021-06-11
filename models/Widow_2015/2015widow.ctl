#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_data_and_control_files: 2015widow.dat // 2015widow.ctl
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
8 #_Nblock_Patterns
 3 2 1 1 1 1 3 1 #_blocks_per_pattern 
# begin and end years of blocks
 1982 1989 1990 1997 1998 2010
 1982 1989 1990 2010
 1916 1982
 1916 2001
 1916 2002
 1995 2012
 1916 1982 1983 2001 2002 2010
 1915 1915
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
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
3 #_Age(post-settlement)_for_L1;linear growth below this
40 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
2 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.3 0.0809257 -2.51 0.52 3 5 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 40 27.4948 27 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 35 60 50.0042 50 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.4 0.150077 0.15 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.4 0.0705642 0.07 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.4 0.041775 0.04 99 0 3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 1.736e-05 0 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 -3 10 2.962 2.962 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 -3 50 5.47 7 99 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.7747 -1 99 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -1 1 1 1 99 0 -99 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 0 1 0 0 99 0 -99 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.01 0.3 0.081052 -2.51 0.52 3 5 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 10 40 26.0012 27 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 35 60 44.0029 45 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.01 0.4 0.210064 0.19 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 0.01 0.4 0.0701206 0.07 99 0 3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.01 0.4 0.0401227 0.04 99 0 3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -3 3 1.484e-05 0 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 -3 10 3.005 3.005 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 2 1 1 99 0 -99 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 99 0 -99 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 99 0 -99 0 0 0 0 0 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0 2 1 1 99 0 -99 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
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
             1            20       11.0006            10            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.798         0.798         0.132             2         -5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.6          0.65            99             0        -50          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0        -99          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0            99             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1970 # first year of main recr_devs; early devs can preceed this era
2010 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1900 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1962 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1976 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2010 #_last_yr_fullbias_adj_in_MPD
 2013 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.9 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011F 2012F 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.05 # F ballpark value in units of annual_F
-1982 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# BottomTrawl 9.87265e-06 1.53368e-05 1.78889e-05 1.24281e-05 1.26849e-05 1.04872e-05 9.02184e-06 9.78765e-06 5.77104e-06 4.87839e-06 1.38386e-05 1.87192e-05 2.647e-05 3.72522e-05 3.3172e-05 3.25218e-05 3.53e-05 5.50837e-05 4.89599e-05 4.74787e-05 4.01583e-05 5.72667e-05 5.30894e-05 6.65267e-05 0.000120112 0.000149341 0.000212859 0.000748153 0.00147151 0.00248453 0.00174597 0.000885063 0.00070187 0.000530185 0.000577915 0.000810884 0.000806076 0.000732667 0.000686053 0.000718547 0.000899801 0.00116416 0.00107159 0.00103641 0.00127241 0.00106796 0.00119769 0.000667919 0.000950124 0.000385726 0.00093635 0.00144166 0.000675942 0.000772599 0.000474835 0.000625718 0.000792218 0.000801043 0.000735677 0.000756869 0.000943673 0.00156904 0.00207504 0.00539741 0.0104306 0.00902291 0.0163064 0.0235369 0.0119106 0.00974262 0.0139105 0.0164997 0.0166467 0.0191814 0.0259537 0.0194349 0.0217458 0.0290681 0.0199288 0.0216263 0.0191805 0.0203274 0.0136508 0.00870661 0.000303864 0.000207886 9.13311e-05 1.84906e-05 4.20795e-05 1.54401e-05 2.89953e-05 2.27263e-05 9.96204e-06 1.90654e-05 2.11564e-05 4.53589e-05 0.000100577 0.000123488 0.000169662 0.00046069 0.000456121 0.000450908 0.000445214 0.000439327 0.000433488 0.000427837 0.000422444 0.000417342 0.000412542 0.000408044 0.000403843
# MidwaterTrawl 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0150904 0.0405384 0.062305 0.0610668 0.0113318 0.0223914 0.021237 0.0196494 0.0306261 0.0238043 0.0308617 0.0181872 0.00872581 0.00634089 0.00984972 0.00961936 0.0102254 0.00837722 0.0111495 0.00406099 0.00938074 0.0166576 0.00761078 0.00111182 4.17472e-05 0.000121066 0.000135093 5.18103e-05 6.12062e-06 0.000163359 0.000138838 0.00020485 0.000112848 0.000120078 0.0006033 0.000758256 0.00206026 0.0020424 0.00202141 0.00199706 0.00197065 0.00194382 0.00191763 0.00189257 0.00186887 0.00184658 0.00182573 0.00180626
# Hake 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0064203 0.00686997 0.00346917 0.000637151 0.000987158 0.00125114 0.000753293 0.00117699 0.000752719 0.000707031 0.00130419 0.000217795 0.000352101 0.000365631 0.000515112 0.000455814 0.000338784 0.000305281 0.000706576 0.000450686 0.000649126 0.000469965 0.00062261 0.00058544 0.00065816 0.00165344 0.00134258 0.000827846 0.00187257 0.00143499 0.00261313 0.00118877 0.00194502 0.00121468 0.000902045 0.000677032 0.000486583 8.04801e-05 0.000143669 0.000447503 0.00053564 0.000620699 0.000581411 0.000354852 0.000274296 0.000380126 0.000454357 0.000436037 0.000835656 0.00229265 0.00227168 0.0022478 0.00222099 0.00219229 0.00216303 0.00213427 0.00210661 0.00208036 0.00205565 0.0020325 0.00201088
# Net 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.10164e-05 8.19761e-05 0.000650187 0.000778704 0.00144585 0.00126623 0.0015155 0.000593364 0.000700546 0.00117573 0.000690583 0.000135107 0.000154957 0.000178687 0.000177817 5.02877e-05 5.13458e-05 0.000154134 3.15546e-05 2.11261e-05 2.17721e-05 6.08369e-08 1.21772e-06 0 3.68259e-07 0 7.90932e-06 0 5.50616e-07 0 0 0 0 7.32754e-08 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12
# HnL 0.000338906 0.000527548 0.000605908 0.000418254 0.000428292 0.000355298 0.000308753 0.000339495 0.000219645 0.000278666 0.000404869 0.000314727 0.000342981 0.000298732 0.00043146 0.000374792 0.000367488 0.000242036 0.000283961 0.000322313 0.000403069 0.000318943 0.000238462 0.00016456 0.000213985 0.000169521 6.2596e-05 0.000103358 0.00018584 0.000321061 0.000336374 0.000436818 0.000194176 0.000211702 0.000305186 0.000236524 0.000192533 6.68707e-05 0.000103518 8.89575e-05 0.000200587 0.000181265 0.000175525 0.000137821 0.000105609 7.39032e-05 7.56625e-05 9.55927e-05 6.2822e-05 9.94624e-05 0.000181191 0.000159359 9.75767e-05 9.7468e-05 4.81281e-05 5.88027e-05 9.85119e-05 8.9296e-05 0.000217559 0.000147194 0.00020493 0.000200835 0.000796842 0.00051367 0.000303013 0.000383742 0.00108259 0.000172539 0.000141599 0.000150135 0.000477104 0.000326887 0.000457171 0.000291691 0.000910293 0.00067059 0.00126192 0.000797651 0.000614128 0.000200967 0.000253429 0.000297911 0.000687586 0.000347105 0.000114457 5.68206e-05 4.40824e-06 2.55629e-06 9.44039e-07 3.63454e-06 2.56874e-06 5.52723e-06 3.5166e-06 1.1345e-06 4.08605e-07 3.22135e-07 8.739e-07 2.56278e-06 4.75521e-06 4.59296e-06 4.54548e-06 4.49179e-06 4.43414e-06 4.37545e-06 4.31775e-06 4.26211e-06 4.20908e-06 4.15891e-06 4.11169e-06 4.06743e-06 4.02608e-06
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         1         0         1  #  BottomTrawl
         3         1         0         1         1         0  #  Hake
         6         1         0         1         0         1  #  JuvSurvey
         7         1         0         1         1         0  #  Triennial
         8         1         0         1         0         1  #  NWFSC
         9         1         0         1         0         1  #  ForeignAtSea
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -25            25       -7.6649             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_BottomTrawl(1)
             0             2         0.002             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_BottomTrawl(1)
           -20             2      -10.0003             0            99             0          1          0          1       1983       1998         99          0          0  #  LnQ_base_Hake(3)
             0             2         0.002             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Hake(3)
           -25            25       -8.2418             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_JuvSurvey(6)
             0             2         0.002             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_JuvSurvey(6)
            -4             4             0             0            99             0        -50          0          1       1980       2004         99          0          0  #  LnQ_base_Triennial(7)
             0             2             0             0            99             0         -2          0          0          0          0          0          0          0  #  Q_extraSD_Triennial(7)
           -25            25      -3.39258             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC(8)
             0             2             0             0            99             0         -2          0          0          0          0          0          0          0  #  Q_extraSD_NWFSC(8)
           -25            25       -13.246             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ForeignAtSea(9)
             0             2    0.00167016             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_ForeignAtSea(9)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_Hake(3)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_Hake(3)_dev_autocorr
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_Triennial(7)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_Triennial(7)_dev_autocorr
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
 24 1 0 0 # 1 BottomTrawl
 24 1 0 0 # 2 MidwaterTrawl
 24 0 0 0 # 3 Hake
 24 0 0 0 # 4 Net
 24 1 0 0 # 5 HnL
 0 0 0 0 # 6 JuvSurvey
 27 0 0 3 # 7 Triennial
 27 0 0 3 # 8 NWFSC
 5 0 0 3 # 9 ForeignAtSea
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
 10 0 0 0 # 1 BottomTrawl
 10 0 0 0 # 2 MidwaterTrawl
 10 0 0 0 # 3 Hake
 10 0 0 0 # 4 Net
 10 0 0 0 # 5 HnL
 11 0 0 0 # 6 JuvSurvey
 10 0 0 0 # 7 Triennial
 11 0 0 0 # 8 NWFSC
 10 0 0 0 # 9 ForeignAtSea
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   BottomTrawl LenSelex
            10            59        37.995            45          0.05             0          1          0          0          0          0        0.5          4          2  #  Size_DblN_peak_BottomTrawl(1)
            -5            10        2.4987             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_BottomTrawl(1)
            -4            12       3.99818             3          0.05             0          2          0          0          0          0        0.5          4          2  #  Size_DblN_ascend_se_BottomTrawl(1)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_BottomTrawl(1)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_BottomTrawl(1)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_BottomTrawl(1)
            -5            60      -2.93525             0            99             0          4          0          0          0          0          0          2          2  #  Retain_L_infl_BottomTrawl(1)
          0.01             8       1.20169             1            99             0          4          0          0          0          0          0          2          2  #  Retain_L_width_BottomTrawl(1)
           -10            10       4.59512            10            99             0         -2          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_BottomTrawl(1)
           -10            10             0             0            99             0        -99          0          0          0          0          0          0          0  #  Retain_L_maleoffset_BottomTrawl(1)
# 2   MidwaterTrawl LenSelex
            10            59       37.9964            45          0.05             0          1          0          0          0          0        0.5          7          2  #  Size_DblN_peak_MidwaterTrawl(2)
           -10            10    0.00388996             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_MidwaterTrawl(2)
            -4            12       2.99998             3          0.05             0          2          0          0          0          0        0.5          7          2  #  Size_DblN_ascend_se_MidwaterTrawl(2)
            -2            10       8.99092            10          0.05             0          4          0          0          0          0        0.5          7          2  #  Size_DblN_descend_se_MidwaterTrawl(2)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_MidwaterTrawl(2)
            -9             9        7.9441           0.5          0.05             0          4          0          0          0          0        0.5          7          2  #  Size_DblN_end_logit_MidwaterTrawl(2)
            -5            60            -5             0            99             0         -9          0          0          0          0          0          0          0  #  Retain_L_infl_MidwaterTrawl(2)
          0.01             8           1.2             1            99             0         -9          0          0          0          0          0          0          0  #  Retain_L_width_MidwaterTrawl(2)
           -10            10       4.59512            10            99             0         -2          0          0          0          0          0          7          2  #  Retain_L_asymptote_logit_MidwaterTrawl(2)
           -10            10             0             0            99             0        -99          0          0          0          0          0          0          0  #  Retain_L_maleoffset_MidwaterTrawl(2)
# 3   Hake LenSelex
            10            59       39.9992            45          0.05             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Hake(3)
            -5            10       2.50126             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Hake(3)
            -4            12       4.00279             3          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Hake(3)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Hake(3)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Hake(3)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Hake(3)
# 4   Net LenSelex
            10            59       40.0001            45          0.05             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Net(4)
            -5            10       2.49866             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Net(4)
            -4            12       4.00148             3          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Net(4)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Net(4)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Net(4)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Net(4)
# 5   HnL LenSelex
            10            59       37.0083            45          0.05             0          1          0          0          0          0        0.5          5          2  #  Size_DblN_peak_HnL(5)
            -5            10        2.5005             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_HnL(5)
            -5            12       4.00069             3          0.05             0          2          0          0          0          0        0.5          5          2  #  Size_DblN_ascend_se_HnL(5)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_HnL(5)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_HnL(5)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_HnL(5)
            -5            60       25.0099             0            99             0          2          0          0          0          0          0          3          2  #  Retain_L_infl_HnL(5)
          0.01             8      0.991006             1            99             0          3          0          0          0          0          0          3          2  #  Retain_L_width_HnL(5)
           -10            10       2.19741            10            99             0          1          0          0          0          0          0          3          2  #  Retain_L_asymptote_logit_HnL(5)
           -10            10             0             0            99             0        -99          0          0          0          0          0          0          0  #  Retain_L_maleoffset_HnL(5)
# 6   JuvSurvey LenSelex
# 7   Triennial LenSelex
             0             2             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_Triennial(7)
        -0.001             1      0.148975             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_Triennial(7)
            -1             1    -0.0300079             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_Triennial(7)
             8            56            24           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_1_Triennial(7)
             8            56            34           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_2_Triennial(7)
             8            56            48           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_3_Triennial(7)
           -10            10      -3.00454           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_1_Triennial(7)
           -10            10            -1           -10            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Val_2_Triennial(7)
           -10            10    0.00205177           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_3_Triennial(7)
# 8   NWFSC LenSelex
             0             2             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_NWFSC(8)
        -0.001             1      0.150832             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_NWFSC(8)
            -1             1    -0.0302647             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_NWFSC(8)
             8            56            24           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_1_NWFSC(8)
             8            56            34           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_2_NWFSC(8)
             8            56            48           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_3_NWFSC(8)
           -10            10      -2.99769           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_1_NWFSC(8)
           -10            10            -1           -10            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Val_2_NWFSC(8)
           -10            10    0.00335515           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_3_NWFSC(8)
# 9   ForeignAtSea LenSelex
            -2            60             1             0           0.2             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_ForeignAtSea(9)
            -2            60            -1             0           0.2             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_ForeignAtSea(9)
# 1   BottomTrawl AgeSelex
# 2   MidwaterTrawl AgeSelex
# 3   Hake AgeSelex
# 4   Net AgeSelex
# 5   HnL AgeSelex
# 6   JuvSurvey AgeSelex
             0             1             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_JuvSurvey(6)
             0             1             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_JuvSurvey(6)
# 7   Triennial AgeSelex
# 8   NWFSC AgeSelex
             0             1             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWFSC(8)
             0            50            40             0            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWFSC(8)
# 9   ForeignAtSea AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            10            59       34.0094            45          0.05             0      1  # Size_DblN_peak_BottomTrawl(1)_BLK4repl_1916
            -4            12       5.70289             3          0.05             0      2  # Size_DblN_ascend_se_BottomTrawl(1)_BLK4repl_1916
            -5            50       34.9849            34            99             0      3  # Retain_L_infl_BottomTrawl(1)_BLK2repl_1982
            -5            50       35.0169            34            99             0      3  # Retain_L_infl_BottomTrawl(1)_BLK2repl_1990
          0.01             5       2.50005             1            99             0      3  # Retain_L_width_BottomTrawl(1)_BLK2repl_1982
          0.01             5       2.49935             1            99             0      3  # Retain_L_width_BottomTrawl(1)_BLK2repl_1990
           0.2             1      0.799616             1            99             0      2  # Retain_L_asymptote_logit_BottomTrawl(1)_BLK1repl_1982
           0.2             1      0.500116             1            99             0      2  # Retain_L_asymptote_logit_BottomTrawl(1)_BLK1repl_1990
           0.2             1      0.499821             1            99             0      2  # Retain_L_asymptote_logit_BottomTrawl(1)_BLK1repl_1998
            10            59       38.0042            45          0.05             0      1  # Size_DblN_peak_MidwaterTrawl(2)_BLK7repl_1916
            10            59       37.9976            45          0.05             0      1  # Size_DblN_peak_MidwaterTrawl(2)_BLK7repl_1983
            10            59       38.0034            45          0.05             0      1  # Size_DblN_peak_MidwaterTrawl(2)_BLK7repl_2002
            -4            12       3.00242             3          0.05             0      2  # Size_DblN_ascend_se_MidwaterTrawl(2)_BLK7repl_1916
            -4            12        2.9987             3          0.05             0      2  # Size_DblN_ascend_se_MidwaterTrawl(2)_BLK7repl_1983
            -4            12       3.00111             3          0.05             0      2  # Size_DblN_ascend_se_MidwaterTrawl(2)_BLK7repl_2002
            -2            10       9.01133            10          0.05             0      4  # Size_DblN_descend_se_MidwaterTrawl(2)_BLK7repl_1916
            -2            10       9.00781            10          0.05             0      4  # Size_DblN_descend_se_MidwaterTrawl(2)_BLK7repl_1983
            -2            10       8.98781            10          0.05             0      4  # Size_DblN_descend_se_MidwaterTrawl(2)_BLK7repl_2002
            -9             9       7.88418           0.5          0.05             0      4  # Size_DblN_end_logit_MidwaterTrawl(2)_BLK7repl_1916
            -9             9       7.91362           0.5          0.05             0      4  # Size_DblN_end_logit_MidwaterTrawl(2)_BLK7repl_1983
            -9             9       7.91958           0.5          0.05             0      4  # Size_DblN_end_logit_MidwaterTrawl(2)_BLK7repl_2002
           0.2             1          0.99             1            99             0      -2  # Retain_L_asymptote_logit_MidwaterTrawl(2)_BLK7repl_1916
           0.2             1      0.799699             1            99             0      2  # Retain_L_asymptote_logit_MidwaterTrawl(2)_BLK7repl_1983
           0.2             1      0.800283             1            99             0      2  # Retain_L_asymptote_logit_MidwaterTrawl(2)_BLK7repl_2002
            15            59       48.0017            45          0.05             0      1  # Size_DblN_peak_HnL(5)_BLK5repl_1916
            -4            12       2.80146             3          0.05             0      2  # Size_DblN_ascend_se_HnL(5)_BLK5repl_1916
            -5            50            -5            34            99             0      -2  # Retain_L_infl_HnL(5)_BLK3repl_1916
           0.1             8           1.2             1            99             0      -3  # Retain_L_width_HnL(5)_BLK3repl_1916
           0.2             1          0.99             1            99             0      -3  # Retain_L_asymptote_logit_HnL(5)_BLK3repl_1916
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
#      3     3     1     0     0     0     0     1     1  1983  1998    99      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      3     7     3     0     0     0     0     2     1  1980  2004    99      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     5     4     2     0     0     0     0     0     0     0
#      5     3     6     4     2     0     0     0     0     0     0     0
#      5     7     7     2     2     0     0     0     0     0     0     0
#      5     8     9     2     2     0     0     0     0     0     0     0
#      5     9    11     1     2     0     0     0     0     0     0     0
#      5    11    14     7     2     0     0     0     0     0     0     0
#      5    13    17     7     2     0     0     0     0     0     0     0
#      5    14    20     7     2     0     0     0     0     0     0     0
#      5    16    23     7     2     0     0     0     0     0     0     0
#      5    19    26     7     2     0     0     0     0     0     0     0
#      5    33    29     5     2     0     0     0     0     0     0     0
#      5    35    30     5     2     0     0     0     0     0     0     0
#      5    39    31     3     2     0     0     0     0     0     0     0
#      5    40    32     3     2     0     0     0     0     0     0     0
#      5    41    33     3     2     0     0     0     0     0     0     0
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
# read 13 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 4 1 1 0.035 1
 4 2 1 0.13 1
 4 3 1 0.06 1
 4 4 1 0.23 1
 4 5 1 0.2 1
 4 7 1 0.38 1
 4 8 1 0.73 1
 5 1 1 0.08 1
 5 2 1 0.16 1
 5 3 1 0.11 1
 5 4 1 0.23 1
 5 5 1 0.31 1
 5 8 1 0.33 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_CPUE/survey:_9
#  1 #_discard:_1
#  1 #_discard:_2
#  0 #_discard:_3
#  0 #_discard:_4
#  1 #_discard:_5
#  0 #_discard:_6
#  0 #_discard:_7
#  0 #_discard:_8
#  0 #_discard:_9
#  0.035 #_lencomp:_1
#  0.13 #_lencomp:_2
#  0.06 #_lencomp:_3
#  0.23 #_lencomp:_4
#  0.2 #_lencomp:_5
#  0 #_lencomp:_6
#  0.38 #_lencomp:_7
#  0.73 #_lencomp:_8
#  0 #_lencomp:_9
#  0.08 #_agecomp:_1
#  0.16 #_agecomp:_2
#  0.11 #_agecomp:_3
#  0.23 #_agecomp:_4
#  0.31 #_agecomp:_5
#  0 #_agecomp:_6
#  0 #_agecomp:_7
#  0.33 #_agecomp:_8
#  0 #_agecomp:_9
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_init_equ_catch7
#  1 #_init_equ_catch8
#  1 #_init_equ_catch9
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

