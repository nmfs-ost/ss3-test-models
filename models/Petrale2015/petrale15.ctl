#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C 2015 Assessent of Petrale (Fish600 people) run with SS3.24O
#_data_and_control_files: petrale15.dat // petrale15.ctl
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
 0.005 0.5 0.135998 -1.888 0.3333 3 6 0 0 0 0 0.5 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 45 15.9495 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 35 80 54.1996 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.04 0.5 0.136248 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.01 1 0.197241 3 0.8 0 3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 1 0.0254862 0 1 0 4 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 2.08296e-06 2.08296e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 1 5 3.4737 3.4737 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 10 50 33.1 33.1 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.743 -0.743 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.005 0.6 0.146246 -1.58 0.3326 3 6 0 0 0 0 0.5 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 10 45 16.5122 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 35 80 43.133 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 0.04 0.5 0.207967 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 0.01 1 0.141349 3 0.8 0 3 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 0.01 1 0.0466506 0 1 0 4 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
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
             5            20       9.53426             9            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1      0.892266           0.8          0.09             6          5          0          0          0          0          0          0          0 # SR_BH_steep
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
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
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
#  -2.43724e-05 -2.81053e-05 -3.23957e-05 -3.73243e-05 -4.29827e-05 -4.9475e-05 -5.69195e-05 -6.54498e-05 -7.5217e-05 -8.63911e-05 -9.91633e-05 -0.000113748 -0.000130386 -0.000149342 -0.000170913 -0.000195429 -0.000223251 -0.000254774 -0.000290431 -0.00033069 -0.000376064 -0.00042712 -0.000484496 -0.000548848 -0.000620678 -0.000700407 -0.000788828 -0.00088721 -0.000997122 -0.00112011 -0.00125767 -0.00141129 -0.00158304 -0.00177486 -0.00198899 -0.00222782 -0.00249397 -0.00279025 -0.0031197 -0.00348562 -0.00389146 -0.00434091 -0.00483781 -0.00538605 -0.00598955 -0.0066521 -0.00737724 -0.00816799 -0.0090265 -0.00995382 -0.0109489 -0.0120093 -0.0131294 -0.0142998 -0.0155075 -0.016734 -0.0179563 -0.0191452 -0.0202651 -0.0212746 -0.0221261 -0.0227671 -0.0231404 -0.0231845 -0.02284 -0.0220453 -0.0207388 -0.0188693 -0.0164142 -0.0134212 -0.0101211 -0.00694853 -0.00453689 -0.00368188 -0.00523206 -0.00993563 -0.0179587 -0.0282979 -0.0381659 -0.0424751 -0.0361988 -0.0185824 0.00491609 0.0265619 0.0414236 0.0487776 0.051533 0.0518653 0.0542342 0.0647614 0.0830552 0.107061 0.140515 0.162528 0.147561 0.0969213 0.0310257 -0.0275333 -0.06378 -0.0802546 -0.0972198 -0.152101 -0.248564 -0.315757 -0.338774 -0.326455 -0.308433 -0.27251 -0.188811 -0.112719 -0.0604005 -0.0498561 -0.0556465 -0.0748685 0.0323869 0.214828 0.147701 -0.255585 -0.18828 0.201871 0.147374 0.787706 0.0538662 0.029364 -0.0377637 0.0338149 -0.000247399 -0.250948 -0.428318 -0.157996 -0.13571 0.149212 0.0189477 -0.335345 -0.213319 -0.04849 -0.178883 -0.263777 -0.179843 0.248943 -0.174881 -0.740718 -0.504076 0.0218277 0.224198 0.210371 0.125534 -0.563744 0.0888984 0.394256 -0.197022 -0.029855 -0.0424796 0.680885 0.408936 -0.0730077 -0.20679 -0.113526 -0.341641 -0.202512 -0.183818 0.463628 0.659976 0.982405 0.114323 -0.171096 -0.272709 0.0511271 -1.63563e-05 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
4 # max F (methods 2-4) or harvest fraction (method 1)
5  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1876 1877 1878 1879 1880 1881 1882 1883 1884 1885 1886 1887 1888 1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# WinterN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.05312e-05 0.000152579 0.000258127 0.000369354 0.000428929 0.000542991 0.000775793 0.00102832 0.00118462 0.00129253 0.00148842 0.00171544 0.00193436 0.00213111 0.00237533 0.00266969 0.0030451 0.00346661 0.00800435 0.00666504 0.0078663 0.00289869 0.00176571 0.00406941 0.010342 0.0137968 0.00872808 0.031168 0.0238309 0.0231991 0.0346389 0.0850546 0.0383169 0.0505257 0.0491148 0.0543204 0.0376407 0.0248433 0.0534951 0.0953297 0.0917836 0.0592977 0.0638459 0.0742213 0.0775137 0.112604 0.138567 0.16728 0.104464 0.229545 0.344086 0.212066 0.131116 0.120497 0.146528 0.290506 0.28523 0.287804 0.28202 0.402717 0.383189 0.466472 0.301259 0.275556 0.241854 0.254464 0.216579 0.178467 0.219269 0.241381 0.220096 0.174132 0.268357 0.240026 0.13457 0.240572 0.235583 0.259509 0.0733365 0.0515501 0.0681578 0.0635697 0.0854342 0.0792872 0.0786826 0.0918298 0.0918298 0.0918298 0.0918298 0.0918298 0.0918298 0.0918298 0.0918298 0.0918298 0.0918298
# SummerN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.74371e-06 4.71138e-06 3.67405e-06 3.58834e-06 3.50242e-06 3.41627e-06 3.32987e-06 3.21898e-06 3.13192e-06 3.04453e-06 2.95677e-06 2.86863e-06 2.78005e-06 2.66632e-06 2.57668e-06 2.48648e-06 2.39567e-06 2.30419e-06 2.21199e-06 2.09379e-06 1.9998e-06 1.90744e-06 1.81429e-06 1.71589e-06 1.61296e-06 1.48319e-06 1.38163e-06 1.28142e-06 1.18194e-06 1.08299e-06 9.83164e-07 9.09717e-07 1.30729e-08 4.05977e-05 3.2493e-05 0.0021753 0.00675279 0.0110879 0.0156643 0.0183457 0.0221132 0.0307834 0.0357174 0.0481544 0.0562795 0.0602846 0.101389 0.104604 0.0774143 0.0719402 0.099637 0.0746607 0.103966 0.0896798 0.129284 0.10237 0.0909778 0.0506139 0.0655773 0.0670841 0.0624673 0.0972801 0.110971 0.0975585 0.149994 0.183814 0.198377 0.149478 0.166643 0.146487 0.148019 0.12024 0.122366 0.131658 0.158903 0.128133 0.145436 0.166574 0.219356 0.236321 0.1598 0.134112 0.222684 0.269431 0.289091 0.152743 0.276409 0.315288 0.258713 0.188541 0.244533 0.215477 0.259202 0.266651 0.224306 0.224511 0.243879 0.263596 0.202936 0.210694 0.18267 0.180707 0.244521 0.19723 0.214084 0.212489 0.238602 0.207211 0.183816 0.252556 0.245468 0.1354 0.0961336 0.198631 0.0830248 0.0973078 0.0795138 0.127546 0.0901451 0.115143 0.115394 0.084832 0.084832 0.084832 0.084832 0.084832 0.084832 0.084832 0.084832 0.084832 0.084832
# WinterS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00146636 0.000846661 0.000902279 0.00330307 0.00375285 0.00233863 0.00185345 0.00121833 0.000809106 0.00438374 0.0030746 0.000695857 0.00212774 0.00261421 0.00316363 0.00231816 0.00520489 0.00987261 0.0245594 0.0188227 0.010127 0.0168084 0.0288031 0.0456728 0.0319719 0.0324455 0.0355507 0.0409065 0.0284759 0.0403419 0.0447068 0.0457387 0.0505961 0.0367937 0.0360825 0.0312617 0.0517926 0.035 0.0394224 0.0420703 0.046835 0.0612192 0.0353019 0.0596181 0.0560785 0.0792568 0.058106 0.0556111 0.0543496 0.0884217 0.0649274 0.0512201 0.0699006 0.0686842 0.070572 0.105413 0.0888784 0.109114 0.130954 0.116212 0.189418 0.128825 0.109654 0.0961694 0.0775798 0.125305 0.141856 0.0691241 0.083326 0.103069 0.0823967 0.0816182 0.0520018 0.0314223 0.0595227 0.0231043 0.0784459 0.108394 0.104034 0.0208414 0.005812 0.0132447 0.0108961 0.0200009 0.0182128 0.0188897 0.0253885 0.0253885 0.0253885 0.0253885 0.0253885 0.0253885 0.0253885 0.0253885 0.0253885 0.0253885
# SummerS 2.00192e-05 2.00205e-05 2.00218e-05 2.00231e-05 0.000231308 0.000442755 0.000654488 0.000866621 0.00107926 0.00129249 0.00150641 0.0017211 0.00193661 0.00215303 0.00237041 0.0025888 0.00280827 0.00302906 0.00325082 0.00347382 0.0036981 0.00392372 0.00415073 0.00437918 0.00460913 0.00484064 0.00507378 0.00530859 0.00554514 0.00578346 0.00602361 0.00626561 0.00650946 0.00675517 0.00700268 0.00725191 0.00750276 0.00775506 0.00800858 0.00826306 0.00841021 0.0115048 0.00930164 0.00732937 0.00506207 0.00644107 0.00931513 0.00938438 0.0117287 0.0116723 0.0115624 0.0140768 0.0138965 0.0159345 0.0149748 0.0121364 0.0119559 0.00906939 0.0210002 0.018563 0.0104513 0.0182294 0.0224154 0.0267211 0.0160104 0.00910564 0.00610274 0.0101495 0.0135392 0.0135287 0.0355997 0.0366353 0.0637621 0.0714954 0.0720644 0.0478227 0.0450185 0.0525267 0.0607471 0.0635432 0.0508389 0.0690349 0.0688852 0.0543751 0.0500506 0.0850029 0.0765831 0.0933108 0.0913791 0.0831006 0.0890849 0.0850919 0.0851516 0.0807631 0.0976822 0.0891248 0.0870786 0.0611855 0.0783243 0.0880908 0.0798649 0.0580157 0.104388 0.143742 0.114817 0.158283 0.0957017 0.0749714 0.0705217 0.0990626 0.0758814 0.12899 0.102343 0.108892 0.107416 0.104535 0.113681 0.0884386 0.0949361 0.0774494 0.101135 0.118123 0.0794705 0.0652841 0.0562249 0.0588454 0.0400134 0.0392265 0.049999 0.0975904 0.0862674 0.0951976 0.0896583 0.0583909 0.0252494 0.0120134 0.0120027 0.0239522 0.0260605 0.028355 0.0294655 0.0307608 0.0307608 0.0307608 0.0307608 0.0307608 0.0307608 0.0307608 0.0307608 0.0307608 0.0307608
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
           -20             5      -10.5521             0            99             0          1          0          1       1987       2009         -5          0          0  #  LnQ_base_WinterN(1)
            -5             5      0.355251             0            99             0          3          0          0          0          0          0          0          0  #  Q_power_WinterN(1)
           -20             5             0            -1            99             0         -1          0          1       1987       2009         -5          0          0  #  LnQ_base_WinterS(3)
            -5             5     -0.926053             0            99             0          3          0          0          0          0          0          0          0  #  Q_power_WinterS(3)
           -15            15     -0.503945             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TriEarly(5)
         0.001             2      0.133525          0.22            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_TriEarly(5)
           -15            15     -0.189897             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TriLate(6)
         0.001             2      0.159346          0.16            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_TriLate(6)
           -15            15       1.25875             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC(7)
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
            15            75       45.5842          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_WinterN(1)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_WinterN(1)
            -4            12       3.88847          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_WinterN(1)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_WinterN(1)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_WinterN(1)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_WinterN(1)
            10            40       23.9854            15             9             0          1          0          0          0          0          0          2          1  #  Retain_L_infl_WinterN(1)
           0.1            10       2.51086             3             9             0          2          0          0          0          0          0          2          1  #  Retain_L_width_WinterN(1)
           -10            10       8.23301            10             9             0          4          0          0          0          0          0          2          1  #  Retain_L_asymptote_logit_WinterN(1)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_WinterN(1)
           -15            15       -9.0309             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_WinterN(1)
           -15            15      -1.27471             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_WinterN(1)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_WinterN(1)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_WinterN(1)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_WinterN(1)
# 2   SummerN LenSelex
            15            75       53.7813          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_SummerN(2)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_SummerN(2)
            -4            12       5.47833          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_SummerN(2)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_SummerN(2)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_SummerN(2)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_SummerN(2)
            10            40       31.5216            15             9             0          1          0          0          0          0          0          3          1  #  Retain_L_infl_SummerN(2)
           0.1            10         1.503             3             9             0          2          0          0          0          0          0          3          1  #  Retain_L_width_SummerN(2)
           -10            10       7.05538            10             9             0          4          0          0          0          0          0          3          1  #  Retain_L_asymptote_logit_SummerN(2)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_SummerN(2)
           -20            15       -14.663             0            -5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_SummerN(2)
           -15            15      -1.96201             0            -5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_SummerN(2)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_SummerN(2)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_SummerN(2)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_SummerN(2)
# 3   WinterS LenSelex
            15            75       42.4335          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_WinterS(3)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_WinterS(3)
            -4            12       4.53207          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_WinterS(3)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_WinterS(3)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_WinterS(3)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_WinterS(3)
            10            40       24.8722            15             9             0          1          0          0          0          0          0          2          1  #  Retain_L_infl_WinterS(3)
           0.1            10       1.41509             3             9             0          2          0          0          0          0          0          2          1  #  Retain_L_width_WinterS(3)
           -10            10       3.98919            10             9             0          4          0          0          0          0          0          2          1  #  Retain_L_asymptote_logit_WinterS(3)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_WinterS(3)
           -15            15      -12.8302             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_WinterS(3)
           -15            15      -2.61505             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_WinterS(3)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_WinterS(3)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_WinterS(3)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_WinterS(3)
# 4   SummerS LenSelex
            15            75       40.2859          43.1             5             0          1          0          0          0          0        0.5          1          1  #  Size_DblN_peak_SummerS(4)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_SummerS(4)
            -4            12       4.14151          3.42             5             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_SummerS(4)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_SummerS(4)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_SummerS(4)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_SummerS(4)
            10            40       28.5422            15             9             0          1          0          0          0          0          0          3          1  #  Retain_L_infl_SummerS(4)
           0.1            10      0.924945             3             9             0          2          0          0          0          0          0          3          1  #  Retain_L_width_SummerS(4)
           -10            10       9.64003            10             9             0          4          0          0          0          0          0          3          1  #  Retain_L_asymptote_logit_SummerS(4)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_L_maleoffset_SummerS(4)
           -15            15       -6.0437             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_SummerS(4)
           -15            15     -0.287555             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_SummerS(4)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_SummerS(4)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_SummerS(4)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_SummerS(4)
# 5   TriEarly LenSelex
            15            61       35.8457          43.1             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_TriEarly(5)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TriEarly(5)
            -4            12       4.30838          3.42             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_TriEarly(5)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_TriEarly(5)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TriEarly(5)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_TriEarly(5)
           -15            15      -3.53865             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_TriEarly(5)
           -15            15     -0.450461             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_TriEarly(5)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_TriEarly(5)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_TriEarly(5)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_TriEarly(5)
# 6   TriLate LenSelex
            15            61       37.1773          43.1             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_TriLate(6)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TriLate(6)
            -4            12       4.68893          3.42             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_TriLate(6)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_TriLate(6)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TriLate(6)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_TriLate(6)
           -15            15       -3.0559             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_TriLate(6)
           -15            15     -0.176868             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_TriLate(6)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_TriLate(6)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_TriLate(6)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_TriLate(6)
# 7   NWFSC LenSelex
            15            61       42.8526          43.1             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSC(7)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSC(7)
            -4            12       5.17249          3.42             5             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSC(7)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSC(7)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSC(7)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSC(7)
           -15            15      -5.93325             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_NWFSC(7)
           -15            15     -0.465104             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_NWFSC(7)
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
            -3             2     -0.396338             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_1973
            -3             2       -1.9247             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_1983
            -3             2      -1.17142             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_1993
            -3             2     -0.250745             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_2003
            -3             2      0.461514             0            99             0      4  # Size_DblN_peak_WinterN(1)_BLK1add_2011
            -3             2     -0.812158             0            99             0      4  # Retain_L_infl_WinterN(1)_BLK2add_2003
            -3             2      -1.99714             0            99             0      4  # Retain_L_infl_WinterN(1)_BLK2add_2010
            -3             2       1.47586             0            99             0      4  # Retain_L_infl_WinterN(1)_BLK2add_2011
            -3             2     -0.344305             0            99             0      4  # Retain_L_width_WinterN(1)_BLK2add_2003
            -3             2      -2.51086             0            99             0      4  # Retain_L_width_WinterN(1)_BLK2add_2010
            -3             2      -1.65651             0            99             0      4  # Retain_L_width_WinterN(1)_BLK2add_2011
            -3             2      -1.26839             0            99             0      4  # Retain_L_asymptote_logit_WinterN(1)_BLK2add_2003
            -3             2      -2.39339             0            99             0      4  # Retain_L_asymptote_logit_WinterN(1)_BLK2add_2010
            -3             2       1.91445             0            99             0      4  # Retain_L_asymptote_logit_WinterN(1)_BLK2add_2011
            -3             2      -1.01249             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_1973
            -3             2       -2.9872             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_1983
            -3             2      -2.99821             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_1993
            -3             2      -2.35743             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_2003
            -3             2     -0.289192             0            99             0      4  # Size_DblN_peak_SummerN(2)_BLK1add_2011
            -3             2     -0.659153             0            99             0      4  # Retain_L_infl_SummerN(2)_BLK3add_2003
            -3             2      0.846422             0            99             0      4  # Retain_L_infl_SummerN(2)_BLK3add_2009
            -3             2      -2.92164             0            99             0      4  # Retain_L_infl_SummerN(2)_BLK3add_2011
            -3             2    -0.0555741             0            99             0      4  # Retain_L_width_SummerN(2)_BLK3add_2003
            -3             2     0.0772762             0            99             0      4  # Retain_L_width_SummerN(2)_BLK3add_2009
            -3             2      0.156396             0            99             0      4  # Retain_L_width_SummerN(2)_BLK3add_2011
            -3             2     -0.431134             0            99             0      4  # Retain_L_asymptote_logit_SummerN(2)_BLK3add_2003
            -3             2    -0.0480971             0            99             0      4  # Retain_L_asymptote_logit_SummerN(2)_BLK3add_2009
            -3             2     0.0509394             0            99             0      4  # Retain_L_asymptote_logit_SummerN(2)_BLK3add_2011
            -3             2      -1.38623             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_1973
            -3             2       1.63526             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_1983
            -3             2       1.80394             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_1993
            -3             2       1.76351             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_2003
            -3             2       1.96632             0            99             0      4  # Size_DblN_peak_WinterS(3)_BLK1add_2011
            -3             2     -0.781079             0            99             0      4  # Retain_L_infl_WinterS(3)_BLK2add_2003
            -3             2      0.852179             0            99             0      4  # Retain_L_infl_WinterS(3)_BLK2add_2010
            -3             2      -0.82392             0            99             0      4  # Retain_L_infl_WinterS(3)_BLK2add_2011
            -3             2      0.662569             0            99             0      4  # Retain_L_width_WinterS(3)_BLK2add_2003
            -3             2       1.40879             0            99             0      4  # Retain_L_width_WinterS(3)_BLK2add_2010
            -3             2       1.34926             0            99             0      4  # Retain_L_width_WinterS(3)_BLK2add_2011
            -3             4       3.09838             0            99             0      4  # Retain_L_asymptote_logit_WinterS(3)_BLK2add_2003
            -3             2      -2.90049             0            99             0      4  # Retain_L_asymptote_logit_WinterS(3)_BLK2add_2010
            -3             2       1.44963             0            99             0      4  # Retain_L_asymptote_logit_WinterS(3)_BLK2add_2011
            -3             2      -2.79182             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_1973
            -3             2       -2.9956             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_1983
            -3             2      -1.21126             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_1993
            -3             2       1.99625             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_2003
            -3             2       1.97808             0            99             0      4  # Size_DblN_peak_SummerS(4)_BLK1add_2011
            -3             2      -1.49684             0            99             0      4  # Retain_L_infl_SummerS(4)_BLK3add_2003
            -3             2     -0.434177             0            99             0      4  # Retain_L_infl_SummerS(4)_BLK3add_2009
            -3             2      0.440115             0            99             0      4  # Retain_L_infl_SummerS(4)_BLK3add_2011
            -3             2       1.23087             0            99             0      4  # Retain_L_width_SummerS(4)_BLK3add_2003
            -3             2      0.882736             0            99             0      4  # Retain_L_width_SummerS(4)_BLK3add_2009
            -3             2      0.540538             0            99             0      4  # Retain_L_width_SummerS(4)_BLK3add_2011
            -3             2      0.135439             0            99             0      4  # Retain_L_asymptote_logit_SummerS(4)_BLK3add_2003
            -3             2     0.0501484             0            99             0      4  # Retain_L_asymptote_logit_SummerS(4)_BLK3add_2009
            -3             2      0.123715             0            99             0      4  # Retain_L_asymptote_logit_SummerS(4)_BLK3add_2011
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

