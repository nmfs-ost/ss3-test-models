#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#C 2015 Assessent of Petrale (Fish600 people) run with SS3.24O
#_data_and_control_files: petrale15.dat // petrale15.ctl
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
4 #_Nblock_Patterns
 5 3 3 1 #_blocks_per_pattern 
# begin and end years of blocks
 1973 1982 1983 1992 1993 2002 2003 2010 2011 2014
 2003 2009 2010 2010 2011 2014
 2003 2008 2009 2010 2011 2014
 1875 1875
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
2 #_Age(post-settlement)_for_L1;linear growth below this
17 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.005 0.5 0.145 -1.888 0.3333 3 6 0 0 0 0 0.5 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 45 15.8 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 35 80 54.4 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.04 0.5 0.13 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.01 1 0.19 3 0.8 0 3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 1 0.03 0 1 0 4 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 2.08296e-06 2.08296e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 1 5 3.4737 3.4737 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 10 50 33.1 33.1 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.743 -0.743 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.005 0.6 0.15 -1.58 0.3326 3 6 0 0 0 0 0.5 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 10 45 16.6 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 35 80 43.2 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 0.04 0.5 0.2 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 0.01 1 0.14 3 0.8 0 3 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 0.01 1 0.05 0 1 0 4 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -3 3 3.05e-06 3.05e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 -3 5 3.36054 3.36054 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 1 1 0.2 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 0 1 1 1 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 1 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_month_1
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
             5            20          9.64             9            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.9           0.8          0.09             6          5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.4           0.9             5             6        -99          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0           0.2             6         -2          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1959 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1845 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1944 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1964 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2011 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.8 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -4 #min rec_dev
 4 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1845E 1846E 1847E 1848E 1849E 1850E 1851E 1852E 1853E 1854E 1855E 1856E 1857E 1858E 1859E 1860E 1861E 1862E 1863E 1864E 1865E 1866E 1867E 1868E 1869E 1870E 1871E 1872E 1873E 1874E 1875E 1876E 1877E 1878E 1879E 1880E 1881E 1882E 1883E 1884E 1885E 1886E 1887E 1888E 1889E 1890E 1891E 1892E 1893E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
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
# Yr:  1876 1877 1878 1879 1880 1881 1882 1883 1884 1885 1886 1887 1888 1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# WinterN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.21323e-05 0.000157438 0.000266746 0.000382834 0.000446502 0.000568253 0.000816871 0.00109024 0.00126572 0.00139308 0.00162207 0.00189622 0.00217123 0.00242636 0.00274179 0.00311287 0.0035702 0.00407075 0.0093664 0.00770228 0.00886445 0.00314781 0.00182801 0.0039856 0.00955916 0.0120033 0.00714044 0.0242446 0.0178279 0.0167035 0.0240205 0.0570159 0.0252048 0.0335394 0.0334296 0.037638 0.0261865 0.0173646 0.0381895 0.0724423 0.0765577 0.0558559 0.0630122 0.0737446 0.0751107 0.103716 0.116611 0.122199 0.0658589 0.130553 0.179082 0.118239 0.0659927 0.0561965 0.0622415 0.10643 0.0892131 0.0801827 0.0701078 0.0821013 0.0624139 0.0623039 0.0437738 0.0466787 0.0443421 0.0449926 0.0365167 0.0310264 0.0394179 0.043585 0.0412106 0.0328915 0.0601527 0.058328 0.0330228 0.0572033 0.0518231 0.0519887 0.0153033 0.0122694 0.021237 0.025876 0.043364 0.0464025 0.0496569 0.0916587 0.0916587 0.0916587 0.0916587 0.0916587 0.0916587 0.0916587 0.0916587 0.0916587 0.0916587
# SummerN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.0088e-06 4.92729e-06 3.84109e-06 3.75002e-06 3.65863e-06 3.56692e-06 3.47485e-06 3.35717e-06 3.26427e-06 3.17097e-06 3.07725e-06 2.9831e-06 2.88851e-06 2.76783e-06 2.67225e-06 2.5762e-06 2.47966e-06 2.38263e-06 2.28511e-06 2.16104e-06 2.06232e-06 1.96565e-06 1.86859e-06 1.76658e-06 1.66035e-06 1.52687e-06 1.42274e-06 1.32022e-06 1.21852e-06 1.11729e-06 1.01489e-06 9.39346e-07 1.34966e-08 4.18853e-05 3.34885e-05 0.00223944 0.00694678 0.0114075 0.0161349 0.0189438 0.0229184 0.0320558 0.037406 0.0507672 0.0597899 0.0646052 0.109861 0.114945 0.0863486 0.0813625 0.114242 0.0865294 0.121325 0.105013 0.151145 0.118387 0.102735 0.0551484 0.0682066 0.0660795 0.0581067 0.085154 0.0912085 0.0760256 0.111947 0.131364 0.135845 0.0985664 0.107598 0.0952607 0.0983646 0.0810914 0.0828679 0.089898 0.111384 0.0956011 0.118366 0.158743 0.218615 0.238163 0.158098 0.126696 0.192844 0.203481 0.189697 0.0907466 0.149864 0.179787 0.133009 0.0899239 0.106358 0.0807579 0.0827412 0.0756287 0.056533 0.0461463 0.0399699 0.0398152 0.0334839 0.0398692 0.0366258 0.0344976 0.0446025 0.0372192 0.0416178 0.0413405 0.0483947 0.0472425 0.0488963 0.0708221 0.068048 0.0360814 0.0238186 0.0431119 0.0189625 0.0256103 0.0272898 0.0558635 0.0476704 0.0692599 0.0740653 0.0992386 0.0992386 0.0992386 0.0992386 0.0992386 0.0992386 0.0992386 0.0992386 0.0992386 0.0992386
# WinterS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00143685 0.000829897 0.000885728 0.00325082 0.00370656 0.00231961 0.00184703 0.0012204 0.000815289 0.00444852 0.00314706 0.000719922 0.00222849 0.00276956 0.00337956 0.00248973 0.00559456 0.0105773 0.0261304 0.0197741 0.010394 0.0166681 0.0273852 0.0414171 0.0275618 0.0266442 0.0278537 0.0306711 0.020693 0.0286586 0.030938 0.0307695 0.0333397 0.0242775 0.0242484 0.0212025 0.0349974 0.0237288 0.0275234 0.031357 0.0374494 0.051721 0.032327 0.0548479 0.0505372 0.0681706 0.0468597 0.0412593 0.0364243 0.0547869 0.0379786 0.0276027 0.028314 0.0255354 0.0248781 0.034475 0.0257287 0.0281563 0.0307048 0.0239916 0.0322181 0.0186258 0.015344 0.0150024 0.013623 0.0225827 0.0242796 0.011645 0.0145913 0.0184548 0.0149281 0.0159612 0.011971 0.00818405 0.0157961 0.00594371 0.0191914 0.0246786 0.0222862 0.00356889 0.00171498 0.00513857 0.00525288 0.0110692 0.0103202 0.0109634 0.0261467 0.0261467 0.0261467 0.0261467 0.0261467 0.0261467 0.0261467 0.0261467 0.0261467 0.0261467
# SummerS 2.03959e-05 2.03963e-05 2.03967e-05 2.0397e-05 0.000235613 0.000450968 0.000666584 0.000882571 0.00109903 0.00131605 0.00153371 0.00175207 0.0019712 0.00219114 0.00241194 0.00263364 0.00285627 0.00308006 0.00330462 0.00353019 0.00375678 0.00398441 0.00421309 0.00444283 0.00467365 0.00490554 0.00513853 0.00537263 0.00560783 0.00584416 0.00608162 0.00632021 0.00655996 0.00680085 0.00704291 0.00728615 0.00753056 0.00777617 0.00802297 0.00827099 0.00841225 0.011501 0.00929517 0.00732327 0.00505847 0.00643885 0.00931725 0.0093931 0.0117479 0.0116974 0.0115888 0.0141033 0.0139088 0.0159264 0.0149464 0.0121033 0.0119258 0.00905982 0.0210345 0.0186634 0.0105554 0.0185024 0.0228746 0.0274364 0.0165588 0.00950084 0.00643904 0.0108521 0.0146641 0.014796 0.0391966 0.0404111 0.0701647 0.0782228 0.078001 0.0506922 0.0461775 0.0516682 0.0569447 0.0565599 0.0430389 0.0556497 0.0530347 0.0405188 0.0364516 0.0603347 0.0528366 0.0628826 0.0614573 0.0571105 0.0622863 0.0593242 0.0591342 0.0571956 0.0734189 0.072792 0.0761501 0.0596719 0.0766022 0.0847166 0.073751 0.050219 0.0827419 0.102488 0.0756661 0.0994241 0.0557537 0.0394638 0.0339458 0.0448715 0.0316808 0.0478635 0.0344593 0.0336753 0.0290227 0.0230898 0.0217742 0.0156259 0.018816 0.0170877 0.0224966 0.0245978 0.0162396 0.0138859 0.0121983 0.0128818 0.00949384 0.00857325 0.012595 0.0255203 0.0219821 0.0230262 0.0200954 0.0121373 0.00567938 0.00343256 0.00452539 0.0114354 0.0145879 0.0171118 0.0182161 0.0329997 0.0329997 0.0329997 0.0329997 0.0329997 0.0329997 0.0329997 0.0329997 0.0329997 0.0329997
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         3         0         0         1         0  #  WinterN
         3         3         0         0         1         0  #  WinterS
         5         1         0         1         0         1  #  TriEarly
         6         1         0         1         0         1  #  TriLate
         7         1         0         0         0         1  #  NWFSC
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -20             5            -9             0            99             0          1          0          1       1987       2009         -5          0          0  #  LnQ_base_WinterN(1)
            -5             5          0.38             0            99             0          3          0          0          0          0          0          0          0  #  Q_power_WinterN(1)
           -20             5             0            -1            99             0         -1          0          1       1987       2009         -5          0          0  #  LnQ_base_WinterS(3)
            -5             5          0.16             0            99             0          3          0          0          0          0          0          0          0  #  Q_power_WinterS(3)
           -15            15      -1.65045             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TriEarly(5)
         0.001             2          0.28          0.22            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_TriEarly(5)
           -15            15      -1.59958             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TriLate(6)
         0.001             2          0.15          0.16            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_TriLate(6)
           -15            15      0.173499             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC(7)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_WinterN(1)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_WinterN(1)_dev_autocorr
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_WinterS(3)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_WinterS(3)_dev_autocorr
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
 24 1 3 0 # 1 WinterN
 24 1 3 0 # 2 SummerN
 24 1 3 0 # 3 WinterS
 24 1 3 0 # 4 SummerS
 24 0 3 0 # 5 TriEarly
 24 0 3 0 # 6 TriLate
 24 0 3 0 # 7 NWFSC
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
 10 0 0 0 # 1 WinterN
 10 0 0 0 # 2 SummerN
 10 0 0 0 # 3 WinterS
 10 0 0 0 # 4 SummerS
 10 0 0 0 # 5 TriEarly
 10 0 0 0 # 6 TriLate
 10 0 0 0 # 7 NWFSC
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   WinterN LenSelex
            15            75          46.6          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_WinterN(1)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_WinterN(1)
            -4            12           3.9          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_WinterN(1)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_WinterN(1)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_WinterN(1)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_WinterN(1)
            10            40         26.19            15             9             0          1          0          0          0          0          0          2          1  #  Retain_L_infl_WinterN(1)
           0.1            10         1.701             3             9             0          2          0          0          0          0          0          2          1  #  Retain_L_width_WinterN(1)
           -10            10       5.19749            10             9             0          4          0          0          0          0          0          2          1  #  Retain_L_asymptote_logit_WinterN(1)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_WinterN(1)
           -15            15          -8.8             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_WinterN(1)
           -15            15          -1.1             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_WinterN(1)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_WinterN(1)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_WinterN(1)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_WinterN(1)
# 2   SummerN LenSelex
            15            75          53.8          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_SummerN(2)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_SummerN(2)
            -4            12           5.3          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_SummerN(2)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_SummerN(2)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_SummerN(2)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_SummerN(2)
            10            40        30.679            15             9             0          1          0          0          0          0          0          3          1  #  Retain_L_infl_SummerN(2)
           0.1            10        1.1278             3             9             0          2          0          0          0          0          0          3          1  #  Retain_L_width_SummerN(2)
           -10            10       9.21024            10             9             0          4          0          0          0          0          0          3          1  #  Retain_L_asymptote_logit_SummerN(2)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_SummerN(2)
           -20            15         -13.7             0            -5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_SummerN(2)
           -15            15          -1.9             0            -5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_SummerN(2)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_SummerN(2)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_SummerN(2)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_SummerN(2)
# 3   WinterS LenSelex
            15            75        40.422          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_WinterS(3)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_WinterS(3)
            -4            12        4.5999          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_WinterS(3)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_WinterS(3)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_WinterS(3)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_WinterS(3)
            10            40        28.816            15             9             0          1          0          0          0          0          0          2          1  #  Retain_L_infl_WinterS(3)
           0.1            10        1.1443             3             9             0          2          0          0          0          0          0          2          1  #  Retain_L_width_WinterS(3)
           -10            10        4.2546            10             9             0          4          0          0          0          0          0          2          1  #  Retain_L_asymptote_logit_WinterS(3)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_WinterS(3)
           -15            15       -14.995             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_WinterS(3)
           -15            15       -2.4591             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_WinterS(3)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_WinterS(3)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_WinterS(3)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_WinterS(3)
# 4   SummerS LenSelex
            15            75       43.0793          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_SummerS(4)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_SummerS(4)
            -4            12        4.7717          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_SummerS(4)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_SummerS(4)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_SummerS(4)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_SummerS(4)
            10            40        29.055            15             9             0          1          0          0          0          0          0          3          1  #  Retain_L_infl_SummerS(4)
           0.1            10         0.976             3             9             0          2          0          0          0          0          0          3          1  #  Retain_L_width_SummerS(4)
           -10            10        7.6004            10             9             0          4          0          0          0          0          0          3          1  #  Retain_L_asymptote_logit_SummerS(4)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_SummerS(4)
           -15            15       -11.004             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_SummerS(4)
           -15            15         -1.44             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_SummerS(4)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_SummerS(4)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_SummerS(4)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_SummerS(4)
# 5   TriEarly LenSelex
            15            61       35.8319          43.1             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_TriEarly(5)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TriEarly(5)
            -4            12        4.2596          3.42             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_TriEarly(5)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_TriEarly(5)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TriEarly(5)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_TriEarly(5)
           -15            15       -3.7323             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_TriEarly(5)
           -15            15       -0.5322             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_TriEarly(5)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_TriEarly(5)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_TriEarly(5)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_TriEarly(5)
# 6   TriLate LenSelex
            15            61       36.9845          43.1             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_TriLate(6)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TriLate(6)
            -4            12        4.6735          3.42             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_TriLate(6)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_TriLate(6)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TriLate(6)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_TriLate(6)
           -15            15       -4.0542             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_TriLate(6)
           -15            15       -0.1367             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_TriLate(6)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_TriLate(6)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_TriLate(6)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_TriLate(6)
# 7   NWFSC LenSelex
            15            61       43.5877          43.1             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSC(7)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSC(7)
            -4            12        5.2029          3.42             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSC(7)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSC(7)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSC(7)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSC(7)
           -15            15       -5.8784             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_NWFSC(7)
           -15            15       -0.4792             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_NWFSC(7)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_NWFSC(7)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_NWFSC(7)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_NWFSC(7)
# 1   WinterN AgeSelex
# 2   SummerN AgeSelex
# 3   WinterS AgeSelex
# 4   SummerS AgeSelex
# 5   TriEarly AgeSelex
# 6   TriLate AgeSelex
# 7   NWFSC AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_1973
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_1983
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_1993
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_2003
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_L_infl_WinterN(1)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_L_infl_WinterN(1)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_L_infl_WinterN(1)_BLK2add_2011
            -3             2             0             0            99             0      4  # Retain_L_width_WinterN(1)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_L_width_WinterN(1)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_L_width_WinterN(1)_BLK2add_2011
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_WinterN(1)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_WinterN(1)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_WinterN(1)_BLK2add_2011
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_1973
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_1983
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_1993
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_2003
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_L_infl_SummerN(2)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_L_infl_SummerN(2)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_L_infl_SummerN(2)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_L_width_SummerN(2)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_L_width_SummerN(2)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_L_width_SummerN(2)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_SummerN(2)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_SummerN(2)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_SummerN(2)_BLK3add_2011
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_1973
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_1983
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_1993
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_2003
            -3             2             0             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_L_infl_WinterS(3)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_L_infl_WinterS(3)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_L_infl_WinterS(3)_BLK2add_2011
            -3             2             0             0            99             0      4  # Retain_L_width_WinterS(3)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_L_width_WinterS(3)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_L_width_WinterS(3)_BLK2add_2011
            -3             4             0             0            99             0      4  # Retain_L_asymptote_logit_WinterS(3)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_WinterS(3)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_WinterS(3)_BLK2add_2011
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_1973
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_1983
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_1993
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_2003
            -3             2             0             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_L_infl_SummerS(4)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_L_infl_SummerS(4)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_L_infl_SummerS(4)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_L_width_SummerS(4)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_L_width_SummerS(4)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_L_width_SummerS(4)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_SummerS(4)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_SummerS(4)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_L_asymptote_logit_SummerS(4)_BLK3add_2011
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
#      3     1     1     0     0     0     0     1     1  1987  2009    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      3     3     3     0     0     0     0     2     1  1987  2009    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     5     1     1     0     0     0     0     0     0     0
#      5     7    10     2     1     0     0     0     0     0     0     0
#      5     8    13     2     1     0     0     0     0     0     0     0
#      5     9    16     2     1     0     0     0     0     0     0     0
#      5    16    19     1     1     0     0     0     0     0     0     0
#      5    22    24     3     1     0     0     0     0     0     0     0
#      5    23    27     3     1     0     0     0     0     0     0     0
#      5    24    30     3     1     0     0     0     0     0     0     0
#      5    31    33     1     1     0     0     0     0     0     0     0
#      5    37    38     2     1     0     0     0     0     0     0     0
#      5    38    41     2     1     0     0     0     0     0     0     0
#      5    39    44     2     1     0     0     0     0     0     0     0
#      5    46    47     1     1     0     0     0     0     0     0     0
#      5    52    52     3     1     0     0     0     0     0     0     0
#      5    53    55     3     1     0     0     0     0     0     0     0
#      5    54    58     3     1     0     0     0     0     0     0     0
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
      2      1      0.02
      4      1      2.38
      5      1      6.26
      2      2      0.02
      4      2      1.89
      5      2      2.21
      2      3      0.02
      4      3      1.25
      5      3      1.83
      2      4      0.02
      4      4      1.34
      5      4       1.6
      4      5      1.59
      4      6      1.19
      4      7      0.59
      5      7      0.22
 -9999   1    0  # terminator
#
15 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 10 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 1 1 1 1
 1 3 1 1 1
 5 1 1 0.5 1
 5 2 1 0.5 1
 5 3 1 0.5 1
 5 4 1 0.5 1
 4 1 1 0.5 1
 4 2 1 0.5 1
 4 3 1 0.5 1
 4 4 1 0.5 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_1
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_CPUE/survey:_2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_3
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_4
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_5
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_6
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:7
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_1
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_2
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_3
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_7
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_1
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_2
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_3
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_4
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_agecomp:_5
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_agecomp:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_agecomp:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

