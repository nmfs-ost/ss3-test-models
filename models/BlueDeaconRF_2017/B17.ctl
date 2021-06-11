#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_data_and_control_files: B17.dat // B17.ctl
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
 1 7 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
 2 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1899 2000 1971 2014
 1899 2000
 1899 2014
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 0 0 0 0 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
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
1 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
0.16 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.001 0.4 0.1588 -1.8399 0.438 3 -2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 30 16 16 1000 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 25 45 38 38 1000 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.21 0.21 1000 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.5 0.1 0.1 1000 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.1 0.1 1000 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 2.67e-05 2.67e-05 2.67e-05 2.67e-05 1000 0 -2 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 1 3 2.9 2.9 1000 0 -2 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 22 32 28.8 28.8 1000 0 -2 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -1.2 -0.98 -0.98 -0.6 1000 0 -2 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 1 1.143e-08 1.143e-08 1000 0 -2 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 2 5 4.816 4.816 1000 0 -2 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 0.159 -0.09 1000 0 -2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0 -0.134 1000 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.236 -0.236 1000 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.644 0.644 1000 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 1000 0 -2 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -3 3 0.8 0 1000 0 -2 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 2.67e-05 2.67e-05 2.67e-05 2.67e-05 1000 0 -2 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 1 3 2.9 2.9 1000 0 -2 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 # RecrDist_month_7
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.001 0.999 0.5 0.5 1000 0 -1 0 0 0 0 0 0 0 # FracFemale_GP_1
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
             5            12             9            10            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
         0.201         0.999         0.718         0.718         0.158             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
           0.1             1           0.5           0.5          1000             0         -1          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0          1000             0         -1          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0          1000             0         -1          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1980 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1970 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4 #_recdev_early_phase
 -1 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1984 #_last_yr_nobias_adj_in_MPD; begin of ramp
 2001 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2010 #_last_yr_fullbias_adj_in_MPD
 2029 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.8 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978E 1979E 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.5 # F ballpark value in units of annual_F
-2002 # F ballpark year (neg value to disable)
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
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# COM_L 1.84364e-05 1.84367e-05 1.84369e-05 5.02829e-06 8.38048e-07 8.38044e-07 8.38041e-07 8.38038e-07 1.67607e-06 1.67607e-06 2.5141e-06 2.5141e-06 3.35213e-06 3.35213e-06 4.19016e-06 5.0282e-06 5.02821e-06 5.86625e-06 5.86626e-06 6.70432e-06 6.70433e-06 7.54239e-06 7.54241e-06 8.38051e-06 8.38058e-06 9.21873e-06 9.21881e-06 1.0057e-05 1.00571e-05 1.08953e-05 1.17334e-05 1.17335e-05 1.25717e-05 1.25718e-05 1.341e-05 1.341e-05 2.26297e-05 4.35841e-05 4.44236e-05 3.3528e-05 9.22025e-06 1.59258e-05 1.6764e-05 1.42493e-05 3.93956e-05 5.78377e-05 6.03546e-05 4.69438e-05 7.88013e-05 8.63504e-05 0.000119054 0.000278391 0.000131667 8.21905e-05 0.000105676 8.55491e-05 0.000278481 0.000265106 0.000119141 0.000185431 0.00021062 0.000102377 0.000804987 0.000767654 0.00186894 0.0009232 0.000173389 0.000203647 0.000578097 0.000456954 0.000446016 0.000206155 0.000668954 0.000329027 0.00027598 0.000382806 0.00028519 0.000367608 0.000223741 0.000295213 0.00026494 0.000281786 0.000331476 0.000166612 0.000208727 0.000584353 0.000350464 0.000752802 0.000493636 0.000431639 0.000840326 0.00165673 0.00112304 0.00108885 0.000863223 0.0010918 0.000619433 0.00103363 0.0017889 0.00177467 0.00433381 0.00262698 0.00193023 0.00126492 0.000715931 0.000300833 0.00117528 0.00027682 0.000524142 0.000465736 0.000356172 0.000513858 0.000533387 0.000472173 0.000428548 0.000391575 0.000252763 0.000263755 0.000375063 0.000612805 0.000638996 0.000482467 0.000372692 0.000141985 0.000193908 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234 0.00816234
# COM_D 2.9283e-06 2.92834e-06 2.92837e-06 5.85678e-07 0 0 0 0 0 5.85669e-07 5.85668e-07 5.85668e-07 5.85668e-07 5.85668e-07 5.85668e-07 5.85669e-07 1.17134e-06 1.17134e-06 1.17134e-06 1.17134e-06 1.17135e-06 1.17135e-06 1.17135e-06 1.17136e-06 1.75705e-06 1.75707e-06 1.75708e-06 1.75709e-06 1.75711e-06 1.75712e-06 1.75713e-06 1.75714e-06 2.34286e-06 2.34287e-06 2.34288e-06 2.3429e-06 4.1001e-06 7.61462e-06 7.61482e-06 5.85766e-06 1.7573e-06 2.92882e-06 2.92882e-06 2.34305e-06 7.0292e-06 9.95828e-06 1.05444e-05 8.20138e-06 1.34741e-05 1.52322e-05 2.0506e-05 4.80485e-05 2.28549e-05 1.4065e-05 1.81675e-05 1.46515e-05 4.80609e-05 4.57231e-05 2.05182e-05 3.2244e-05 3.63502e-05 1.75893e-05 0.000138991 0.000132604 0.000322395 0.000159271 2.99759e-05 3.52582e-05 9.98944e-05 7.87452e-05 7.69827e-05 3.5256e-05 0.000115171 5.70007e-05 4.75937e-05 6.63916e-05 4.93501e-05 6.34464e-05 3.87699e-05 5.11027e-05 4.58174e-05 4.87586e-05 5.69925e-05 2.87949e-05 3.58528e-05 0.000100543 6.05886e-05 0.000130071 8.48228e-05 7.42851e-05 0.00014513 0.00028587 0.000193457 0.000187739 0.000148681 0.000188401 0.0001067 0.000178032 0.00030875 0.000306769 0.000748918 0.000454537 0.000333774 0.000218671 0.000124156 5.22475e-05 0.000203502 4.79031e-05 9.06558e-05 8.04317e-05 6.18615e-05 8.94005e-05 9.2362e-05 8.19172e-05 7.45458e-05 6.76987e-05 4.39755e-05 4.53892e-05 6.50111e-05 0.000105594 0.000110435 8.31639e-05 6.42491e-05 2.42716e-05 3.34538e-05 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082 0.0014082
# REC_O_L 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.44373e-05 0.000148878 0.000223985 0.000298483 0.000373009 0.000447562 0.000522903 0.000597707 0.000672647 0.00128155 0.00120412 0.000675002 0.00148448 0.00191166 0.00104344 0.000293247 0.000440216 0.000467781 0.000769582 0.00138917 0.000979304 0.00155813 0.00447429 0.000517819 0.00143159 0.00178389 0.00404452 0.00398059 0.00253498 0.00241049 0.00229524 0.00106523 0.00161872 0.00133546 0.00218963 0.000814625 0.00114674 0.00107782 0.00109087 0.00151556 0.00146738 0.00180825 0.00166389 0.00130872 0.00202827 0.00144355 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647 0.0607647
# REC_O_D 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.11054e-05 2.09896e-05 1.97675e-05 1.11238e-05 2.47386e-05 3.21971e-05 1.73473e-05 4.95577e-06 7.43452e-06 7.44159e-06 1.24276e-05 2.36958e-05 1.62838e-05 2.64514e-05 7.48528e-05 8.93296e-06 2.43548e-05 2.96275e-05 6.73764e-05 6.65363e-05 4.20099e-05 4.09222e-05 6.50439e-05 1.06741e-05 3.08447e-05 3.10027e-05 0.000102938 4.07877e-05 7.63385e-05 9.28996e-05 0.000128647 0.000108302 0.000104363 9.76496e-05 0.000107389 8.53509e-05 0.000231053 9.74721e-05 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297 0.00410297
# REC_S 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.5932e-06 7.87717e-06 7.87723e-06 7.87729e-06 9.30959e-06 1.00258e-05 6.44518e-06 5.72907e-06 6.44523e-06 7.87753e-06 7.87757e-06 7.87761e-06 7.87764e-06 8.59385e-06 8.59401e-06 8.5942e-06 7.87815e-06 6.44576e-06 5.72953e-06 7.1619e-06 7.87807e-06 8.59432e-06 9.31072e-06 1.00272e-05 1.00274e-05 1.07439e-05 1.21769e-05 1.21775e-05 1.36116e-05 1.28965e-05 1.43297e-05 1.79123e-05 2.07786e-05 2.29298e-05 2.36495e-05 2.36508e-05 2.65183e-05 2.86701e-05 2.86707e-05 3.01112e-05 2.94071e-05 3.01474e-05 3.16054e-05 3.0888e-05 3.0881e-05 3.15976e-05 3.23173e-05 3.30354e-05 3.51868e-05 3.66233e-05 3.80613e-05 3.94939e-05 3.94915e-05 3.66175e-05 3.94874e-05 4.23565e-05 4.30723e-05 4.7381e-05 5.09749e-05 5.17012e-05 5.31459e-05 5.17177e-05 5.10171e-05 5.53511e-05 5.75359e-05 5.82991e-05 0.000133978 6.05418e-05 4.47315e-05 3.39593e-05 5.78552e-06 8.1007e-05 0.000112856 9.41147e-05 3.33492e-05 6.83376e-05 6.93121e-05 6.96548e-05 0.000135836 4.45391e-06 0.000224329 9.35696e-05 4.59044e-05 2.49948e-05 0.000223244 6.28018e-05 8.69985e-05 3.63583e-05 4.27452e-05 3.90433e-06 0.000170244 8.34959e-05 8.45456e-05 8.55735e-05 8.65728e-05 8.6774e-05 8.77721e-05 8.87639e-05 8.97138e-05 8.97755e-05 9.05815e-05 9.13248e-05 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421 0.00384421
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         6         1         0         1         0         1  #  Logbook
         7         1         0         1         0         1  #  Onboard
         8         1         0         1         0         1  #  Dock_ORBS
         9         1         0         1         0         1  #  Dock_MRFSS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -9.32626             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Logbook(6)
             0          0.75          0.05          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Logbook(6)
           -15            15      -9.91369             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Onboard(7)
             0          0.75          0.05          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Onboard(7)
           -15            15      -11.8987             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Dock_ORBS(8)
             0          0.75          0.05          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Dock_ORBS(8)
           -15            15      -9.68588             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Dock_MRFSS(9)
             0          0.75          0.05          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Dock_MRFSS(9)
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
 24 0 0 0 # 1 COM_L
 24 0 0 0 # 2 COM_D
 24 0 0 0 # 3 REC_O_L
 24 0 0 0 # 4 REC_O_D
 24 0 0 0 # 5 REC_S
 5 0 0 1 # 6 Logbook
 5 0 0 3 # 7 Onboard
 5 0 0 3 # 8 Dock_ORBS
 5 0 0 3 # 9 Dock_MRFSS
 0 0 0 0 # 10 Research
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
 10 0 0 0 # 1 COM_L
 10 0 0 0 # 2 COM_D
 10 0 0 0 # 3 REC_O_L
 10 0 0 0 # 4 REC_O_D
 10 0 0 0 # 5 REC_S
 10 0 0 0 # 6 Logbook
 10 0 0 0 # 7 Onboard
 10 0 0 0 # 8 Dock_ORBS
 10 0 0 0 # 9 Dock_MRFSS
 11 0 0 0 # 10 Research
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   COM_L LenSelex
            20            50            35            35           0.5             0          4          0          0          0          0          0          3          2  #  Size_DblN_peak_COM_L(1)
           -12             0            -9            -9           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_COM_L(1)
             1            10             4             4           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_COM_L(1)
             1            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_COM_L(1)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_COM_L(1)
           -11            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_COM_L(1)
# 2   COM_D LenSelex
            14            45            25            25           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_COM_D(2)
           -12             0           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_COM_D(2)
             1            10           3.5           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_COM_D(2)
             1            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_COM_D(2)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_COM_D(2)
           -11            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_COM_D(2)
# 3   REC_O_L LenSelex
            20            50            30            30           0.5             0          4          0          0          0          0          0          3          2  #  Size_DblN_peak_REC_O_L(3)
           -12             0            -9            -9           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_REC_O_L(3)
             1            10             4             4           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_REC_O_L(3)
             1            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_REC_O_L(3)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_REC_O_L(3)
           -11            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_REC_O_L(3)
# 4   REC_O_D LenSelex
            14            30            26            26           0.5             0          4          0          0          0          0          0          3          2  #  Size_DblN_peak_REC_O_D(4)
           -12             0           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_REC_O_D(4)
             1            10           3.5           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_REC_O_D(4)
             1            10           3.5           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_REC_O_D(4)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_REC_O_D(4)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_REC_O_D(4)
# 5   REC_S LenSelex
            10            40            24            24           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_REC_S(5)
           -12             0            -9            -9           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_REC_S(5)
             1            10           3.5           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_REC_S(5)
             1            10          5.96           3.5           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_REC_S(5)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_REC_S(5)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_REC_S(5)
# 6   Logbook LenSelex
            -2             0            -1             1           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P1_Logbook(6)
            -2             0            -1            52           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P2_Logbook(6)
# 7   Onboard LenSelex
            -2             0            -1             1           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P1_Onboard(7)
            -2             0            -1            52           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P2_Onboard(7)
# 8   Dock_ORBS LenSelex
            -2             0            -1             1           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P1_Dock_ORBS(8)
            -2             0            -1            52           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P2_Dock_ORBS(8)
# 9   Dock_MRFSS LenSelex
            -2             0            -1             1           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P1_Dock_MRFSS(9)
            -2             0            -1            52           0.5             0        -99          0          0          0          0          0          0          0  #  SizeSel_P2_Dock_MRFSS(9)
# 10   Research LenSelex
# 1   COM_L AgeSelex
# 2   COM_D AgeSelex
# 3   REC_O_L AgeSelex
# 4   REC_O_D AgeSelex
# 5   REC_S AgeSelex
# 6   Logbook AgeSelex
# 7   Onboard AgeSelex
# 8   Dock_ORBS AgeSelex
# 9   Dock_MRFSS AgeSelex
# 10   Research AgeSelex
             0             1             1             0            10             0        -99          0          0          0          0          0          0          0  #  minage@sel=1_Research(10)
             9            40            35             0            10             0        -99          0          0          0          0          0          0          0  #  maxage@sel=1_Research(10)
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            20            50            35            35           0.5             0      4  # Size_DblN_peak_COM_L(1)_BLK3repl_1899
            20            50            30            30           0.5             0      4  # Size_DblN_peak_REC_O_L(3)_BLK3repl_1899
            14            30            26            26           0.5             0      4  # Size_DblN_peak_REC_O_D(4)_BLK3repl_1899
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
#      5     1     1     3     2     0     0     0     0     0     0     0
#      5    13     2     3     2     0     0     0     0     0     0     0
#      5    19     3     3     2     0     0     0     0     0     0     0
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
      4      1     0.503
      4      2     0.101
      4      3     0.077
      4      4     1.045
      4      5     0.393
      4      6         1
      4      7         1
      4      8         1
      4      9         1
      4     10         1
      5      1     0.136
      5      3     0.108
      5     10      0.25
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 12 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 6 1 1 1
 1 7 1 1 1
 1 8 1 1 1
 1 9 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 4 5 1 1 1
 5 1 1 1 1
 5 3 1 1 1
 5 10 1 1 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_CPUE/survey:_9
#  0 #_CPUE/survey:_10
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  0 #_lencomp:_6
#  0 #_lencomp:_7
#  0 #_lencomp:_8
#  0 #_lencomp:_9
#  0 #_lencomp:_10
#  1 #_agecomp:_1
#  0 #_agecomp:_2
#  1 #_agecomp:_3
#  0 #_agecomp:_4
#  0 #_agecomp:_5
#  0 #_agecomp:_6
#  0 #_agecomp:_7
#  0 #_agecomp:_8
#  0 #_agecomp:_9
#  1 #_agecomp:_10
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_init_equ_catch7
#  1 #_init_equ_catch8
#  1 #_init_equ_catch9
#  1 #_init_equ_catch10
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

