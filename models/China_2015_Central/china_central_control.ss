#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#C China rockfish control file for central model (40-10 to OR/WA border)
#_data_and_control_files: china_central_data.ss // china_central_control.ss
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
 1899 1899
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
0 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
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
 0.01 0.15 0.07 -2.94 0.53 3 -3 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 -10 45 2 2 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 50 34 34 10 0 6 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.1 0.1 0.8 0 6 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.25 0.1 0.1 0.8 0 -6 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.25 0.1 0.1 0.8 0 6 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 1.17e-05 1.17e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.177 3 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 100 28.5 28.5 0.8 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -9 9 -1 0 0.8 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 0.196 1 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0.0571 0 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -1 0.15 0 0.053 0.8 0 -3 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -1 45 0 2 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 50 0 33.13 10 0 -4 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -1 0.3 0 0.2461 0.8 0 -4 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 0.25 0 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 0.25 0 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 1.17e-05 1.17e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.177 3 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
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
             3            12             6             6            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.773         0.773         0.147             2         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.5           0.8             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1971 # first year of main recr_devs; early devs can preceed this era
2001 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -4 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 900 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1820 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2001 #_last_yr_fullbias_adj_in_MPD
 2015 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 1 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002F 2003F 2004F 2005F 2006F 2007F 2008F 2009F 2010F 2011F 2012F 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_NorthOf4010_Comm_Dead 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.38598e-06 5.38607e-06 0 1.61585e-05 4.84769e-05 0.000533389 0.000441994 0.000663324 0.000420847 0.00166334 0.00322027 0.00190936 0.000537506 0.00039098 1.08595e-05 0 0 3.25495e-05 4.33875e-05 4.87974e-05 5.42053e-06 5.96114e-05 7.58523e-05 0 0 0 0 0 4.86933e-05 0 5.40839e-06 0 0 0 0 0 1.08051e-05 4.32147e-05 5.40119e-06 0 0 0 0 5.39792e-06 0 5.4003e-06 5.40196e-06 5.4043e-06 1.08169e-05 5.95478e-05 1.08469e-05 5.43398e-06 0 5.45237e-06 0 0 0 0 0 5.49669e-06 0.000126596 0.00139617 0.000398185 0.00159568 0.000472047 0.000568089 0.00265125 0.00217957 0.00114039 0.000835837 0.000355876 0.000352827 0.000250138 0.000275296 5.29362e-05 0.000129439 8.22672e-05 8.80177e-05 0.000240551 0.000152687 2.93857e-05 2.34988e-05 5.28599e-05 4.70351e-05 2.94184e-05 1.1756e-05 1.17254e-05 1.16916e-05 0.0004344 0.0004344 0.0004344 0.0004344 0.0004344 0.0004344 0.0004344 0.0004344 0.0004344 0.0004344
# 2_CA_NorthOf4010_Comm_Live 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.61745e-06 0.0010049 0.000483307 0.000924129 0.00120887 0.00063407 0.00109533 0.00029409 0.000170624 0.000352574 0.000498767 0.000962203 0.000939611 0.000364383 0.000158617 0.00021144 0.000229296 0.000100023 5.29022e-05 3.51777e-05 3.50761e-05 0.00198574 0.00198574 0.00198574 0.00198574 0.00198574 0.00198574 0.00198574 0.00198574 0.00198574 0.00198574
# 3_CA_NorthOf4010_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83363e-05 1.83465e-05 1.83568e-05 1.83758e-05 1.84201e-05 1.8467e-05 1.84892e-05 0 0 0 0 1.84963e-05 1.84948e-05 1.84926e-05 1.84903e-05 3.69757e-05 3.69699e-05 3.69621e-05 3.69522e-05 3.69419e-05 3.69316e-05 5.53822e-05 5.53688e-05 5.53555e-05 3.68935e-05 1.84415e-05 1.84361e-05 1.84307e-05 1.84255e-05 1.84205e-05 1.8416e-05 0 3.68159e-05 1.8404e-05 3.68002e-05 1.83964e-05 1.83927e-05 3.67789e-05 1.83913e-05 1.84012e-05 0 0 0 5.5412e-05 5.5571e-05 7.43238e-05 7.45117e-05 5.60523e-05 0.000149958 1.88043e-05 3.76901e-05 0.000226493 0.000529552 0.000208454 0.000113968 0.000438599 0.000382641 0.000230219 0.000288789 0.000270781 0.000233581 0.000117515 0.000118391 3.99044e-05 0.000202556 0.000512845 0.000642224 0.00056604 0.000697339 0.000169406 0.000338635 0.000295981 0.00135379 0.000423882 0.0014013 0.000573262 0.000339761 0.000787271 0.000554053 0.000170282 0.000127233 0.000126671 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014
# 4_CA_NorthOf4010_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83206e-05 1.8321e-05 1.83212e-05 1.83214e-05 1.8322e-05 1.83273e-05 1.83363e-05 3.66931e-05 3.67136e-05 3.67517e-05 3.68402e-05 3.69339e-05 3.69784e-05 1.84971e-05 1.85e-05 1.8499e-05 1.84974e-05 3.69926e-05 3.69897e-05 5.54778e-05 7.39614e-05 9.24393e-05 0.00011091 9.24053e-05 9.23805e-05 0.000110826 0.000129261 0.000147686 0.000184563 0.000147615 0.000110681 7.37658e-05 7.37443e-05 3.68615e-05 3.6851e-05 3.68411e-05 7.3664e-05 1.84118e-05 9.20397e-05 3.68079e-05 9.20006e-05 1.83964e-05 3.67853e-05 9.19472e-05 5.51738e-05 3.68023e-05 1.84098e-05 1.84222e-05 1.84442e-05 0.000147765 0.000185237 0.000148648 0.000186279 0.000261577 0.000299916 0.000112826 0.000263831 0.000924844 0.00100237 0.000663264 0.000265925 0.00116324 0.00122445 0.000805766 0.00127067 0.00135391 0.00116791 0.000548404 0.000118391 0.00035914 0.000810226 0.00102569 0.000911544 0.00109015 0.00192296 0.000931733 0.000783094 0.00103593 0.00184031 0.00171672 0.00188963 0.00135884 0.00225092 0.00217031 0.00206705 0.00140483 0.000933053 0.000950047 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218
# 5_OR_SouthernOR_Comm_Dead 1.83207e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83206e-05 1.8321e-05 0 0 0 0 0 1.83465e-05 1.83568e-05 0 0 1.8467e-05 1.84892e-05 1.84971e-05 7.40001e-05 1.8499e-05 7.39898e-05 9.24815e-05 1.84948e-05 1.84926e-05 0.000129432 1.84879e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 1.84205e-05 0 0 0 0 0 0 0 0 0 1.84012e-05 0 0 0.000165998 1.84707e-05 0.000240808 0.000130067 0.000130395 0.000616575 0.00067481 0.000451302 0.000414592 0.000264241 0.00170213 0.00164868 0.00205142 0.00221207 0.00130098 0.00168827 0.00161722 0.0122432 0.0126912 0.011301 0.0107539 0.0195532 0.0174604 0.00537461 0.00814174 0.00658283 0.00407837 0.00235051 0.00137571 0.00116278 0.00249605 0.00315792 0.00244166 0.00112529 0.00299414 0.00280864 0.00338825 0.00157511 0.00101788 0.00105561 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891
# 6_OR_SouthernOR_Comm_Live 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0107539 0.0187551 0.0310316 0.020042 0.0329192 0.0367297 0.0177082 0.0127054 0.00736532 0.00892171 0.0105976 0.0136702 0.0146075 0.00938451 0.0143761 0.0161922 0.0118482 0.00791813 0.00517421 0.00532027 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637
# 7_OR_SouthernOR_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00029426 0.000496831 0.000239328 0.000700042 0.000756211 0.000978945 0.00544596 0.00169087 0.00290596 0.00265314 0.00254928 0.00268901 0.00195989 0.00186856 0.00243972 0.000720115 0.00197544 0.00245997 0.000994866 0.00145805 0.00173273 0.00187613 0.00132363 0.00164521 0.00213104 0.00157622 0.0036055 0.00174367 0.000662941 0.000670862 0.000549418 0.000487042 0.000550282 0.000739952 0.000803813 0.000551047 0.000254782 0.000424639 0.000658287 0.000787271 0.000532744 0.000383135 0.000254467 0.000253344 0.00735422 0.00735422 0.00735422 0.00735422 0.00735422 0.00735422 0.00735422 0.00735422 0.00735422 0.00735422
# 8_OR_SouthernOR_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000349434 0.000588837 0.000294557 0.000865841 0.000903765 0.00118212 0.00283412 0.00098479 0.00165789 0.0015321 0.00151832 0.000902604 0.00111186 0.00107584 0.00130497 0.000852768 0.00298216 0.00345158 0.00130098 0.00168827 0.00215629 0.00234032 0.00182972 0.00139059 0.00197318 0.00151637 0.00255221 0.00121031 0.000745808 0.000796648 0.000676207 0.00084703 0.0010794 0.00105707 0.00101534 0.000953734 0.00104036 0.00129515 0.0012741 0.000872381 0.00136382 0.00102169 0.000657377 0.000675589 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816
# 9_OR_NorthernOR_Comm 1.83207e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83206e-05 1.8321e-05 0 0 0 0 0 1.83465e-05 1.83568e-05 0 0 1.8467e-05 1.84892e-05 1.84971e-05 7.40001e-05 1.8499e-05 7.39898e-05 9.24815e-05 1.84948e-05 1.84926e-05 0.000129432 1.84879e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 1.84205e-05 0 0 0 0 0 0 0 0 0 1.84012e-05 0 0 0.000165998 1.84707e-05 0.000240808 0.000130067 0.000130395 0.000597891 0.000656066 0.000432498 0.000395747 0.000264241 0.00158866 0.00210349 0.00153857 0.00101068 0.00122445 0.00122783 1.92526e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 2.1153e-05 8.47764e-05 0.000127391 6.36958e-05 4.24701e-05 0.000127666 4.26195e-05 6.38559e-05 4.24095e-05 4.22223e-05 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286
# 10_OR_NorthernOR_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000809215 0.00138009 0.000681164 0.00198959 0.00212108 0.0027706 0.0028156 0.0030287 0.00406089 0.0039984 0.00504233 0.00509595 0.00260062 0.00298215 0.00194799 0.00272886 0.00419782 0.00417623 0.00275501 0.00462356 0.00583353 0.00411974 0.0021217 0.00340794 0.0040253 0.00311254 0.00427394 0.00350786 0.00292108 0.00293502 0.00236672 0.0020964 0.00162968 0.00234671 0.00296142 0.00264926 0.00201702 0.00216566 0.00331267 0.00357464 0.00315384 0.00108555 0.000720995 0.000738925 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087
# 11_OR_NorthernOR_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000128739 0.000239215 0.000110459 0.000497398 0.000534881 0.000461767 0.00181532 0.00167229 0.00180691 0.00177499 0.00224937 0.00227532 0.00116839 0.00132121 0.000869978 0.000549561 0.000588834 0.000934407 0.000593093 0.00124702 0.00190601 0.00141193 0.00099272 0.000509232 0.000927397 0.000937753 0.000911504 0.000800038 0.00118086 0.00125787 0.0010777 0.000910557 0.0010794 0.00141648 0.00173454 0.00188627 0.00161362 0.00154993 0.00203857 0.00263842 0.00268503 0.00112812 0.000742201 0.000760037 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         6         1         0         1         1         1  #  6_OR_SouthernOR_Comm_Live
         7         1         0         0         1         1  #  7_OR_SouthernOR_Rec_PC
        10         1         0         0         1         1  #  10_OR_NorthernOR_Rec_PC
        12         1         0         1         1         1  #  12_OR_SouthernOR_Rec_PC_ORBS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -9.38081             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_6_OR_SouthernOR_Comm_Live(6)
             0             2           0.5             1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_6_OR_SouthernOR_Comm_Live(6)
           -15            15             0             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_7_OR_SouthernOR_Rec_PC(7)
           -15            15      -9.24689             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_10_OR_NorthernOR_Rec_PC(10)
           -15            15      -9.81181             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_12_OR_SouthernOR_Rec_PC_ORBS(12)
             0             2           0.5             1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_12_OR_SouthernOR_Rec_PC_ORBS(12)
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
 24 0 0 0 # 1 1_CA_NorthOf4010_Comm_Dead
 24 0 0 0 # 2 2_CA_NorthOf4010_Comm_Live
 24 0 0 0 # 3 3_CA_NorthOf4010_Rec_PC
 24 0 0 0 # 4 4_CA_NorthOf4010_Rec_PR
 24 0 0 0 # 5 5_OR_SouthernOR_Comm_Dead
 24 0 0 0 # 6 6_OR_SouthernOR_Comm_Live
 24 0 0 0 # 7 7_OR_SouthernOR_Rec_PC
 24 0 0 0 # 8 8_OR_SouthernOR_Rec_PR
 15 0 0 5 # 9 9_OR_NorthernOR_Comm
 24 0 0 0 # 10 10_OR_NorthernOR_Rec_PC
 15 0 0 10 # 11 11_OR_NorthernOR_Rec_PR
 15 0 0 7 # 12 12_OR_SouthernOR_Rec_PC_ORBS
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
 10 0 0 0 # 1 1_CA_NorthOf4010_Comm_Dead
 10 0 0 0 # 2 2_CA_NorthOf4010_Comm_Live
 10 0 0 0 # 3 3_CA_NorthOf4010_Rec_PC
 10 0 0 0 # 4 4_CA_NorthOf4010_Rec_PR
 10 0 0 0 # 5 5_OR_SouthernOR_Comm_Dead
 10 0 0 0 # 6 6_OR_SouthernOR_Comm_Live
 10 0 0 0 # 7 7_OR_SouthernOR_Rec_PC
 10 0 0 0 # 8 8_OR_SouthernOR_Rec_PR
 10 0 0 0 # 9 9_OR_NorthernOR_Comm
 10 0 0 0 # 10 10_OR_NorthernOR_Rec_PC
 10 0 0 0 # 11 11_OR_NorthernOR_Rec_PR
 10 0 0 0 # 12 12_OR_SouthernOR_Rec_PC_ORBS
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   1_CA_NorthOf4010_Comm_Dead LenSelex
            19            45            28            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_1_CA_NorthOf4010_Comm_Dead(1)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_1_CA_NorthOf4010_Comm_Dead(1)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_1_CA_NorthOf4010_Comm_Dead(1)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_1_CA_NorthOf4010_Comm_Dead(1)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_1_CA_NorthOf4010_Comm_Dead(1)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_1_CA_NorthOf4010_Comm_Dead(1)
# 2   2_CA_NorthOf4010_Comm_Live LenSelex
            19            45            28            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_2_CA_NorthOf4010_Comm_Live(2)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_2_CA_NorthOf4010_Comm_Live(2)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_2_CA_NorthOf4010_Comm_Live(2)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_2_CA_NorthOf4010_Comm_Live(2)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_2_CA_NorthOf4010_Comm_Live(2)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_2_CA_NorthOf4010_Comm_Live(2)
# 3   3_CA_NorthOf4010_Rec_PC LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_3_CA_NorthOf4010_Rec_PC(3)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_3_CA_NorthOf4010_Rec_PC(3)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_3_CA_NorthOf4010_Rec_PC(3)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_3_CA_NorthOf4010_Rec_PC(3)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_3_CA_NorthOf4010_Rec_PC(3)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_3_CA_NorthOf4010_Rec_PC(3)
# 4   4_CA_NorthOf4010_Rec_PR LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_4_CA_NorthOf4010_Rec_PR(4)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_4_CA_NorthOf4010_Rec_PR(4)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_4_CA_NorthOf4010_Rec_PR(4)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_4_CA_NorthOf4010_Rec_PR(4)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_4_CA_NorthOf4010_Rec_PR(4)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_4_CA_NorthOf4010_Rec_PR(4)
# 5   5_OR_SouthernOR_Comm_Dead LenSelex
            19            45          39.9            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_5_OR_SouthernOR_Comm_Dead(5)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_5_OR_SouthernOR_Comm_Dead(5)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_5_OR_SouthernOR_Comm_Dead(5)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_5_OR_SouthernOR_Comm_Dead(5)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_5_OR_SouthernOR_Comm_Dead(5)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_5_OR_SouthernOR_Comm_Dead(5)
# 6   6_OR_SouthernOR_Comm_Live LenSelex
            19            45          39.9            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_6_OR_SouthernOR_Comm_Live(6)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_6_OR_SouthernOR_Comm_Live(6)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_6_OR_SouthernOR_Comm_Live(6)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_6_OR_SouthernOR_Comm_Live(6)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_6_OR_SouthernOR_Comm_Live(6)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_6_OR_SouthernOR_Comm_Live(6)
# 7   7_OR_SouthernOR_Rec_PC LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_7_OR_SouthernOR_Rec_PC(7)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_7_OR_SouthernOR_Rec_PC(7)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_7_OR_SouthernOR_Rec_PC(7)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_7_OR_SouthernOR_Rec_PC(7)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_7_OR_SouthernOR_Rec_PC(7)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_7_OR_SouthernOR_Rec_PC(7)
# 8   8_OR_SouthernOR_Rec_PR LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_8_OR_SouthernOR_Rec_PR(8)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_8_OR_SouthernOR_Rec_PR(8)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_8_OR_SouthernOR_Rec_PR(8)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_8_OR_SouthernOR_Rec_PR(8)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_8_OR_SouthernOR_Rec_PR(8)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_8_OR_SouthernOR_Rec_PR(8)
# 9   9_OR_NorthernOR_Comm LenSelex
# 10   10_OR_NorthernOR_Rec_PC LenSelex
            19            45          39.9            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_10_OR_NorthernOR_Rec_PC(10)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_10_OR_NorthernOR_Rec_PC(10)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_10_OR_NorthernOR_Rec_PC(10)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_10_OR_NorthernOR_Rec_PC(10)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_10_OR_NorthernOR_Rec_PC(10)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_10_OR_NorthernOR_Rec_PC(10)
# 11   11_OR_NorthernOR_Rec_PR LenSelex
# 12   12_OR_SouthernOR_Rec_PC_ORBS LenSelex
# 1   1_CA_NorthOf4010_Comm_Dead AgeSelex
# 2   2_CA_NorthOf4010_Comm_Live AgeSelex
# 3   3_CA_NorthOf4010_Rec_PC AgeSelex
# 4   4_CA_NorthOf4010_Rec_PR AgeSelex
# 5   5_OR_SouthernOR_Comm_Dead AgeSelex
# 6   6_OR_SouthernOR_Comm_Live AgeSelex
# 7   7_OR_SouthernOR_Rec_PC AgeSelex
# 8   8_OR_SouthernOR_Rec_PR AgeSelex
# 9   9_OR_NorthernOR_Comm AgeSelex
# 10   10_OR_NorthernOR_Rec_PC AgeSelex
# 11   11_OR_NorthernOR_Rec_PR AgeSelex
# 12   12_OR_SouthernOR_Rec_PC_ORBS AgeSelex
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
      4      1      0.68
      4      2      0.33
      4      3      0.25
      4      4      0.12
      4      5      0.09
      5      5     0.259
      4      6      0.04
      4      7      0.06
      5      7     0.428
      4      8      0.04
      4     10      0.13
      5     10      0.47
      4     11      0.15
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 #_CPUE/survey:_5
#  1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 #_CPUE/survey:_7
#  0 0 0 0 #_CPUE/survey:_8
#  0 0 0 0 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  0 0 0 0 #_CPUE/survey:_11
#  1 1 1 1 #_CPUE/survey:_12
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  1 1 1 1 #_lencomp:_7
#  1 1 1 1 #_lencomp:_8
#  0 0 0 0 #_lencomp:_9
#  1 1 1 1 #_lencomp:_10
#  1 1 1 1 #_lencomp:_11
#  0 0 0 0 #_lencomp:_12
#  0 0 0 0 #_agecomp:_1
#  0 0 0 0 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  1 1 1 1 #_agecomp:_5
#  0 0 0 0 #_agecomp:_6
#  1 1 1 1 #_agecomp:_7
#  0 0 0 0 #_agecomp:_8
#  0 0 0 0 #_agecomp:_9
#  1 1 1 1 #_agecomp:_10
#  0 0 0 0 #_agecomp:_11
#  0 0 0 0 #_agecomp:_12
#  1 1 1 1 #_init_equ_catch1
#  1 1 1 1 #_init_equ_catch2
#  1 1 1 1 #_init_equ_catch3
#  1 1 1 1 #_init_equ_catch4
#  1 1 1 1 #_init_equ_catch5
#  1 1 1 1 #_init_equ_catch6
#  1 1 1 1 #_init_equ_catch7
#  1 1 1 1 #_init_equ_catch8
#  1 1 1 1 #_init_equ_catch9
#  1 1 1 1 #_init_equ_catch10
#  1 1 1 1 #_init_equ_catch11
#  1 1 1 1 #_init_equ_catch12
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

