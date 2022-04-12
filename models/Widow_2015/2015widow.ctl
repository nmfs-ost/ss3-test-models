#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: 2015widow.dat // 2015widow.ctl
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
 0.01 0.3 0.141974 -2.51 0.52 3 5 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 40 16.65 27 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 35 60 50.2957 50 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.4 0.197364 0.15 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.4 0.172434 0.07 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.4 0.0373828 0.04 99 0 3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 1.736e-05 0 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 -3 10 2.962 2.962 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 -3 50 5.47 7 99 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.7747 -1 99 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -1 1 1 1 99 0 -99 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 0 1 0 0 99 0 -99 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.01 0.3 0.152264 -2.51 0.52 3 5 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 10 40 19.3514 27 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 35 60 44.8578 45 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.01 0.4 0.241512 0.19 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 0.01 0.4 0.103654 0.07 99 0 3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.01 0.4 0.0473758 0.04 99 0 3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
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
             1            20       10.6647            10            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
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
 2013 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
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
#  -0.000529327 -0.000608504 -0.000698934 -0.000801982 -0.000919085 -0.00105171 -0.00120126 -0.001369 -0.00155598 -0.0017631 -0.00199179 -0.00224492 -0.002527 -0.00284315 -0.00319832 -0.00359761 -0.00404625 -0.00455035 -0.00511672 -0.0057532 -0.00646886 -0.0072737 -0.00817918 -0.00919782 -0.0103436 -0.0116323 -0.0130808 -0.014707 -0.0165315 -0.0185768 -0.0208694 -0.0234391 -0.0263186 -0.0295418 -0.0331464 -0.037177 -0.0416934 -0.0467759 -0.0525261 -0.0590528 -0.066394 -0.0746031 -0.0837502 -0.0936285 -0.103986 -0.114834 -0.125979 -0.136982 -0.147864 -0.158224 -0.167336 -0.174198 -0.17762 -0.176131 -0.168302 -0.152928 -0.129967 -0.102088 -0.0764599 -0.0634464 -0.0692013 -0.0849949 -0.0880949 -0.0579893 -0.00100559 0.0691538 0.156981 0.209786 0.201156 0.0441006 1.52961 1.47518 -0.705435 -0.84124 -0.540368 0.143856 -1.05656 0.657885 1.11769 -0.077415 0.527323 1.01908 0.394813 -0.089918 0.496162 0.189164 -0.482202 0.426494 -0.128786 -0.377725 0.0366466 0.552913 -0.385674 -0.189057 -0.267041 -0.658301 -0.972926 -0.666558 -0.0267242 -0.0703353 -0.021511 -0.582536 -0.7155 -0.587179 0.383213 -1.00038 0.187344 -0.674168 1.27609 -0.299075 1.00315 -0.706045 -0.128567 0.367984 0.217469 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.05 # F ballpark value in units of annual_F
-1982 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
0.9 # max F (methods 2-4) or harvest fraction (method 1)
# F_Method 1:  no additional input needed
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# BottomTrawl 4.89977e-05 7.61689e-05 8.89324e-05 6.18515e-05 6.3174e-05 5.22643e-05 4.49842e-05 4.88227e-05 2.88002e-05 2.43519e-05 6.91059e-05 9.35379e-05 0.000132341 0.000186371 0.000166069 0.000162963 0.000177039 0.000276518 0.000245993 0.000238795 0.000202218 0.000288777 0.00026811 0.000336474 0.000608474 0.000758132 0.00108312 0.003817 0.00754407 0.0128361 0.00912537 0.00466606 0.00372114 0.00282437 0.00309281 0.00436348 0.00436739 0.00399864 0.00377153 0.00398023 0.00502438 0.00655993 0.00609877 0.00595179 0.00736383 0.00622446 0.00700816 0.00391579 0.00555445 0.0022467 0.00541577 0.00850294 0.0040728 0.00465937 0.00282431 0.00365429 0.00452692 0.00445656 0.00396698 0.0038179 0.00421419 0.00615209 0.0074744 0.0189537 0.0386547 0.0392555 0.0753666 0.144723 0.073114 0.0578291 0.0781706 0.087255 0.0883269 0.103044 0.139613 0.112225 0.127755 0.173305 0.12748 0.14522 0.134726 0.143289 0.127957 0.0825275 0.00298834 0.00216368 0.0012803 0.000247097 0.00052974 0.000182711 0.000323724 0.00024171 0.000102133 0.000189739 0.000204397 0.000420026 0.000896092 0.00103967 0.00132192 0.00328241 0.0030092 0.00279385 0.00263667 0.00252075 0.00243227 0.00236491 0.00231574 0.00228186 0.00225981 0.00224617 0.00223809
# MidwaterTrawl 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0621592 0.183696 0.346663 0.454588 0.104481 0.186151 0.161892 0.138252 0.198735 0.154439 0.205675 0.133128 0.0690127 0.0514928 0.0813851 0.0852012 0.0955378 0.0811905 0.106254 0.0393749 0.0928474 0.174543 0.0869406 0.0116964 0.000427111 0.00115642 0.00119027 0.000428555 4.91717e-05 0.00130641 0.00109387 0.00155667 0.000957066 0.000981908 0.00458043 0.00509412 0.0121733 0.010998 0.0103943 0.0101594 0.00999674 0.0098145 0.00967249 0.00960498 0.00959365 0.00960862 0.00962993 0.00964857
# Hake 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0374173 0.0409021 0.0211476 0.00389533 0.005966 0.00744845 0.00440451 0.00671949 0.00418427 0.00375415 0.00633693 0.000937959 0.0013588 0.00132515 0.00191155 0.00195457 0.00189956 0.00241538 0.00592375 0.00372535 0.00511492 0.00350476 0.00462134 0.0043198 0.0052291 0.0140661 0.0115714 0.00724565 0.0176113 0.014153 0.0273594 0.0126993 0.0212403 0.0131938 0.00997114 0.00775826 0.00558358 0.000891961 0.00151281 0.0044236 0.00495562 0.00543694 0.00492194 0.00293998 0.0022165 0.0029808 0.00344476 0.00314422 0.00555023 0.0137248 0.0123938 0.0114325 0.0108436 0.0104623 0.0101585 0.00990799 0.00972613 0.00961201 0.0095479 0.00951428 0.00949722
# Net 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000135459 0.000468589 0.00530284 0.00682614 0.0125728 0.0105196 0.0119346 0.0046436 0.00542666 0.00978419 0.00614763 0.00121698 0.00141721 0.00175658 0.00183245 0.000551714 0.000577035 0.00177085 0.000359338 0.000243714 0.000259072 7.2189e-07 1.39356e-05 0 3.77102e-06 0 7.15691e-05 0 4.69051e-06 0 0 0 0 5.05886e-07 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12 3.38329e-12
# HnL 0.000725809 0.00113047 0.00129943 0.000897755 0.000919815 0.000763458 0.000663719 0.000730057 0.000472516 0.00059964 0.000871522 0.000677882 0.000739126 0.000644178 0.000931007 0.000809433 0.000794339 0.000523658 0.000614932 0.000698728 0.00087487 0.000693273 0.000519134 0.00035882 0.000467409 0.000371108 0.000137375 0.000227475 0.000411029 0.000715512 0.000758041 0.000992641 0.000443662 0.000486009 0.000703868 0.000548513 0.000449547 0.000157271 0.000245234 0.000212334 0.000482584 0.000439941 0.000430031 0.000340431 0.000262604 0.0001848 0.000189639 0.000239659 0.000156879 0.000247379 0.000447803 0.000401035 0.000250304 0.000249894 0.000121592 0.000145741 0.000238953 0.000211077 0.000491059 0.000300608 0.000367992 0.000327753 0.00124831 0.000807259 0.0005072 0.000745421 0.00260476 0.000530592 0.000424732 0.000432051 0.00127874 0.000824511 0.00116723 0.000754567 0.00253003 0.00198542 0.00376045 0.002397 0.00197185 0.000666847 0.000856506 0.00100722 0.00240728 0.00124471 0.000431414 0.000229243 1.81107e-05 2.08534e-05 7.14448e-06 2.61651e-05 1.81117e-05 3.85628e-05 2.36388e-05 7.39378e-06 2.58112e-06 1.96569e-06 4.77357e-06 1.25169e-05 2.09579e-05 1.75573e-05 1.68325e-05 1.61828e-05 1.57019e-05 1.53657e-05 1.51287e-05 1.49647e-05 1.48539e-05 1.47808e-05 1.47332e-05 1.47027e-05 1.46832e-05
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
           -25            25      -5.69467             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_BottomTrawl(1)
             0             2      0.195172             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_BottomTrawl(1)
           -20             2      -10.6347             0            99             0          1          0          1       1983       1998         99          0          0  #  LnQ_base_Hake(3)
             0             2       0.45792             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_Hake(3)
           -25            25       -7.5397             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_JuvSurvey(6)
             0             2      0.929842             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_JuvSurvey(6)
            -4             4             0             0            99             0        -50          0          1       1980       2004         99          0          0  #  LnQ_base_Triennial(7)
             0             2             0             0            99             0         -2          0          0          0          0          0          0          0  #  Q_extraSD_Triennial(7)
           -25            25      -2.69701             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC(8)
             0             2             0             0            99             0         -2          0          0          0          0          0          0          0  #  Q_extraSD_NWFSC(8)
           -25            25      -11.4541             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ForeignAtSea(9)
             0             2      0.619773             0            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_ForeignAtSea(9)
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
            10            59       47.8937            45          0.05             0          1          0          0          0          0        0.5          4          2  #  Size_DblN_peak_BottomTrawl(1)
            -5            10       2.49976             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_BottomTrawl(1)
            -4            12       4.73414             3          0.05             0          2          0          0          0          0        0.5          4          2  #  Size_DblN_ascend_se_BottomTrawl(1)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_BottomTrawl(1)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_BottomTrawl(1)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_BottomTrawl(1)
            -5            60        2.7843             0            99             0          4          0          0          0          0          0          2          2  #  Retain_L_infl_BottomTrawl(1)
          0.01             8        1.0544             1            99             0          4          0          0          0          0          0          2          2  #  Retain_L_width_BottomTrawl(1)
           -10            10       4.59512            10            99             0         -2          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_BottomTrawl(1)
           -10            10             0             0            99             0        -99          0          0          0          0          0          0          0  #  Retain_L_maleoffset_BottomTrawl(1)
# 2   MidwaterTrawl LenSelex
            10            59       39.3564            45          0.05             0          1          0          0          0          0        0.5          7          2  #  Size_DblN_peak_MidwaterTrawl(2)
           -10            10      -9.38652             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_MidwaterTrawl(2)
            -4            12       3.34391             3          0.05             0          2          0          0          0          0        0.5          7          2  #  Size_DblN_ascend_se_MidwaterTrawl(2)
            -2            10       3.31062            10          0.05             0          4          0          0          0          0        0.5          7          2  #  Size_DblN_descend_se_MidwaterTrawl(2)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_MidwaterTrawl(2)
            -9             9      0.034232           0.5          0.05             0          4          0          0          0          0        0.5          7          2  #  Size_DblN_end_logit_MidwaterTrawl(2)
            -5            60            -5             0            99             0         -9          0          0          0          0          0          0          0  #  Retain_L_infl_MidwaterTrawl(2)
          0.01             8           1.2             1            99             0         -9          0          0          0          0          0          0          0  #  Retain_L_width_MidwaterTrawl(2)
           -10            10       4.59512            10            99             0         -2          0          0          0          0          0          7          2  #  Retain_L_asymptote_logit_MidwaterTrawl(2)
           -10            10             0             0            99             0        -99          0          0          0          0          0          0          0  #  Retain_L_maleoffset_MidwaterTrawl(2)
# 3   Hake LenSelex
            10            59        42.608            45          0.05             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Hake(3)
            -5            10        2.5008             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Hake(3)
            -4            12       3.66967             3          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Hake(3)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Hake(3)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Hake(3)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Hake(3)
# 4   Net LenSelex
            10            59       42.9002            45          0.05             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Net(4)
            -5            10       2.50122             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Net(4)
            -4            12       3.58809             3          0.05             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Net(4)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Net(4)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Net(4)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Net(4)
# 5   HnL LenSelex
            10            59       23.2929            45          0.05             0          1          0          0          0          0        0.5          5          2  #  Size_DblN_peak_HnL(5)
            -5            10       2.50047             5          0.05             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_HnL(5)
            -5            12       2.95928             3          0.05             0          2          0          0          0          0        0.5          5          2  #  Size_DblN_ascend_se_HnL(5)
            -2            10             9            10          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_HnL(5)
            -9            10            -9           0.5          0.05             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_HnL(5)
            -9             9             8           0.5          0.05             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_HnL(5)
            -5            60       26.4108             0            99             0          2          0          0          0          0          0          3          2  #  Retain_L_infl_HnL(5)
          0.01             8       1.06629             1            99             0          3          0          0          0          0          0          3          2  #  Retain_L_width_HnL(5)
           -10            10       1.94508            10            99             0          1          0          0          0          0          0          3          2  #  Retain_L_asymptote_logit_HnL(5)
           -10            10             0             0            99             0        -99          0          0          0          0          0          0          0  #  Retain_L_maleoffset_HnL(5)
# 6   JuvSurvey LenSelex
# 7   Triennial LenSelex
             0             2             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_Triennial(7)
        -0.001             1      0.154366             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_Triennial(7)
            -1             1       0.32315             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_Triennial(7)
             8            56            24           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_1_Triennial(7)
             8            56            34           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_2_Triennial(7)
             8            56            48           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_3_Triennial(7)
           -10            10      -2.30729           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_1_Triennial(7)
           -10            10            -1           -10            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Val_2_Triennial(7)
           -10            10       0.76829           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_3_Triennial(7)
# 8   NWFSC LenSelex
             0             2             0             0             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Code_NWFSC(8)
        -0.001             1      0.523989             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradLo_NWFSC(8)
            -1             1    -0.0502052             0             0             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_GradHi_NWFSC(8)
             8            56            24           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_1_NWFSC(8)
             8            56            34           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_2_NWFSC(8)
             8            56            48           -10             0             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Knot_3_NWFSC(8)
           -10            10      -2.67261           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_1_NWFSC(8)
           -10            10            -1           -10            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSpline_Val_2_NWFSC(8)
           -10            10      0.288981           -10            99             0          2          0          0          0          0        0.5          0          0  #  SizeSpline_Val_3_NWFSC(8)
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
            10            59       39.8319            45          0.05             0      1  # Size_DblN_peak_BottomTrawl(1)_BLK4repl_1916
            -4            12       3.56888             3          0.05             0      2  # Size_DblN_ascend_se_BottomTrawl(1)_BLK4repl_1916
            -5            50       14.1647            34            99             0      3  # Retain_L_infl_BottomTrawl(1)_BLK2repl_1982
            -5            50       21.2724            34            99             0      3  # Retain_L_infl_BottomTrawl(1)_BLK2repl_1990
          0.01             5       0.70835             1            99             0      3  # Retain_L_width_BottomTrawl(1)_BLK2repl_1982
          0.01             5      0.508698             1            99             0      3  # Retain_L_width_BottomTrawl(1)_BLK2repl_1990
           0.2             1      0.999999             1            99             0      2  # Retain_L_asymptote_logit_BottomTrawl(1)_BLK1repl_1982
           0.2             1      0.913612             1            99             0      2  # Retain_L_asymptote_logit_BottomTrawl(1)_BLK1repl_1990
           0.2             1      0.200128             1            99             0      2  # Retain_L_asymptote_logit_BottomTrawl(1)_BLK1repl_1998
            10            59       39.0603            45          0.05             0      1  # Size_DblN_peak_MidwaterTrawl(2)_BLK7repl_1916
            10            59       38.4089            45          0.05             0      1  # Size_DblN_peak_MidwaterTrawl(2)_BLK7repl_1983
            10            59       37.6835            45          0.05             0      1  # Size_DblN_peak_MidwaterTrawl(2)_BLK7repl_2002
            -4            12       3.44394             3          0.05             0      2  # Size_DblN_ascend_se_MidwaterTrawl(2)_BLK7repl_1916
            -4            12       3.17582             3          0.05             0      2  # Size_DblN_ascend_se_MidwaterTrawl(2)_BLK7repl_1983
            -4            12       2.94575             3          0.05             0      2  # Size_DblN_ascend_se_MidwaterTrawl(2)_BLK7repl_2002
            -2            10       3.78297            10          0.05             0      4  # Size_DblN_descend_se_MidwaterTrawl(2)_BLK7repl_1916
            -2            10       3.16225            10          0.05             0      4  # Size_DblN_descend_se_MidwaterTrawl(2)_BLK7repl_1983
            -2            10      -1.66076            10          0.05             0      4  # Size_DblN_descend_se_MidwaterTrawl(2)_BLK7repl_2002
            -9             9      -1.47381           0.5          0.05             0      4  # Size_DblN_end_logit_MidwaterTrawl(2)_BLK7repl_1916
            -9             9     -0.486066           0.5          0.05             0      4  # Size_DblN_end_logit_MidwaterTrawl(2)_BLK7repl_1983
            -9             9       1.50323           0.5          0.05             0      4  # Size_DblN_end_logit_MidwaterTrawl(2)_BLK7repl_2002
           0.2             1          0.99             1            99             0      -2  # Retain_L_asymptote_logit_MidwaterTrawl(2)_BLK7repl_1916
           0.2             1             1             1            99             0      2  # Retain_L_asymptote_logit_MidwaterTrawl(2)_BLK7repl_1983
           0.2             1      0.999906             1            99             0      2  # Retain_L_asymptote_logit_MidwaterTrawl(2)_BLK7repl_2002
            15            59       38.6281            45          0.05             0      1  # Size_DblN_peak_HnL(5)_BLK5repl_1916
            -4            12       4.14831             3          0.05             0      2  # Size_DblN_ascend_se_HnL(5)_BLK5repl_1916
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

