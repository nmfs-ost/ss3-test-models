#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#C Yelloweye 2017 control file
#_data_and_control_files: yelloweye_data.ss // yelloweye_control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
2 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
 1 1 2 0
#
0 #_N_movement_definitions
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) if do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, GP=1, source=1 dest=2, age1=4, age2=10
#
4 #_Nblock_Patterns
 1 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1992 2004
 2005 2016
 2002 2016
 2002 2016
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
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
1 #_N_breakpoints
 4 # age(real) at M breakpoints
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
70 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.15 0.0439034 -3.12576 0.438438 3 -1 0 0 0 0 0 0 0 # NatM_break_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 1 35 23 30 99 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40 120 61 66 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.2 0.05 0.05 99 0 1 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.5 0.1 0.1 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.1 0.1 99 0 7 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 7.31281e-06 7.31281e-06 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 -3 4 3.24248 3.24248 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 38 45 42.0705 41.765 99 0 -50 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.402214 -0.36886 99 0 -50 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 300000 7.21847e-08 7.21847e-08 1 6 -6 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 -3 39000 4.043 4.043 1 6 -6 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 -0.1 0 99 0 3 0 0 0 0 0 0 0 # RecrDist_Area_2
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # CohortGrowDev
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
             3            15           6.1             5            99             0          3          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.718         0.718         0.158             2         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             5           0.5           0.5            99             0         -2          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
            -1             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1980 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
7 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1889 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 7 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1917 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1975 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2013 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.36 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1889E 1890E 1891E 1892E 1893E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978E 1979E 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.09 # F ballpark value in units of annual_F
1999 # F ballpark year (neg value to disable)
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
# Yr:  1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_TWL 0 2.02288e-06 3.03435e-06 5.05733e-06 6.06894e-06 8.09217e-06 9.10405e-06 1.11277e-05 1.21399e-05 1.41641e-05 1.61887e-05 1.72018e-05 1.92271e-05 2.02409e-05 2.22671e-05 2.32817e-05 2.53089e-05 2.63243e-05 2.83527e-05 3.03818e-05 3.13987e-05 3.34291e-05 3.44471e-05 3.64788e-05 3.7498e-05 3.95312e-05 4.05515e-05 4.25863e-05 6.69331e-05 7.81129e-05 5.48007e-05 5.58246e-05 4.56831e-05 3.9599e-05 4.26516e-05 2.43765e-05 1.72707e-05 6.30085e-05 0.000106755 0.000136315 0.000160822 0.000149725 8.97022e-05 0.00010711 0.000166447 0.000164524 0.000171833 0.00015258 0.000181477 0.000171417 0.000177779 0.0001646 0.000119466 2.78382e-05 0.000211502 0.000863284 0.00191974 0.0017014 0.000743398 0.000681852 0.000392069 0.000361191 0.00104881 0.000923771 0.000912456 0.00053248 0.00060017 0.000920132 0.00112828 0.00111586 0.000933296 0.000813728 0.000388299 0.000402046 0.000659074 0.000342544 0.000424663 0.00039957 0.000683339 0.000420167 0.00243268 0.00271937 0.00472225 0.00640923 0.00503045 0.00522645 0.00594445 0.00542052 0.00516296 0.0151908 0.00769342 0.00198872 0.00392347 0.0265392 0.00780781 0.0061363 0.00104691 0.00141447 0.00242842 0.00446357 0.0013853 0.00150278 0.00210839 0.00243403 0.000962059 0.00073262 0.000576478 0.00255327 0.000974161 0.000646266 0.00135859 0.00011412 9.62384e-05 5.54636e-05 1.98586e-05 3.0302e-06 3.00459e-06 5.95894e-07 0 2.49213e-06 3.19923e-06 8.66062e-06 0 4.26408e-07 1.2699e-06 7.70378e-06 4.17128e-07 4.14191e-07 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05
# 2_CA_NONTWL 0 7.08009e-06 1.31489e-05 2.02293e-05 2.62987e-05 3.33802e-05 3.94509e-05 4.6534e-05 5.26064e-05 5.96917e-05 6.67783e-05 7.28547e-05 7.99444e-05 8.60238e-05 9.31171e-05 9.92002e-05 0.000106297 0.000112385 0.000119486 0.000126591 0.000132685 0.000139794 0.000145894 0.000153008 0.000159113 0.000166234 0.000172344 0.000179471 0.000300185 0.00035303 0.000164402 0.000186759 0.000187808 0.00017058 0.000181777 0.000262047 0.000374875 0.000431913 0.00049514 0.000425221 0.00041427 0.000539823 0.000483169 0.000722225 0.000286943 0.000426127 0.000645397 0.000675856 0.000441902 0.000481405 0.000484012 0.000305538 0.00043152 0.000319624 0.000396179 0.00170592 0.00414391 0.00431549 0.000963586 0.00176609 0.000650287 0.000486868 0.000748246 0.000577623 0.000339642 0.00072349 0.000195777 0.000194107 0.00043776 0.000329145 0.000177771 0.000243683 0.000184333 0.00019119 0.000614187 0.000500641 0.00060619 0.000491184 0.000485093 0.000432394 0.00043632 0.000389605 0.000534744 0.000848179 0.000679261 0.00135211 0.00117329 0.00160329 0.00181572 0.00378539 0.00483014 0.00341474 0.015525 0.00206945 0.0010585 0.000615999 0.000596825 0.00335097 0.0054798 0.0051031 0.00625749 0.0104747 0.0200689 0.0148917 0.0072528 0.00775953 0.0074489 0.00878939 0.00896543 0.00278052 0.00215398 0.000517448 0.000605371 4.62197e-06 7.63792e-06 0.000113633 0.000109668 2.97947e-05 0.000137391 9.38214e-05 2.76297e-05 5.77375e-06 2.86428e-05 0.00012508 7.90162e-05 2.80138e-06 5.56171e-05 0 0 0 0 0 0 0 0 0 0 0 0 0
# 3_CA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.4782e-05 0.000130652 0.000149994 0.000199813 0.000250712 0.000300759 0.000350801 0.000402008 0.000452411 0.00053765 0.000529063 0.000463205 0.000666391 0.000616911 0.000328297 0.000314139 0.000257905 0.000345157 0.000597141 0.00047887 0.000959657 0.00124584 0.00152265 0.00180702 0.00158472 0.00136128 0.00171682 0.00207671 0.00233675 0.00232329 0.00363342 0.00315238 0.00225778 0.00177427 0.00226196 0.00237451 0.00207099 0.00318621 0.0034701 0.00351377 0.00416461 0.00450949 0.00511469 0.00457973 0.00593818 0.00762677 0.00814092 0.00836013 0.00960316 0.00879205 0.00830964 0.00956871 0.00926401 0.00607208 0.0134634 0.00698876 0.0106689 0.0173928 0.00924107 0.0107504 0.00841726 0.00866009 0.0068525 0.00502073 0.00317038 0.00123745 0.00216829 0.00201787 0.00186527 0.00234155 0.000783003 0.00202619 0.0012425 0.000771082 0.000306139 0.0006071 0.000150539 0.000149272 0.000148029 0.000587205 0.000145678 0.00072257 0.00014345 0.000284666 0.000282533 0.000140242 0.000139221 0.000276408 0.000137234 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328
# 4_ORWA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.23749e-06 1.11937e-06 0 1.12161e-06 3.36751e-06 6.74544e-06 0 1.01468e-05 0.000232448 0.000358339 0.000674626 0.00236835 0.00418682 0.00656412 0.00405013 0.00250357 0.0017749 0.00148556 0.00161209 0.00141888 0.00151365 0.00118113 0.00152035 0.0015609 0.002023 0.00273766 0.00219715 0.00238667 0.00302164 0.00273062 0.00317928 0.000865581 0.000235414 0.00818888 0.000368203 0.000828227 0.000360749 0.00579887 0.000860993 0.00166684 0.000898557 0.00116463 0.000540515 0.00065844 0.000849863 0.00061327 0.00292991 0.00556736 0.0106325 0.0117486 0.0204036 0.038626 0.0161249 0.0290291 0.0140566 0.0111355 0.0208489 0.0326507 0.0138071 0.021171 0.0245743 0.026067 0.0171333 0.0269256 0.0177354 0.0174762 0.00930789 0.00434106 0.0011861 0.000379521 0.000368768 0.000125705 0.000112498 0.000274596 0.000309506 1.9297e-05 3.37589e-05 1.86876e-05 1.63457e-05 1.20637e-05 1.1875e-05 2.14446e-05 5.76301e-06 5.67806e-06 1.3061e-05 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206 0.000436206
# 5_ORWA_NONTWL 4.63339e-06 4.63341e-06 8.1085e-06 0.000421645 0.000411382 0.000411539 0.000106693 2.55157e-05 2.55159e-05 1.50777e-05 2.66758e-05 3.47947e-05 4.52337e-05 5.56733e-05 6.49541e-05 8.46753e-05 8.58398e-05 9.62848e-05 0.000105572 0.00022624 0.000126485 0.00013694 0.000146238 0.000156699 0.000167163 0.00017763 0.000258931 0.000197429 0.000207909 0.00215373 0.000885767 0.000765294 0.000737804 0.000510824 0.00059502 0.00108436 0.0013412 0.00204451 0.00267035 0.00259445 0.00208709 0.00229951 0.00138121 0.000866986 0.00121897 0.00149961 0.00114912 0.00197607 0.00176165 0.00194616 0.00126722 0.00204506 0.00327277 0.00376244 0.00616474 0.0027412 0.00140603 0.00254252 0.00135411 0.00165976 0.00139423 0.00184199 0.002244 0.00163614 0.000704317 0.00128799 0.00122225 0.000547209 0.00107454 0.000302569 0.000685793 0.00062482 0.000625029 0.000658199 0.000524293 0.000397713 0.000598058 0.000417095 0.000849104 0.000728328 0.00168249 0.000557679 0.00107902 0.0014067 0.00148546 0.00187791 0.000995788 0.00132282 0.00222555 0.0031655 0.00649917 0.0033514 0.00326661 0.00436083 0.00655588 0.00591809 0.0107527 0.0106462 0.0160455 0.00807436 0.00723881 0.0125531 0.0159866 0.0174584 0.0280675 0.0170135 0.0089458 0.0213168 0.0273026 0.0110587 0.0254363 0.00383629 0.00668761 0.001052 0.000559884 0.0005858 0.000402185 0.000515039 0.000862922 0.000791136 0.000494548 0.000191848 0.000265413 0.000412065 0.000624233 0.000451515 0.000648245 0.000525054 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355 0.0175355
# 6_OR_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000906574 0.00156863 0.000767637 0.00238696 0.00246029 0.00304331 0.00386694 0.00349298 0.00310427 0.00522073 0.00728268 0.00506332 0.00442648 0.00435835 0.0046656 0.00149106 0.00261777 0.00268608 0.00274737 0.00365869 0.0035967 0.00256943 0.00313095 0.0020769 0.00233666 0.00352148 0.00393801 0.00186216 0.00119124 0.000696626 0.00077801 0.000324376 0.000454497 0.000257492 0.000390673 0.000443588 0.000478108 0.000492966 0.000511263 0.000604316 0.000690886 0.000507702 0.000674536 0.000500598 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188
# 7_WA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000484189 0.0005059 0.00104389 0.000518688 0.000535218 0.000312451 0.000589735 0.000860876 0.00121626 0.0021679 0.00169025 0.0017105 0.00220206 0.00177152 0.00320058 0.00281037 0.00718706 0.0066506 0.00708184 0.00459764 0.00459224 0.00483905 0.00520525 0.00678278 0.00564586 0.00606981 0.00647475 0.000862849 0.000595486 0.00101033 0.000970286 0.000367936 0.000526893 0.000435873 0.000422036 0.000495724 0.000504035 0.000696046 0.000472766 0.000606048 0.000590255 0.000656555 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274 0.0219274
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         3         1         0         1         0         1  #  3_CA_REC
         6         1         0         1         0         1  #  6_OR_REC
         7         1         0         1         0         1  #  7_WA_REC
         8         1         0         1         0         1  #  8_CACPFV
         9         1         0         1         0         1  #  9_OR_RECOB
        10         1         0         1         0         1  #  10_TRI_ORWA
        11         1         0         1         0         1  #  11_NWFSC_ORWA
        12         1         0         1         0         1  #  12_IPHC_ORWA
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -11.1349             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_3_CA_REC(3)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_3_CA_REC(3)
           -15            15      -10.3284             0            99             0         -1          0          0          0          0          0          2          1  #  LnQ_base_6_OR_REC(6)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_6_OR_REC(6)
           -20            15       -9.4844             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_7_WA_REC(7)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_7_WA_REC(7)
           -15            15      -11.3209             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_8_CACPFV(8)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_8_CACPFV(8)
           -15            15      -9.98138             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_9_OR_RECOB(9)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_9_OR_RECOB(9)
           -15            15      -2.71004             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_10_TRI_ORWA(10)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_10_TRI_ORWA(10)
           -15            15      -1.79223             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_11_NWFSC_ORWA(11)
             0             5             0          0.01            99             0         -5          0          0          0          0          0          0          0  #  Q_extraSD_11_NWFSC_ORWA(11)
           -15            15      -6.48507             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_12_IPHC_ORWA(12)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_12_IPHC_ORWA(12)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
            -4             4          -0.6             0            99            -1      1  # LnQ_base_6_OR_REC(6)_BLK2add_2005
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
 24 0 0 0 # 1 1_CA_TWL
 24 0 0 0 # 2 2_CA_NONTWL
 24 0 0 0 # 3 3_CA_REC
 24 0 0 1 # 4 4_ORWA_TWL
 24 0 0 2 # 5 5_ORWA_NONTWL
 24 0 0 0 # 6 6_OR_REC
 24 0 0 0 # 7 7_WA_REC
 15 0 0 3 # 8 8_CACPFV
 24 0 0 0 # 9 9_OR_RECOB
 24 0 0 0 # 10 10_TRI_ORWA
 24 0 0 0 # 11 11_NWFSC_ORWA
 24 0 0 0 # 12 12_IPHC_ORWA
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
 10 0 0 0 # 1 1_CA_TWL
 10 0 0 0 # 2 2_CA_NONTWL
 10 0 0 0 # 3 3_CA_REC
 10 0 0 0 # 4 4_ORWA_TWL
 10 0 0 0 # 5 5_ORWA_NONTWL
 10 0 0 0 # 6 6_OR_REC
 10 0 0 0 # 7 7_WA_REC
 10 0 0 0 # 8 8_CACPFV
 10 0 0 0 # 9 9_OR_RECOB
 10 0 0 0 # 10 10_TRI_ORWA
 10 0 0 0 # 11 11_NWFSC_ORWA
 10 0 0 0 # 12 12_IPHC_ORWA
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   1_CA_TWL LenSelex
            20            60            45            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_1_CA_TWL(1)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_1_CA_TWL(1)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_1_CA_TWL(1)
            -1            30            20             9            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_1_CA_TWL(1)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_1_CA_TWL(1)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_1_CA_TWL(1)
# 2   2_CA_NONTWL LenSelex
            20            60            45            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_2_CA_NONTWL(2)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_2_CA_NONTWL(2)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_2_CA_NONTWL(2)
            -1            30            20             9            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_2_CA_NONTWL(2)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_2_CA_NONTWL(2)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_2_CA_NONTWL(2)
# 3   3_CA_REC LenSelex
            20            60            44            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_3_CA_REC(3)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_3_CA_REC(3)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_3_CA_REC(3)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_3_CA_REC(3)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_3_CA_REC(3)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_3_CA_REC(3)
# 4   4_ORWA_TWL LenSelex
            20            60            40            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_4_ORWA_TWL(4)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_4_ORWA_TWL(4)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_4_ORWA_TWL(4)
            -1            30            20             9            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_4_ORWA_TWL(4)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_4_ORWA_TWL(4)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_4_ORWA_TWL(4)
# 5   5_ORWA_NONTWL LenSelex
            20            60            50            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_5_ORWA_NONTWL(5)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_5_ORWA_NONTWL(5)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_5_ORWA_NONTWL(5)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_5_ORWA_NONTWL(5)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_5_ORWA_NONTWL(5)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_5_ORWA_NONTWL(5)
# 6   6_OR_REC LenSelex
            20            60            40            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_6_OR_REC(6)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_6_OR_REC(6)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_6_OR_REC(6)
            -1            30            12             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_6_OR_REC(6)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_6_OR_REC(6)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_6_OR_REC(6)
# 7   7_WA_REC LenSelex
            20            60          44.4            30            99             0          6          0          0          0          0          0          0          0  #  Size_DblN_peak_7_WA_REC(7)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_7_WA_REC(7)
            -1             9          4.49             6            99             0          6          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_7_WA_REC(7)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_7_WA_REC(7)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_7_WA_REC(7)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_7_WA_REC(7)
# 8   8_CACPFV LenSelex
# 9   9_OR_RECOB LenSelex
            20            60            40            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_9_OR_RECOB(9)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_9_OR_RECOB(9)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_9_OR_RECOB(9)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_9_OR_RECOB(9)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_9_OR_RECOB(9)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_9_OR_RECOB(9)
# 10   10_TRI_ORWA LenSelex
            20            80            50            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_10_TRI_ORWA(10)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_10_TRI_ORWA(10)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_10_TRI_ORWA(10)
            -1            30            12             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_10_TRI_ORWA(10)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_10_TRI_ORWA(10)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_10_TRI_ORWA(10)
# 11   11_NWFSC_ORWA LenSelex
            20            60            50            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_11_NWFSC_ORWA(11)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_11_NWFSC_ORWA(11)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_11_NWFSC_ORWA(11)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_11_NWFSC_ORWA(11)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_11_NWFSC_ORWA(11)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_11_NWFSC_ORWA(11)
# 12   12_IPHC_ORWA LenSelex
            20            60            50            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_12_IPHC_ORWA(12)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_12_IPHC_ORWA(12)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_12_IPHC_ORWA(12)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_12_IPHC_ORWA(12)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_12_IPHC_ORWA(12)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_12_IPHC_ORWA(12)
# 1   1_CA_TWL AgeSelex
# 2   2_CA_NONTWL AgeSelex
# 3   3_CA_REC AgeSelex
# 4   4_ORWA_TWL AgeSelex
# 5   5_ORWA_NONTWL AgeSelex
# 6   6_OR_REC AgeSelex
# 7   7_WA_REC AgeSelex
# 8   8_CACPFV AgeSelex
# 9   9_OR_RECOB AgeSelex
# 10   10_TRI_ORWA AgeSelex
# 11   11_NWFSC_ORWA AgeSelex
# 12   12_IPHC_ORWA AgeSelex
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
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      3     3     1     2     1     0     0     0     0     0     0     0
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
      4      1   0.84204
      4      2   0.35975
      4      3  0.600663
      4      4  0.182385
      4      5  0.486995
      4      6  0.395623
      4      7  0.892214
      4      8  0.705075
      4      9  0.780701
      4     10  0.537479
      4     11  0.654133
      4     12         1
      5      2  0.555438
      5      3  0.587597
      5      4   0.47074
      5      5  0.478139
      5      6   0.36123
      5      7         1
      5     11         1
      5     12 0.0277953
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
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
#  0 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_agecomp:_4
#  1 #_agecomp:_5
#  1 #_agecomp:_6
#  1 #_agecomp:_7
#  0 #_agecomp:_8
#  0 #_agecomp:_9
#  0 #_agecomp:_10
#  1 #_agecomp:_11
#  1 #_agecomp:_12
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
#  1 #_init_equ_catch11
#  1 #_init_equ_catch12
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  1 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

