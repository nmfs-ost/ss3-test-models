#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_data_and_control_files: Canary_data.SS // Canary_control.SS
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
3 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
 1 1 2 0
 1 1 3 0
#
0 #_N_movement_definitions
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) if do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, GP=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
 1 2 1 #_blocks_per_pattern 
# begin and end years of blocks
 2000 2014
 2000 2010 2011 2014
 1891 1891
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
2 #_N_breakpoints
 6 14 # age(real) at M breakpoints
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 6.8e-06 1.39e-05 2.85e-05 5.83e-05 0.000119295 0.000244164 0.000499664 0.00102224 0.00209011 0.00426839 0.00869559 0.0176272 0.0353807 0.0696495 0.132205 0.235559 0.381109 0.545888 0.692066 0.796225 0.859413 0.894075 0.912046 0.92109 0.925574 0.92778 0.928862 0.929391 0.92965 0.929776
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.04 0.08 0.0521 -2.9551 0.5323 3 -50 0 0 0 0 0.5 0 0 # NatM_break_1_Fem_GP_1
 0 0.9 0.45 0.4 50 0 3 0 0 0 0 0.5 0 0 # NatM_break_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 2 15 3.8 4 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 50 70 60 60 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.02 0.21 0.14 0.14 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.02 0.21 0.14 0.15 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 -3 3 -1.3 -1.3 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 1.18e-05 1.55e-05 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.094 3.03 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 40 41 40.5 40.5 50 6 -50 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.25 -0.25 50 6 -50 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 3 0.2619 1 50 6 -50 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -1 1 0.0217 0 50 6 -50 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # NatM_break_1_Mal_GP_1
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # NatM_break_2_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.12 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.24 0 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0.04 0 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 -1.3 0 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 1.064e-05 1.55e-05 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.123 3.03 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 999 1 1 50 6 -50 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -7 7 0 1 50 0 -1 0 0 0 0 0 0 0 # RecrDist_Area_1
 -7 7 0 1 50 0 1 0 1 1933 2014 -5 0 0 # RecrDist_Area_2
 -7 7 0 1 50 0 1 0 1 1933 2014 -5 0 0 # RecrDist_Area_3
 0 999 1 1 50 6 -50 0 0 0 0 0.5 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 0.0001 2 0.5 0.5 0.5 6 -5 # RecrDist_Area_2_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_Area_2_dev_autocorr
 0.0001 2 0.5 0.5 0.5 6 -5 # RecrDist_Area_3_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_Area_3_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 
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
             7            11           8.5           8.5            50             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.21          0.99         0.773           0.4            50             6         -6          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.4            50             6        -50          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            50             6        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            50             6        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1960 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1933 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1965.76 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1978 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2012 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.8025 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
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
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00442154 0.00702898 0.00724986 0.00470043 0.00494395 0.00420328 0.00386955 0.00469935 0.00476922 0.00537342 0.00734942 0.00639776 0.00631519 0.00696435 0.00740398 0.00892239 0.00600144 0.00605735 0.00565568 0.00636497 0.00410825 0.00495619 0.00509782 0.0065228 0.00532807 0.0044782 0.00152034 0.00468485 0.0190986 0.0436497 0.0401676 0.0164736 0.0175003 0.0145192 0.014001 0.0149164 0.0101071 0.0100431 0.00712054 0.00753306 0.00748598 0.00860545 0.0111342 0.00820717 0.00652519 0.00519684 0.00529772 0.00697543 0.00467812 0.00622126 0.00460994 0.00619149 0.0058447 0.0148355 0.0163545 0.0249179 0.0312024 0.0245513 0.0312086 0.0345144 0.0382152 0.0376735 0.0543204 0.026766 0.0381118 0.0477849 0.0719839 0.0471554 0.037466 0.0313122 0.0165417 0.0208519 0.0225109 0.0181876 0.0326712 0.0148069 0.022901 0.00920862 0.012271 0.0125891 0.020834 0.016891 0.0153783 0.0100629 0.00185382 0.00132242 0.00194917 0.000775634 0.000330653 0.000949177 0.000663696 0.00113149 0.000414349 0.000228328 4.77532e-05 3.37514e-05 5.16693e-05 0.000136825 0.00017525 0.00588731 0.00588731
# 2_OR_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.44421e-05 3.33464e-05 1.36115e-06 2.65436e-05 9.66507e-05 0.000188577 0 0.000269037 0.00618345 0.00954492 0.0180001 0.0633822 0.11413 0.183922 0.121297 0.0784981 0.0568515 0.0495433 0.0520894 0.0482229 0.0502338 0.0530213 0.0678687 0.0693135 0.10408 0.111383 0.0782826 0.0866653 0.104648 0.0969132 0.115063 0.0676951 0.103231 0.0856232 0.0967844 0.0141299 0.0885175 0.0279135 0.0598028 0.0794877 0.0755662 0.0945844 0.0599505 0.0426741 0.0260037 0.0638825 0.19275 0.149752 0.347363 0.270182 0.566487 0.669013 0.326958 0.283263 0.272098 0.401038 0.388446 0.522231 0.37507 0.688736 0.699873 0.9 0.539593 0.423505 0.519913 0.420329 0.510585 0.285849 0.014673 0.00965321 0.00802491 0.00266027 0.00158893 0.00292384 0.00186209 0.00117868 0.00108926 0.000920843 0.000416342 0.000457606 0.000747737 0.000852174 0.00103909 0.04645 0.04645
# 3_WA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.718e-06 0 2.0386e-05 0.000157657 0.000203206 0.000181477 0.000267823 0.000280773 0.000621449 0.000232592 0.00452097 0.0146382 0.00611768 0.0642412 0.033199 0.017534 0.0285742 0.0350136 0.0339809 0.028692 0.0275502 0.0120191 0.0172353 0.0162957 0.0155946 0.0129212 0.0163661 0.0183311 0.0166194 0.019763 0.0276152 0.0223607 0.016561 0.0369299 0.0509992 0.026547 0.0469674 0.0466321 0.043366 0.0499435 0.0140964 0.0317425 0.0495496 0.0695322 0.0540556 0.0458499 0.133666 0.0701065 0.0760565 0.0538657 0.0457115 0.0684572 0.0652572 0.111635 0.0995732 0.115135 0.113934 0.14407 0.135814 0.123629 0.107316 0.0382292 0.0193994 0.0194965 0.0226736 0.024153 0.0237742 0.0161654 0.00168175 0.00134141 0.00261128 0.00120061 0.000918728 0.0020359 0.00133258 0.00089552 0.000838269 0.000666872 0.000681468 0.000353339 0.000502776 0.00043237 0.000156755 0.0281204 0.0281204
# 4_CA_NTWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000195432 0.000321346 0.000367074 0.000190678 0.00021069 0.000201219 0.000182471 0.000202013 0.000259636 0.000355707 0.000422619 0.000450276 0.000394844 0.000381906 0.000493833 0.000487276 0.000595628 0.000284056 0.000367401 0.000536799 0.000556095 0.000411319 0.000408193 0.000382598 0.000264791 0.000351707 0.000232239 0.000303341 0.00126633 0.00312749 0.00334517 0.000723442 0.00136296 0.00052856 0.000406226 0.000348464 0.000253957 0.000144886 0.000296579 7.1005e-05 0.000111051 0.000137014 0.000172352 0.000122229 0.000202941 8.56597e-05 0.000110037 0.000149264 0.000103599 0.000131421 9.74323e-05 0.000141332 0.00010132 0.000479872 0.000304047 0.00053971 0.00105124 0.000509002 0.00131509 0.000961026 0.00135714 0.00164164 0.00409283 0.00369321 0.00278924 0.00510647 0.00137291 0.00218882 0.0020034 0.00375292 0.00183834 0.00156212 0.00173639 0.00741994 0.00723695 0.00565251 0.00447995 0.00382161 0.00333125 0.00409168 0.00454095 0.00374295 0.00292682 0.00138209 0.000761567 0.000603549 2.99724e-05 3.17075e-05 0.000119766 5.24671e-05 9.88225e-05 0.000137646 5.66036e-05 6.69254e-05 0.000116798 0.000282813 0.000117005 0.00017067 0.000185974 0.0115467 0.0115467
# 5_OR_NTWL 0.00013127 0.000131286 0.000131303 3.37936e-05 8.16509e-06 8.39186e-06 4.76292e-06 7.93812e-06 1.11133e-05 1.45152e-05 1.76904e-05 2.08656e-05 2.42677e-05 2.74431e-05 3.06186e-05 3.37943e-05 3.71969e-05 4.0373e-05 4.35492e-05 4.69526e-05 5.01293e-05 5.33064e-05 5.67106e-05 5.98882e-05 6.30662e-05 6.62445e-05 6.965e-05 7.2829e-05 7.60084e-05 7.9415e-05 8.25952e-05 8.57757e-05 8.91837e-05 9.23654e-05 9.55476e-05 9.80495e-05 0.000163652 0.000280353 0.000255669 0.000205303 6.54161e-05 0.000107667 0.000116078 0.000104272 0.00024922 0.000296992 0.000293214 0.0001671 0.00036996 0.000496196 0.000691764 0.00172353 0.000453717 0.000300854 0.000393822 0.000207856 0.000350529 0.000237749 0.000223919 0.000174566 0.000167831 8.84857e-05 0.000104425 0.000131296 8.48768e-05 0.000189197 3.89259e-05 8.10639e-05 5.47764e-05 0.000156075 0.000145414 0.000133586 0.000300467 0.000622626 0.000651728 0.00118538 0.00119776 0.00175453 0.00128181 0.00145699 0.00241382 0.00258283 0.00291834 0.00179287 0.00207601 0.00223187 0.0053549 0.0098942 0.00790208 0.00810923 0.0144552 0.0218759 0.0186007 0.0208467 0.0219129 0.0216353 0.0380348 0.00320377 0.0121137 0.0120288 0.0408395 0.0491818 0.0495292 0.0547289 0.0831026 0.130175 0.134506 0.0941098 0.0266646 0.00953739 0.000384913 0.000172033 0.000561471 0.00015342 0.000243051 0.000329337 0.000124284 0.000151865 0.000219564 0.000562647 0.000236263 0.000309816 0.000317517 0.0217617 0.0217617
# 6_WA_NTWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000293569 0.000255929 0.000274774 0.0003209 0.000341901 0.000461942 0.000456057 0.000152913 3.81632e-05 0.000133651 3.56027e-05 2.98266e-05 1.4484e-05 0.000146771 0.000119632 0.000166284 0.000278183 0.000166515 9.09996e-05 0.000188291 0.0117716 0.0117716
# 7_CA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000101339 0.000203012 0.000233441 0.00031209 0.000391261 0.000470262 0.000549276 0.000627721 0.000707258 0.000839215 0.00082553 0.000722659 0.00103996 0.000961648 0.000511096 0.00048781 0.000400527 0.000538228 0.00094418 0.00076566 0.00153585 0.00199565 0.00243609 0.00288686 0.00252798 0.00216341 0.00272379 0.00329903 0.00368557 0.00345596 0.00588188 0.00475574 0.00370821 0.00260295 0.00317781 0.0033848 0.0031005 0.00472938 0.00513646 0.00541534 0.0057765 0.00633066 0.00798799 0.00700231 0.00931524 0.0109911 0.0117287 0.0115773 0.0129604 0.0126057 0.0123248 0.0140012 0.0127906 0.011583 0.0196068 0.00801791 0.00779502 0.0116969 0.0174266 0.0141841 0.0125527 0.007847 0.00682206 0.00689952 0.00691333 0.00585621 0.00390152 0.00765441 0.00522718 0.00895045 0.00243213 0.00522 0.0056902 0.00260165 0.000535319 0.00157792 0.000873886 0.000199233 0.00058214 0.000466265 0.000134902 0.00159838 0.00132214 0.00174304 0.000314265 0.000361426 0.000334578 0.0538876 0.0538876
# 8_OR_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00282704 0.00651089 0.00542855 0.000896759 0.00441884 0.0138523 0.00315636 0.00746094 0.0138576 0.00701367 0.0102846 0.0105552 0.013448 0.0205341 0.0256558 0.0267526 0.0129317 0.0265743 0.0289795 0.0225157 0.00959863 0.00493349 0.00301685 0.00258182 0.00076175 0.00120051 0.000625346 0.000465315 0.000359435 0.000413077 0.000463264 0.000437689 0.000481078 0.000432074 0.000358547 0.0287279 0.0287279
# 9_WA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.32241e-05 0 0 0 0 0 0 0 0.000298995 0.000135254 0.0003529 0.000517316 0.00042525 0.000350706 0.000229492 0.000268153 0.000466771 0.000746986 0.000364676 0.000613803 0.00105863 0.000913171 0.00104275 0.000987957 0.00110743 0.00220831 0.00213782 0.00121103 0.000989656 0.000915631 0.000930374 0.00145005 0.000839985 0.000577614 0.000493181 0.000235886 0.000215511 9.06715e-05 0.000124562 6.0068e-05 6.11807e-05 5.49402e-05 6.42598e-05 7.24776e-05 0.000104427 8.05497e-05 9.5312e-05 0.000126941 0.00634293 0.00634293
# 10_CA_AHSOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.17506e-05 2.09813e-05 0 1.09805e-05 5.76724e-07 1.05317e-05 7.61485e-05 1.51978e-06 1.56462e-06 9.5447e-07 0 6.52368e-07 0 4.9605e-06 8.65228e-06 2.01306e-06 6.79272e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.42474e-07 0 6.32478e-07 0 0 0 9.21772e-07 2.05511e-05 2.05511e-05
# 11_OR_ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000264382 5.46955e-05 0.000427924 0.000411215 0.000332312 6.60719e-05 1.01477e-05 0.000123754 8.8147e-05 0.000393823 7.40395e-05 0.000244446 0.000407872 0.000205265 0.000282799 0.000259731 1.58054e-05 3.77545e-05 4.5848e-05 5.38448e-05 8.98867e-06 0.000216713 0.000126471 1.20378e-05 0.000123047 0.000394941 0.00106083 7.4234e-05 0.000809059 0.000125179 0.000107351 0.000208125 0.000139714 1.50027e-05 1.05739e-05 8.30129e-06 1.79121e-05 2.683e-05 3.13373e-05 0.00125554 0.00125554
# 12_WA_ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.68222e-05 1.98538e-05 5.55447e-05 1.05784e-05 0.000874332 0.000851917 6.89934e-05 9.37872e-05 0.000136411 0.000225707 8.58675e-05 3.9632e-05 7.59502e-05 6.07224e-05 8.7399e-05 2.77806e-05 0.000157641 1.0275e-05 3.65321e-05 0.000110217 0.000195613 0.000278785 9.3963e-05 0.000118085 0.000118489 2.69905e-05 3.06862e-05 3.87747e-05 2.92214e-05 3.27363e-05 0.000149582 9.90282e-05 5.00066e-05 4.34914e-05 1.35166e-05 2.0017e-05 1.25216e-05 0.00184524 0.00184524
# 13_CA_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00304999 0.00752154 0.00224221 0.000149665 0 0 7.62094e-05 0.00285498 0.00811241 0.0022207 0.00217306 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 14_OR_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00021272 0.0399888 0.000320722 0 0 0.00126888 0.0356971 0.00506134 0.00385393 0.00240138 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 15_WA_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.11964 0.0612478 0.033156 0.00530105 0.00868007 0.0162412 0.0337481 0.0521075 0.033112 0.0129097 0.0106403 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 16_CA_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.95148e-06 4.51447e-06 3.804e-05 7.28952e-06 1.38302e-05 3.4304e-06 4.33066e-06 9.21148e-07 6.09617e-07 9.08207e-07 4.20732e-06 4.77449e-06 0.000151011 0.000151011
# 17_OR_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.79305e-05 2.90689e-05 1.54623e-05 7.8733e-05 1.16547e-05 5.52791e-05 2.33464e-06 9.21808e-06 9.78584e-06 1.45329e-05 5.09519e-06 0.00010815 0.00194083 0.00194083
# 18_WA_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.70043e-05 3.81857e-05 4.36825e-06 0.000224355 1.83039e-05 1.14317e-05 5.11876e-06 4.97809e-05 3.18504e-05 5.534e-05 4.85042e-06 4.08903e-05 0.00241591 0.00241591
# 19_CA_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.1093e-05 0 0 3.01272e-05 0 0 0.00016173 0 0 4.1723e-05 0 0 3.55305e-05 0 0 4.90418e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 20_OR_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.89259e-05 0 0 0.000168013 0 0 0.00034963 0 0 0.000461048 0 0 0.0001817 0 0 5.29906e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 21_WA_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000192409 0 0 1.89279e-05 0 0 0.000448247 0 0 0.000650268 0 0 0.000309085 0 0 4.26384e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 22_CA_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.30027e-05 0 0 7.2383e-06 0 0 2.04599e-06 0 0 5.98235e-06 0 0 0 0 0 0 0 0 0 0 0 0
# 23_OR_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000219875 0 0 3.68885e-05 0 0 0.00010353 0 0 4.18493e-05 0 0 0 0 0 0 0 0 0 0 0 0
# 24_WA_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.34029e-06 0 0 6.42094e-06 0 0 2.48401e-05 0 0 1.57276e-05 0 0 0 0 0 0 0 0 0 0 0 0
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
        16         1         0         0         0         1  #  16_CA_NWFSC
        17         1         0         0         0         1  #  17_OR_NWFSC
        18         1         0         0         0         1  #  18_WA_NWFSC
        19         1         0         0         0         1  #  19_CA_Tri_early
        20         1         0         0         0         1  #  20_OR_Tri_early
        21         1         0         0         0         1  #  21_WA_Tri_early
        22         1         0         0         0         1  #  22_CA_Tri_late
        23         1         0         0         0         1  #  23_OR_Tri_late
        24         1         0         0         0         1  #  24_WA_Tri_late
        25         1         0         1         0         1  #  25_CA_prerec
        26         1         0         1         0         1  #  26_OR_prerec
        27         1         0         1         0         1  #  27_WA_prerec
        28         1         0         0         0         1  #  28_coastwide_NWFSC
        29         1         0         0         0         1  #  29_coastwide_Tri_early
        30         1         0         0         0         1  #  30_coastwide_Tri_late
        31         1         0         0         0         1  #  31_coastwide_prerec
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -2.87967             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_16_CA_NWFSC(16)
           -15            15     -0.784304             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_17_OR_NWFSC(17)
           -15            15       -1.3845             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_18_WA_NWFSC(18)
           -15            15      -1.21265             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_19_CA_Tri_early(19)
           -15            15      0.242654             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_20_OR_Tri_early(20)
           -15            15     -0.942104             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_21_WA_Tri_early(21)
           -15            15      -2.96037             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_22_CA_Tri_late(22)
           -15            15     -0.185762             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_23_OR_Tri_late(23)
           -15            15      -2.60697             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_24_WA_Tri_late(24)
           -15            15       -9.9322             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_25_CA_prerec(25)
             0             3           0.4           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_25_CA_prerec(25)
           -15            15      -9.90724             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_26_OR_prerec(26)
             0             3           0.4           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_26_OR_prerec(26)
           -15            15      -10.5657             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_27_WA_prerec(27)
             0             3           0.4           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_27_WA_prerec(27)
           -15            15     -0.808314             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_28_coastwide_NWFSC(28)
           -15            15     0.0620409             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_29_coastwide_Tri_early(29)
           -15            15      -1.68979             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_30_coastwide_Tri_late(30)
           -15            15      -8.23591             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_31_coastwide_prerec(31)
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
 24 0 0 0 # 1 1_CA_TWL
 15 0 0 1 # 2 2_OR_TWL
 15 0 0 1 # 3 3_WA_TWL
 24 0 0 0 # 4 4_CA_NTWL
 15 0 0 4 # 5 5_OR_NTWL
 15 0 0 4 # 6 6_WA_NTWL
 24 0 0 0 # 7 7_CA_REC
 15 0 0 7 # 8 8_OR_REC
 15 0 0 7 # 9 9_WA_REC
 24 0 0 0 # 10 10_CA_AHSOP
 15 0 0 10 # 11 11_OR_ASHOP
 15 0 0 10 # 12 12_WA_ASHOP
 15 0 0 1 # 13 13_CA_FOR
 15 0 0 13 # 14 14_OR_FOR
 15 0 0 13 # 15 15_WA_FOR
 24 0 0 0 # 16 16_CA_NWFSC
 15 0 0 16 # 17 17_OR_NWFSC
 15 0 0 16 # 18 18_WA_NWFSC
 24 0 0 0 # 19 19_CA_Tri_early
 15 0 0 19 # 20 20_OR_Tri_early
 15 0 0 19 # 21 21_WA_Tri_early
 24 0 0 0 # 22 22_CA_Tri_late
 15 0 0 22 # 23 23_OR_Tri_late
 15 0 0 22 # 24 24_WA_Tri_late
 0 0 0 0 # 25 25_CA_prerec
 0 0 0 0 # 26 26_OR_prerec
 0 0 0 0 # 27 27_WA_prerec
 15 0 0 16 # 28 28_coastwide_NWFSC
 15 0 0 19 # 29 29_coastwide_Tri_early
 15 0 0 22 # 30 30_coastwide_Tri_late
 0 0 0 0 # 31 31_coastwide_prerec
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
 10 0 0 0 # 2 2_OR_TWL
 10 0 0 0 # 3 3_WA_TWL
 10 0 0 0 # 4 4_CA_NTWL
 10 0 0 0 # 5 5_OR_NTWL
 10 0 0 0 # 6 6_WA_NTWL
 10 0 0 0 # 7 7_CA_REC
 10 0 0 0 # 8 8_OR_REC
 10 0 0 0 # 9 9_WA_REC
 10 0 0 0 # 10 10_CA_AHSOP
 10 0 0 0 # 11 11_OR_ASHOP
 10 0 0 0 # 12 12_WA_ASHOP
 10 0 0 0 # 13 13_CA_FOR
 10 0 0 0 # 14 14_OR_FOR
 10 0 0 0 # 15 15_WA_FOR
 10 0 0 0 # 16 16_CA_NWFSC
 10 0 0 0 # 17 17_OR_NWFSC
 10 0 0 0 # 18 18_WA_NWFSC
 10 0 0 0 # 19 19_CA_Tri_early
 10 0 0 0 # 20 20_OR_Tri_early
 10 0 0 0 # 21 21_WA_Tri_early
 10 0 0 0 # 22 22_CA_Tri_late
 10 0 0 0 # 23 23_OR_Tri_late
 10 0 0 0 # 24 24_WA_Tri_late
 10 0 0 0 # 25 25_CA_prerec
 10 0 0 0 # 26 26_OR_prerec
 10 0 0 0 # 27 27_WA_prerec
 10 0 0 0 # 28 28_coastwide_NWFSC
 10 0 0 0 # 29 29_coastwide_Tri_early
 10 0 0 0 # 30 30_coastwide_Tri_late
 10 0 0 0 # 31 31_coastwide_prerec
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   1_CA_TWL LenSelex
          13.1            65            40            50            50             0          4          0          0          0          0          0          2          2  #  Size_DblN_peak_1_CA_TWL(1)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_1_CA_TWL(1)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_1_CA_TWL(1)
             0             9         0.001           2.6            50             0          5          0          0          0          0          0          2          2  #  Size_DblN_descend_se_1_CA_TWL(1)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_1_CA_TWL(1)
            -5             5            -1             5            50             0          5          0          0          0          0          0          2          2  #  Size_DblN_end_logit_1_CA_TWL(1)
# 2   2_OR_TWL LenSelex
# 3   3_WA_TWL LenSelex
# 4   4_CA_NTWL LenSelex
        13.001            65            40            50            50             0          4          0          0          0          0          0          1          2  #  Size_DblN_peak_4_CA_NTWL(4)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_4_CA_NTWL(4)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          1          2  #  Size_DblN_ascend_se_4_CA_NTWL(4)
             0             9             9           2.6            50             0          5          0          0          0          0          0          1          2  #  Size_DblN_descend_se_4_CA_NTWL(4)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_4_CA_NTWL(4)
            -5             5             5             5            50             0          5          0          0          0          0          0          1          2  #  Size_DblN_end_logit_4_CA_NTWL(4)
# 5   5_OR_NTWL LenSelex
# 6   6_WA_NTWL LenSelex
# 7   7_CA_REC LenSelex
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_7_CA_REC(7)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_7_CA_REC(7)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_7_CA_REC(7)
             0             9           2.5           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_7_CA_REC(7)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_7_CA_REC(7)
            -5             5            -1             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_7_CA_REC(7)
# 8   8_OR_REC LenSelex
# 9   9_WA_REC LenSelex
# 10   10_CA_AHSOP LenSelex
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_10_CA_AHSOP(10)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_10_CA_AHSOP(10)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_10_CA_AHSOP(10)
             0             9         0.001           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_10_CA_AHSOP(10)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_10_CA_AHSOP(10)
            -5             5             5             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_10_CA_AHSOP(10)
# 11   11_OR_ASHOP LenSelex
# 12   12_WA_ASHOP LenSelex
# 13   13_CA_FOR LenSelex
# 14   14_OR_FOR LenSelex
# 15   15_WA_FOR LenSelex
# 16   16_CA_NWFSC LenSelex
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_16_CA_NWFSC(16)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_16_CA_NWFSC(16)
             0             9          8.99           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_16_CA_NWFSC(16)
             0             9             9           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_16_CA_NWFSC(16)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_16_CA_NWFSC(16)
            -5             5             5             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_16_CA_NWFSC(16)
# 17   17_OR_NWFSC LenSelex
# 18   18_WA_NWFSC LenSelex
# 19   19_CA_Tri_early LenSelex
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_19_CA_Tri_early(19)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_19_CA_Tri_early(19)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_19_CA_Tri_early(19)
             0             9          0.01           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_19_CA_Tri_early(19)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_19_CA_Tri_early(19)
            -5             5            -1             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_19_CA_Tri_early(19)
# 20   20_OR_Tri_early LenSelex
# 21   21_WA_Tri_early LenSelex
# 22   22_CA_Tri_late LenSelex
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_22_CA_Tri_late(22)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_22_CA_Tri_late(22)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_22_CA_Tri_late(22)
             0             9   9.99201e-16           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_22_CA_Tri_late(22)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_22_CA_Tri_late(22)
            -5             5          4.99             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_22_CA_Tri_late(22)
# 23   23_OR_Tri_late LenSelex
# 24   24_WA_Tri_late LenSelex
# 25   25_CA_prerec LenSelex
# 26   26_OR_prerec LenSelex
# 27   27_WA_prerec LenSelex
# 28   28_coastwide_NWFSC LenSelex
# 29   29_coastwide_Tri_early LenSelex
# 30   30_coastwide_Tri_late LenSelex
# 31   31_coastwide_prerec LenSelex
# 1   1_CA_TWL AgeSelex
# 2   2_OR_TWL AgeSelex
# 3   3_WA_TWL AgeSelex
# 4   4_CA_NTWL AgeSelex
# 5   5_OR_NTWL AgeSelex
# 6   6_WA_NTWL AgeSelex
# 7   7_CA_REC AgeSelex
# 8   8_OR_REC AgeSelex
# 9   9_WA_REC AgeSelex
# 10   10_CA_AHSOP AgeSelex
# 11   11_OR_ASHOP AgeSelex
# 12   12_WA_ASHOP AgeSelex
# 13   13_CA_FOR AgeSelex
# 14   14_OR_FOR AgeSelex
# 15   15_WA_FOR AgeSelex
# 16   16_CA_NWFSC AgeSelex
# 17   17_OR_NWFSC AgeSelex
# 18   18_WA_NWFSC AgeSelex
# 19   19_CA_Tri_early AgeSelex
# 20   20_OR_Tri_early AgeSelex
# 21   21_WA_Tri_early AgeSelex
# 22   22_CA_Tri_late AgeSelex
# 23   23_OR_Tri_late AgeSelex
# 24   24_WA_Tri_late AgeSelex
# 25   25_CA_prerec AgeSelex
# 26   26_OR_prerec AgeSelex
# 27   27_WA_prerec AgeSelex
# 28   28_coastwide_NWFSC AgeSelex
# 29   29_coastwide_Tri_early AgeSelex
# 30   30_coastwide_Tri_late AgeSelex
# 31   31_coastwide_prerec AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        13.001            65            40            50            50             0      4  # Size_DblN_peak_1_CA_TWL(1)_BLK2repl_2000
        13.001            65            40            50            50             0      4  # Size_DblN_peak_1_CA_TWL(1)_BLK2repl_2011
             0             9           4.3           4.2            50             0      5  # Size_DblN_ascend_se_1_CA_TWL(1)_BLK2repl_2000
             0             9           4.3           4.2            50             0      5  # Size_DblN_ascend_se_1_CA_TWL(1)_BLK2repl_2011
             0             9         0.001           2.6            50             0      5  # Size_DblN_descend_se_1_CA_TWL(1)_BLK2repl_2000
             0             9         0.001           2.6            50             0      5  # Size_DblN_descend_se_1_CA_TWL(1)_BLK2repl_2011
            -5             5            -1             5            50             0      5  # Size_DblN_end_logit_1_CA_TWL(1)_BLK2repl_2000
            -5             5            -1             5            50             0      5  # Size_DblN_end_logit_1_CA_TWL(1)_BLK2repl_2011
        13.001            65            40            50            50             0      4  # Size_DblN_peak_4_CA_NTWL(4)_BLK1repl_2000
             0             9           4.3           4.2            50             0      5  # Size_DblN_ascend_se_4_CA_NTWL(4)_BLK1repl_2000
             0             9             9           2.6            50             0      5  # Size_DblN_descend_se_4_CA_NTWL(4)_BLK1repl_2000
            -5             5             5             5            50             0      5  # Size_DblN_end_logit_4_CA_NTWL(4)_BLK1repl_2000
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
#      1    25     1     0     0     0     0     1     1  1933  2014    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      1    26     3     0     0     0     0     2     1  1933  2014    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     5     2     2     0     0     0     0     0     0     0
#      5     3     7     2     2     0     0     0     0     0     0     0
#      5     4     9     2     2     0     0     0     0     0     0     0
#      5     6    11     2     2     0     0     0     0     0     0     0
#      5     7    13     1     2     0     0     0     0     0     0     0
#      5     9    14     1     2     0     0     0     0     0     0     0
#      5    10    15     1     2     0     0     0     0     0     0     0
#      5    12    16     1     2     0     0     0     0     0     0     0
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
      4      1     0.128
      5      1     0.266
      4      2     0.128
      5      2     0.266
      4      3     0.128
      5      3     0.266
      4      4     0.325
      4      5     0.325
      4      6     0.325
      4      7     0.092
      5      7       0.1
      4      8     0.092
      5      8       0.1
      4      9     0.092
      5      9       0.1
      4     10     0.176
      5     10     0.235
      4     11     0.176
      5     11     0.235
      4     12     0.176
      5     12     0.235
      4     16     0.081
      4     17     0.081
      4     18     0.081
      4     19     0.093
      4     20     0.093
      4     21     0.093
      4     22     0.114
      4     23     0.114
      4     24     0.114
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 36 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 28 1 0 1
 1 29 1 0 1
 1 30 1 0 1
 1 31 1 0 1
 4 28 1 0 1
 4 29 1 0 1
 4 30 1 0 1
 4 31 1 0 1
 5 28 1 0 1
 5 29 1 0 1
 5 30 1 0 1
 5 31 1 0 1
 4 1 1 0.7034 1
 4 2 1 0.4561 1
 4 3 1 0.4429 1
 4 4 1 0.9871 1
 4 5 1 0.7753 1
 4 6 1 0.5091 1
 4 7 1 1 1
 4 8 1 1 1
 4 9 1 0.8585 1
 4 10 1 0.8889 1
 4 11 1 0.5509 1
 4 12 1 0.5351 1
 5 1 1 0.2966 1
 5 2 1 0.5439 1
 5 3 1 0.5571 1
 5 4 1 0.0129 1
 5 5 1 0.2247 1
 5 6 1 0.4909 1
 5 7 1 0 1
 5 8 1 0 1
 5 9 1 0.1415 1
 5 10 1 0.1111 1
 5 11 1 0.4491 1
 5 12 1 0.4649 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  0 #_CPUE/survey:_7
#  0 #_CPUE/survey:_8
#  0 #_CPUE/survey:_9
#  0 #_CPUE/survey:_10
#  0 #_CPUE/survey:_11
#  0 #_CPUE/survey:_12
#  0 #_CPUE/survey:_13
#  0 #_CPUE/survey:_14
#  0 #_CPUE/survey:_15
#  1 #_CPUE/survey:_16
#  1 #_CPUE/survey:_17
#  1 #_CPUE/survey:_18
#  1 #_CPUE/survey:_19
#  1 #_CPUE/survey:_20
#  1 #_CPUE/survey:_21
#  1 #_CPUE/survey:_22
#  1 #_CPUE/survey:_23
#  1 #_CPUE/survey:_24
#  1 #_CPUE/survey:_25
#  1 #_CPUE/survey:_26
#  1 #_CPUE/survey:_27
#  0 #_CPUE/survey:_28
#  0 #_CPUE/survey:_29
#  0 #_CPUE/survey:_30
#  0 #_CPUE/survey:_31
#  0.7034 #_lencomp:_1
#  0.4561 #_lencomp:_2
#  0.4429 #_lencomp:_3
#  0.9871 #_lencomp:_4
#  0.7753 #_lencomp:_5
#  0.5091 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  0.8585 #_lencomp:_9
#  0.8889 #_lencomp:_10
#  0.5509 #_lencomp:_11
#  0.5351 #_lencomp:_12
#  0 #_lencomp:_13
#  0 #_lencomp:_14
#  0 #_lencomp:_15
#  1 #_lencomp:_16
#  1 #_lencomp:_17
#  1 #_lencomp:_18
#  1 #_lencomp:_19
#  1 #_lencomp:_20
#  1 #_lencomp:_21
#  1 #_lencomp:_22
#  1 #_lencomp:_23
#  1 #_lencomp:_24
#  0 #_lencomp:_25
#  0 #_lencomp:_26
#  0 #_lencomp:_27
#  0 #_lencomp:_28
#  0 #_lencomp:_29
#  0 #_lencomp:_30
#  0 #_lencomp:_31
#  0.2966 #_agecomp:_1
#  0.5439 #_agecomp:_2
#  0.5571 #_agecomp:_3
#  0.0129 #_agecomp:_4
#  0.2247 #_agecomp:_5
#  0.4909 #_agecomp:_6
#  0 #_agecomp:_7
#  0 #_agecomp:_8
#  0.1415 #_agecomp:_9
#  0.1111 #_agecomp:_10
#  0.4491 #_agecomp:_11
#  0.4649 #_agecomp:_12
#  0 #_agecomp:_13
#  0 #_agecomp:_14
#  0 #_agecomp:_15
#  1 #_agecomp:_16
#  1 #_agecomp:_17
#  1 #_agecomp:_18
#  1 #_agecomp:_19
#  1 #_agecomp:_20
#  1 #_agecomp:_21
#  1 #_agecomp:_22
#  1 #_agecomp:_23
#  1 #_agecomp:_24
#  0 #_agecomp:_25
#  0 #_agecomp:_26
#  0 #_agecomp:_27
#  0 #_agecomp:_28
#  0 #_agecomp:_29
#  0 #_agecomp:_30
#  0 #_agecomp:_31
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
#  1 #_init_equ_catch13
#  1 #_init_equ_catch14
#  1 #_init_equ_catch15
#  1 #_init_equ_catch16
#  1 #_init_equ_catch17
#  1 #_init_equ_catch18
#  1 #_init_equ_catch19
#  1 #_init_equ_catch20
#  1 #_init_equ_catch21
#  1 #_init_equ_catch22
#  1 #_init_equ_catch23
#  1 #_init_equ_catch24
#  1 #_init_equ_catch25
#  1 #_init_equ_catch26
#  1 #_init_equ_catch27
#  1 #_init_equ_catch28
#  1 #_init_equ_catch29
#  1 #_init_equ_catch30
#  1 #_init_equ_catch31
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

