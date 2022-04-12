#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: B17.dat // B17.ctl
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
 10 30 13.7252 16 1000 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 25 45 38.3663 38 1000 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.185628 0.21 1000 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.5 0.0907016 0.1 1000 0 2 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.0679223 0.1 1000 0 2 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
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
 -3 3 -0.255959 -0.236 1000 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.569617 0.644 1000 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
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
             5            12        7.0536            10            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
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
 2029 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
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
#  -0.03674 -0.0688817 -0.106743 -0.141023 -0.171313 -0.193123 -0.19571 -0.169511 0.0397197 0.277073 0.117777 0.156462 -0.0191575 -0.0497822 0.0935767 0.087595 -0.0348756 0.0332945 0.398339 -0.12492 -0.31894 -0.284732 0.132217 0.555837 0.56325 0.726749 0.124698 0.224526 -0.598364 -0.361765 -0.39157 -0.699947 -0.347383 0.259158 0.244197 0.0392684 -1.09179 0.030626 0.267911 -0.620478 -0.0353942 -0.258426 -0.314329 0.793592 0.503194 0.199589 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.5 # F ballpark value in units of annual_F
-2002 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
4 # max F (methods 2-4) or harvest fraction (method 1)
4  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# COM_L 0.000266887 0.000266935 0.00026698 7.28188e-05 1.21363e-05 1.21358e-05 1.21353e-05 1.09003e-05 2.17999e-05 2.17994e-05 3.26986e-05 3.26983e-05 4.35976e-05 4.35977e-05 5.44974e-05 6.53976e-05 6.53987e-05 7.63002e-05 7.6302e-05 8.72044e-05 8.72067e-05 9.81101e-05 9.81128e-05 0.00010902 0.000109028 0.000119941 0.000119951 0.000130867 0.000130879 0.000141797 0.000152715 0.000152726 0.000163646 0.000163658 0.000174581 0.000174592 0.000294656 0.000567628 0.000578738 0.000436896 0.000120153 0.000207527 0.000218446 0.000185675 0.000513384 0.000753921 0.000787008 0.000612308 0.00102819 0.00112725 0.00155516 0.00364179 0.0017248 0.00107709 0.00138517 0.00112159 0.00365457 0.00348497 0.00156751 0.00244073 0.00277448 0.00134907 0.0106396 0.0102051 0.025102 0.0125269 0.00235637 0.00276168 0.00783708 0.00619928 0.00605094 0.00279359 0.00906479 0.00446119 0.00373742 0.00517971 0.00385608 0.00496688 0.00302029 0.00398191 0.00357418 0.00380471 0.00448445 0.00225968 0.0028409 0.00801537 0.00486077 0.0105971 0.007096 0.00635295 0.012644 0.0255894 0.0178013 0.0174242 0.0136863 0.0170356 0.00951366 0.01568 0.0271363 0.0270786 0.0674092 0.0424638 0.0317547 0.0207311 0.0117585 0.00500135 0.0198831 0.00463617 0.00841628 0.00709727 0.00514312 0.00713018 0.00728323 0.0065006 0.00603834 0.00567533 0.00377338 0.00401928 0.00579518 0.00959641 0.0101717 0.00780648 0.00609852 0.00263556 0.0036523 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153 0.0156153
# COM_D 2.94215e-05 2.94251e-05 2.94282e-05 5.88593e-06 0 0 0 0 0 5.88507e-06 5.88503e-06 5.885e-06 5.885e-06 5.88501e-06 5.88503e-06 5.88508e-06 1.17703e-05 1.17705e-05 1.17707e-05 1.17709e-05 1.17711e-05 1.17713e-05 1.17715e-05 1.1772e-05 1.76593e-05 1.76606e-05 1.76618e-05 1.76631e-05 1.76644e-05 1.76655e-05 1.76664e-05 1.76671e-05 2.35573e-05 2.35585e-05 2.35597e-05 2.35608e-05 4.12346e-05 7.65923e-05 7.66104e-05 5.89413e-05 1.76828e-05 2.94699e-05 2.94694e-05 2.35751e-05 7.07305e-05 0.000100224 0.000106149 8.25785e-05 0.0001357 0.000153459 0.00020668 0.000484771 0.000230802 0.000142067 0.000183529 0.000148029 0.000485915 0.000462832 0.000207814 0.000326665 0.000368466 0.000178335 0.00141223 0.00135276 0.00331239 0.00164753 0.000310261 0.000364272 0.00103171 0.000813683 0.000795521 0.00036406 0.00118943 0.000588966 0.000491382 0.000685107 0.000509025 0.000654138 0.000399489 0.000526348 0.000472213 0.000503558 0.000591151 0.000300619 0.000377671 0.00107322 0.000657177 0.00143625 0.000954122 0.000846001 0.00165569 0.00325728 0.00220298 0.00212654 0.00166634 0.00208944 0.00117303 0.00194419 0.003368 0.00334714 0.00827067 0.00518917 0.00389574 0.00255029 0.00142544 0.000582763 0.00219806 0.000498309 0.000913601 0.00080066 0.000617682 0.000909386 0.000970154 0.000892794 0.000834564 0.000766808 0.000502067 0.00052226 0.000754873 0.00123965 0.00131423 0.0010051 0.000786189 0.000297561 0.000402441 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063 0.00172063
# REC_O_L 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000941414 0.00188331 0.00283606 0.00378796 0.00475006 0.00572969 0.00676074 0.0078324 0.00896573 0.0174646 0.016792 0.00958301 0.0214126 0.0278896 0.0151778 0.00420114 0.00620668 0.0065099 0.010608 0.0191682 0.0135803 0.0219152 0.0648959 0.0076357 0.0211661 0.0265309 0.0604089 0.0591928 0.0364267 0.0328101 0.029777 0.0133472 0.0200133 0.0166862 0.0282167 0.0109099 0.0158596 0.0152295 0.0155475 0.0217612 0.0213325 0.0266907 0.0249169 0.0198205 0.0373294 0.0269443 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152 0.1152
# REC_O_D 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.7081e-05 0.000185333 0.000171756 9.27673e-05 0.000197531 0.000249759 0.000133175 3.80534e-05 5.71778e-05 5.72697e-05 9.57447e-05 0.000181411 0.000122919 0.000200886 0.0005917 7.33389e-05 0.00019838 0.0002259 0.000464505 0.000420013 0.000253552 0.000249183 0.000420749 7.54767e-05 0.000241138 0.000266735 0.000938652 0.000368935 0.000658252 0.000779619 0.00109109 0.000931022 0.000901333 0.000852255 0.000954386 0.000773184 0.00174862 0.000713859 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209 0.00305209
# REC_S 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.01458e-05 6.43046e-05 6.43086e-05 6.43124e-05 7.60099e-05 8.18617e-05 5.26278e-05 4.67816e-05 5.26306e-05 6.43284e-05 6.43308e-05 6.43331e-05 6.43352e-05 7.01877e-05 7.01967e-05 7.02081e-05 6.43647e-05 5.26623e-05 4.68089e-05 5.85103e-05 6.43607e-05 7.02156e-05 7.60792e-05 8.19475e-05 8.19595e-05 8.78294e-05 9.95659e-05 9.95994e-05 0.000111404 0.000105614 0.000117364 0.000146717 0.00017021 0.000187925 0.000193979 0.00019406 0.000217626 0.000235372 0.000235412 0.000247606 0.000242457 0.000249732 0.000262926 0.00025698 0.000256574 0.00026248 0.000268568 0.000274568 0.000292321 0.000304312 0.000316379 0.000328127 0.000328011 0.000304061 0.000327812 0.000351505 0.000357432 0.00039392 0.000425819 0.000435498 0.000452855 0.000447076 0.000448929 0.000496392 0.00052493 0.00053602 0.00121828 0.000538895 0.000391128 0.00029467 5.00811e-05 0.000697087 0.00096401 0.000800927 0.000282812 0.000573507 0.000579493 0.000594827 0.0012103 4.04655e-05 0.00198366 0.000782144 0.000358858 0.000186956 0.00163584 0.000463824 0.000664726 0.000290423 0.000360449 3.47181e-05 0.00155548 0.000760161 0.000761784 0.000781087 0.000802057 0.000803213 0.000819327 0.000842098 0.000866379 0.000876172 0.000848747 0.000795836 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258 0.00340258
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
           -15            15      -6.61331             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Logbook(6)
             0          0.75     0.0381374          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Logbook(6)
           -15            15       -7.0518             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Onboard(7)
             0          0.75     0.0758569          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Onboard(7)
           -15            15       -9.0379             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Dock_ORBS(8)
             0          0.75      0.159072          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Dock_ORBS(8)
           -15            15      -6.89326             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Dock_MRFSS(9)
             0          0.75      0.602707          0.05             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Dock_MRFSS(9)
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
            20            50       38.5171            35           0.5             0          4          0          0          0          0          0          3          2  #  Size_DblN_peak_COM_L(1)
           -12             0            -9            -9           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_COM_L(1)
             1            10       3.55384             4           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_COM_L(1)
             1            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_COM_L(1)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_COM_L(1)
           -11            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_COM_L(1)
# 2   COM_D LenSelex
            14            45       35.8878            25           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_COM_D(2)
           -12             0           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_COM_D(2)
             1            10       5.20661           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_COM_D(2)
             1            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_COM_D(2)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_COM_D(2)
           -11            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_COM_D(2)
# 3   REC_O_L LenSelex
            20            50       37.2958            30           0.5             0          4          0          0          0          0          0          3          2  #  Size_DblN_peak_REC_O_L(3)
           -12             0            -9            -9           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_REC_O_L(3)
             1            10       3.83915             4           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_REC_O_L(3)
             1            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_REC_O_L(3)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_REC_O_L(3)
           -11            10            10            10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_REC_O_L(3)
# 4   REC_O_D LenSelex
            14            30       29.6532            26           0.5             0          4          0          0          0          0          0          3          2  #  Size_DblN_peak_REC_O_D(4)
           -12             0           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_REC_O_D(4)
             1            10       4.00345           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_REC_O_D(4)
             1            10        3.2809           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_REC_O_D(4)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_REC_O_D(4)
           -11            -9           -10           -10           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_REC_O_D(4)
# 5   REC_S LenSelex
            10            40       22.2834            24           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_REC_S(5)
           -12             0            -9            -9           0.5             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_REC_S(5)
             1            10       3.77351           3.5           0.5             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_REC_S(5)
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
            20            50       37.7329            35           0.5             0      4  # Size_DblN_peak_COM_L(1)_BLK3repl_1899
            20            50       35.6025            30           0.5             0      4  # Size_DblN_peak_REC_O_L(3)_BLK3repl_1899
            14            30       26.1251            26           0.5             0      4  # Size_DblN_peak_REC_O_D(4)_BLK3repl_1899
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

