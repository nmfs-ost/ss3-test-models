#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: darkblotched_data.SS // darkblotched_control.SS
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
5 #_Nblock_Patterns
 1 1 9 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 2011 2014
 2011 2014
 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010
 1995 2004
 1914 1914
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
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 1.33e-06 2.11e-06 3.35e-06 5.32e-06 8.45e-06 1.34e-05 2.13e-05 3.38e-05 5.36e-05 8.51e-05 0.000135006 0.000214259 0.000340019 0.000539553 0.000856075 0.00135802 0.00215359 0.00341357 0.00540653 0.00855255 0.0135031 0.0212547 0.0332984 0.0517869 0.0796513 0.120502 0.17803 0.254617 0.349288 0.456148 0.565069 0.665136 0.74867 0.813 0.859534 0.891691 0.913216 0.927321 0.936433 0.942267 0.94598 0.948335 0.949824 0.950765 0.951359 0.951733 0.951969 0.952118 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.15 0.054 0.08 99 0 -3 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 1 20 15.1812 14.6 99 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 60 42.6657 42.5 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.3 0.198252 0.2 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.5 15 1.80803 3 99 0 5 0 0 0 0 0 0 0 # SD_young_Fem_GP_1
 0.5 15 2.1473 3 99 0 5 0 0 0 0 0 0 0 # SD_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 1.1486e-05 1.1486e-05 99 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.12536 3.12536 99 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 0 60 34.59 55 99 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.6429 -0.6429 99 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 150000 101100 101100 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 0 50000 44800 44800 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.01 0.15 0.0702145 0.08 99 0 3 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0 0 99 0 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 20 60 38.3553 42.5 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.05 0.3 0.245274 0.2 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 99 0 -3 0 0 0 0 0 0 0 # SD_young_Mal_GP_1
 0.5 15 1.7224 2.5 99 0 5 0 0 0 0 0 0 0 # SD_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 1.2238e-05 1.2238e-05 99 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.10647 3.10647 99 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # RecrDist_month_1
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
             5            12       8.01304             8            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.773         0.773         0.147             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
             0             2          0.75          0.75            99             0         -1          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_regime
            -1             1             0             0            99             0         -1          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
2 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1960 # first year of main recr_devs; early devs can preceed this era
2013 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1870 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 -5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1967.3 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1979.8 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2012 #_last_yr_fullbias_adj_in_MPD
 2013 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.8166 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1870E 1871E 1872E 1873E 1874E 1875E 1876E 1877E 1878E 1879E 1880E 1881E 1882E 1883E 1884E 1885E 1886E 1887E 1888E 1889E 1890E 1891E 1892E 1893E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  -0.0246085 -0.00127852 -0.00134235 -0.00140775 -0.00147612 -0.0015491 -0.0016219 -0.00169913 -0.00178171 -0.00186654 -0.0019537 -0.00204562 -0.00214245 -0.0022427 -0.00234649 -0.00245512 -0.00256852 -0.0026858 -0.00280759 -0.00293515 -0.00306779 -0.00320436 -0.00334567 -0.00349278 -0.00364525 -0.00380276 -0.00396539 -0.00413253 -0.0043048 -0.00448391 -0.00466771 -0.00485392 -0.00504519 -0.00524115 -0.00543743 -0.00563518 -0.0058356 -0.00603525 -0.00623349 -0.00643021 -0.00662557 -0.00682366 -0.00702348 -0.00722194 -0.00742131 -0.00761521 -0.00781029 -0.00800366 -0.00819293 -0.00837639 -0.00855416 -0.00872656 -0.00888918 -0.00904687 -0.00919285 -0.0093291 -0.00945746 -0.00957632 -0.00968386 -0.00978263 -0.00987026 -0.00994386 -0.010003 -0.0100326 -0.0100114 -0.00990152 -0.00962736 -0.00917626 -0.00841108 -0.00669733 -0.00466541 -0.00124999 0.00284551 0.00778169 0.0145308 0.0235423 0.0355211 0.0513098 0.0714242 0.0958838 0.123948 0.152455 0.176517 0.188946 0.182916 0.160385 0.127376 0.0921163 0.060338 0.0333896 0.00961195 -0.0105594 -0.0236891 -0.0221278 -0.00199374 0.0270053 0.038929 0.0156788 -0.0178261 -0.0124011 0.0614145 0.13775 -0.0460872 -0.248855 -0.335469 -0.494207 -0.138825 -0.529981 0.422615 0.242029 -0.0962679 0.717924 -0.457897 -0.872084 -0.387612 -0.136788 -0.200987 0.474412 -0.395195 -0.741049 -0.925014 -0.692883 -0.789302 -1.36931 0.340454 0.841522 -0.499532 -0.185165 -0.61076 1.5027 1.18 -0.964797 -0.0912061 0.0792793 0.584929 0.595894 0.364299 0.065865 1.39193 -0.522759 0.322662 0.197409 -0.587682 1.48427 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
4 # max F (methods 2-4) or harvest fraction (method 1)
4  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Shoreside 0 0.000553418 0.000878164 0.000908994 0.000585109 0.000615418 0.000524947 0.000482417 0.000582068 0.000591666 0.000674506 0.000911044 0.0007829 0.000776402 0.000826319 0.000902064 0.00111335 0.000703948 0.000687496 0.000653613 0.000750271 0.000509518 0.000580634 0.000718226 0.00101878 0.00140528 0.00179897 0.00207191 0.00792102 0.0172852 0.0299288 0.0179297 0.0149487 0.00865587 0.00726765 0.00807138 0.00935564 0.00986243 0.0083904 0.00984631 0.0116014 0.0153412 0.017905 0.0151122 0.0127138 0.015293 0.0142195 0.0153816 0.0164355 0.0118589 0.0217387 0.0198986 0.0199734 0.00790315 0.00818694 0.0123198 0.015205 0.0144456 0.00899387 0.0163477 0.0198977 0.0339779 0.0198317 0.0260822 0.0468253 0.0394095 0.0562527 0.0810536 0.0833143 0.100976 0.142626 0.105604 0.214508 0.162336 0.136605 0.196498 0.151397 0.0887673 0.163594 0.122926 0.112465 0.120608 0.14495 0.17774 0.0708814 0.0474987 0.0276411 0.0377339 0.0275837 0.0305601 0.0133234 0.0178523 0.0225091 0.0215725 0.0251868 0.0291127 0.0114537 0.00959023 0.0116214 0.00840612 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921 0.0689921
# ForeignPOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.182115 0.144947 0.133991 0.00930087 0.00900845 0.0167593 0.0225786 0.0468116 0.0213217 0.0181558 0.00735702 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# AtSeaHake 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000643839 0.000144158 6.52148e-05 0.000230941 0.00137488 0.000785442 0.000113586 0.000818466 0.0014237 0.000964337 0.000449156 0.00118468 0.000901837 0.000548261 0.00319606 0.00545306 0.003648 0.00102882 0.00202125 0.00722384 0.000950278 0.000663892 0.00256059 0.00197908 0.00132401 0.00185636 0.000456691 0.000567063 0.000816845 0.00108407 0.00100926 0.00106113 0.000547811 2.97618e-05 0.000664217 0.00094672 0.000196559 0.000430846 0.000689993 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303 0.00566303
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         1         1         0  #  AKSHLF
         5         1         0         0         0         0  #  AKSLP
         6         1         0         0         0         0  #  NWSLP
         7         1         0         1         0         0  #  NWCBO
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -10             2      0.449739             0            99             0          1          0          1       1980       2004         -5          0          0  #  LnQ_base_AKSHLF(4)
             0             1         0.023           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_AKSHLF(4)
            -4             4             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_AKSLP(5)
            -4             4             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_NWSLP(6)
            -4             4             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_NWCBO(7)
             0             1     0.0975774           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_NWCBO(7)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2             2             2           0.5             0      -5  # LnQ_base_AKSHLF(4)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_AKSHLF(4)_dev_autocorr
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
 24 1 0 0 # 1 Shoreside
 15 0 0 1 # 2 ForeignPOP
 24 0 0 0 # 3 AtSeaHake
 24 0 0 0 # 4 AKSHLF
 24 0 0 0 # 5 AKSLP
 24 0 0 0 # 6 NWSLP
 24 0 0 0 # 7 NWCBO
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
 11 0 0 0 # 1 Shoreside
 11 0 0 0 # 2 ForeignPOP
 11 0 0 0 # 3 AtSeaHake
 11 0 0 0 # 4 AKSHLF
 11 0 0 0 # 5 AKSLP
 11 0 0 0 # 6 NWSLP
 11 0 0 0 # 7 NWCBO
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Shoreside LenSelex
            20            45       34.1711            32            99             0          2          0          0          0          0          0          1          2  #  Size_DblN_peak_Shoreside(1)
            -6             4       -5.9423             0            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_top_logit_Shoreside(1)
            -1             9        2.6805             4            99             0          2          0          0          0          0          0          1          2  #  Size_DblN_ascend_se_Shoreside(1)
            -1             9       1.26562           5.5            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_descend_se_Shoreside(1)
            -5             9       -2.3463            -5            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Shoreside(1)
            -5             9      0.203981             5            99             0          3          0          0          0          0          0          1          2  #  Size_DblN_end_logit_Shoreside(1)
            15            70       25.0923            35            99             0          2          0          0          0          0          0          2          2  #  Retain_L_infl_Shoreside(1)
           0.1            10       1.66164             1            99             0          2          0          0          0          0          0          2          2  #  Retain_L_width_Shoreside(1)
           -10            10            10            10            99             0         -3          0          0          0          0          0          3          2  #  Retain_L_asymptote_logit_Shoreside(1)
             0             0             0             0            99             0         -3          0          0          0          0          0          0          0  #  Retain_L_maleoffset_Shoreside(1)
# 2   ForeignPOP LenSelex
# 3   AtSeaHake LenSelex
            20            45       32.6113            32            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_peak_AtSeaHake(3)
            -6             4      -5.89126             0            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_AtSeaHake(3)
            -1             9       3.70749             4            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_AtSeaHake(3)
            -1             9       1.63019           5.5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_AtSeaHake(3)
          -999             9          -999            -2            99             0         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_AtSeaHake(3)
            -5             9      0.302715             5            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_AtSeaHake(3)
# 4   AKSHLF LenSelex
            10            45       22.1785            23            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_peak_AKSHLF(4)
            -6             4      -5.96816            -1            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_AKSHLF(4)
            -1             9       3.42695             4            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_AKSHLF(4)
            -1             9       4.86954             6            99             0          4          0          0          0          0          0          4          2  #  Size_DblN_descend_se_AKSHLF(4)
          -999             9          -999            -4            99             0         -2          0          0          0          0          0          0          0  #  Size_DblN_start_logit_AKSHLF(4)
          -999             9          -999            -1            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_AKSHLF(4)
# 5   AKSLP LenSelex
            10            45       22.3685            28            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_peak_AKSLP(5)
            -6             4       -1.8259            -1            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_AKSLP(5)
            -1             9       1.89451             4            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_AKSLP(5)
            -1             9       3.35795             4            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_AKSLP(5)
          -999             9          -999            -4            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_AKSLP(5)
          -999             9          -999            -2            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_AKSLP(5)
# 6   NWSLP LenSelex
            10            45       24.7317            28            99             0          2          0          0          0          0          0          0          0  #  Size_DblN_peak_NWSLP(6)
            -6             4      -5.97746             1            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NWSLP(6)
            -1             9       3.06606             4            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NWSLP(6)
            -1             9       4.74957             4            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NWSLP(6)
          -999             9          -999            -4            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NWSLP(6)
          -999             9          -999             1            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NWSLP(6)
# 7   NWCBO LenSelex
             8            45       24.4731            20            99             0         -2          0          0          0          0          0          0          0  #  Size_DblN_peak_NWCBO(7)
            -6             4            -6            -1            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NWCBO(7)
            -1             9       4.13751             2            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NWCBO(7)
            -1             9             3             4            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NWCBO(7)
          -999             9          -999            -3            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NWCBO(7)
            -5             9     -0.841911             5            99             0         -3          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NWCBO(7)
# 1   Shoreside AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Shoreside(1)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Shoreside(1)
# 2   ForeignPOP AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_ForeignPOP(2)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_ForeignPOP(2)
# 3   AtSeaHake AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_AtSeaHake(3)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_AtSeaHake(3)
# 4   AKSHLF AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_AKSHLF(4)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_AKSHLF(4)
# 5   AKSLP AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_AKSLP(5)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_AKSLP(5)
# 6   NWSLP AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWSLP(6)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWSLP(6)
# 7   NWCBO AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWCBO(7)
             0           100            45           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWCBO(7)
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            20            45       32.7382            32            99             0      2  # Size_DblN_peak_Shoreside(1)_BLK1repl_2011
            -6             4      -3.50457             0            99             0      3  # Size_DblN_top_logit_Shoreside(1)_BLK1repl_2011
            -1             9       1.81654             4            99             0      2  # Size_DblN_ascend_se_Shoreside(1)_BLK1repl_2011
            -1             9       1.99882           5.5            99             0      3  # Size_DblN_descend_se_Shoreside(1)_BLK1repl_2011
            -5             9      -1.08657             5            99             0      3  # Size_DblN_end_logit_Shoreside(1)_BLK1repl_2011
            15            70       19.8826            35            99             0      2  # Retain_L_infl_Shoreside(1)_BLK2repl_2011
           0.1            10        2.2123             1            99             0      2  # Retain_L_width_Shoreside(1)_BLK2repl_2011
           -10            10      -0.20056          0.44            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2002
           -10            10      -0.39961           0.4            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2003
           -10            10       1.36611          0.82            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2004
           -10            10       1.08766          0.76            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2005
           -10            10      0.140033          0.52            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2006
           -10            10      0.155854          0.51            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2007
           -10            10     -0.148821          0.46            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2008
           -10            10    -0.0566226          0.45            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2009
           -10            10     0.0914739          0.51            99             0      3  # Retain_L_asymptote_logit_Shoreside(1)_BLK3repl_2010
            -1             9       4.72653             5            99             0      4  # Size_DblN_descend_se_AKSHLF(4)_BLK4repl_1995
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
#      3     1     1     0     0     0     0     1     1  1980  2004    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     3     1     2     0     0     0     0     0     0     0
#      5     2     4     1     2     0     0     0     0     0     0     0
#      5     3     5     1     2     0     0     0     0     0     0     0
#      5     4     6     1     2     0     0     0     0     0     0     0
#      5     6     7     1     2     0     0     0     0     0     0     0
#      5     7     8     2     2     0     0     0     0     0     0     0
#      5     8     9     2     2     0     0     0     0     0     0     0
#      5     9    10     3     2     0     0     0     0     0     0     0
#      5    20    19     4     2     0     0     0     0     0     0     0
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
      4      1  0.133114
      5      1  0.333243
      4      3  0.120528
      5      3  0.167389
      4      4  0.297514
      5      4  0.170828
      4      5  0.572078
      5      5   0.19336
      4      6  0.485021
      5      6  0.157214
      4      7  0.281543
      5      7  0.143452
 -9999   1    0  # terminator
#
2 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 4 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 4 1 1 0.5 1
 5 1 1 0.5 1
 4 3 1 0.5 1
 5 3 1 0.5 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 #_CPUE/survey:_1
#  0 0 #_CPUE/survey:_2
#  0 0 #_CPUE/survey:_3
#  1 1 #_CPUE/survey:_4
#  1 1 #_CPUE/survey:_5
#  1 1 #_CPUE/survey:_6
#  1 1 #_CPUE/survey:_7
#  1 1 #_discard:_1
#  0 0 #_discard:_2
#  0 0 #_discard:_3
#  0 0 #_discard:_4
#  0 0 #_discard:_5
#  0 0 #_discard:_6
#  0 0 #_discard:_7
#  0.5 0.5 #_lencomp:_1
#  0 0 #_lencomp:_2
#  0.5 0.5 #_lencomp:_3
#  1 1 #_lencomp:_4
#  1 1 #_lencomp:_5
#  1 1 #_lencomp:_6
#  1 1 #_lencomp:_7
#  0.5 0.5 #_agecomp:_1
#  0 0 #_agecomp:_2
#  0.5 0.5 #_agecomp:_3
#  1 1 #_agecomp:_4
#  1 1 #_agecomp:_5
#  1 1 #_agecomp:_6
#  1 1 #_agecomp:_7
#  1 1 #_init_equ_catch1
#  1 1 #_init_equ_catch2
#  1 1 #_init_equ_catch3
#  1 1 #_init_equ_catch4
#  1 1 #_init_equ_catch5
#  1 1 #_init_equ_catch6
#  1 1 #_init_equ_catch7
#  1 1 #_recruitments
#  1 1 #_parameter-priors
#  1 1 #_parameter-dev-vectors
#  1 1 #_crashPenLambda
#  0 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

