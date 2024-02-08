#V3.30.22.1;_safe;_compile_date:_Jan 30 2024;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-ost/ss3-source-code

#C 2015 Assessent of Kelp Greenling (Berger, Arnold, Rodomsky) run with SSv3.24u
#_data_and_control_files: BC_dat.ss // BC_ctl.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond sd_ratio_rd < 0: platoon_sd_ratio parameter required after movement params.
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
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
2 #_Nblock_Patterns
 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 2004 2014
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
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement) for L1 (aka Amin); first growth parameter is size at this age; linear growth below this
11 #_Age(post-settlement) for L2 (aka Amax); 999 to treat as Linf
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 0 0 0 0 0 0 0 0 0 0 0 0 0 0.115 0.25 0.7933 0.944 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 #_First_Mature_Age
1 #_fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.1 0.6 0.36 -1.02 0.437 3 -2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 -10 30 25.0907 20 10 6 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 60 36.4559 38.51 10 6 3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.1 1 0.260619 0.3 0.5 6 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.15 0.104781 0.1 0.8 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 -0.3 0.3 0 0 0.8 0 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 6.81e-06 6.81e-06 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 1 5 3.2114 3.2114 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 60 29.34 29.34 0.8 6 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -1 -1 0.8 6 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 0.8 6 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 0.8 6 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -0.6 0.6 -0.12516 -1.15 0.438 0 -2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -10 30 0 12 10 6 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -20 60 -0.0190692 37.33 10 6 3 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0 0 0.5 6 -3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -0.3 0.3 0 0 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -0.3 0.3 0 0 0.5 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 9.76e-06 9.76e-06 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 1 5 3.1164 3.1164 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution 
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Platoon StDev Ratio 
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
             5            15       7.25983             7            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.7           0.7          0.09             6         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2          0.65          0.45           0.2             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0           0.2             0         -3          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0         -3          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1980 # first year of main recr_devs; early devs can precede this era
2012 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1980 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1984 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2010 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.81 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F
#  -0.108383 0.0447515 -0.281316 0.485277 0.566222 0.981247 0.421943 0.421902 0.190473 -0.538187 -0.548296 -0.497316 -0.222793 -0.516704 0.0197918 -0.498419 -0.284941 0.294258 -0.0538069 -0.0824022 0.995145 0.680542 0.146085 -0.105353 -0.407172 -0.251052 -1.02611 0.224837 0.44423 1.10673 0.455875 -0.956626 -1.10043 -0.336431 0 0 0 0 0 0 0 0 0 0 0
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
# Yr:  1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Commercial 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000190338 0.000170768 6.9568e-06 5.05687e-05 3.94334e-05 0.000232689 0.000573298 0.000128289 0.00248841 0.0427229 0.0417886 0.106723 0.0844393 0.121751 0.208749 0.0700907 0.073361 0.0630764 0.0443875 0.0597765 0.0785163 0.079093 0.0688313 0.069303 0.0560088 0.0615662 0.0450138 0.126053 0.126117 0.126188 0.12626 0.126325 0.126381 0.12643 0.126471 0.126507 0.126537
# Ocean 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00390159 0.00525546 0.00583787 0.0126437 0.0107083 0.0269269 0.0193692 0.0133819 0.0200558 0.0138181 0.0101958 0.00806135 0.0046991 0.00812829 0.0077182 0.00440423 0.00616427 0.00551953 0.00390789 0.00731031 0.00971229 0.0135625 0.0108411 0.0115599 0.018036 0.0122787 0.0204724 0.0183138 0.0124833 0.0131323 0.0118005 0.0117779 0.0116289 0.00803527 0.00924271 0.0120647 0.0177022 0.0268217 0.0193027 0.0181094 0.0229999 0.0136558 0.0382407 0.0382599 0.0382815 0.0383032 0.0383232 0.0383408 0.0383559 0.0383689 0.03838 0.0383894
# Estuary 0.00793931 0.00748917 0.00750251 0.00704347 0.00893358 0.00988809 0.00565396 0.00565306 0.0065948 0.00706721 0.00754093 0.00801534 0.00801813 0.00802037 0.0080225 0.00802484 0.00802634 0.00613647 0.0056613 0.00707465 0.00754708 0.00802108 0.00896939 0.00944718 0.0099256 0.010405 0.0113595 0.0113686 0.0128011 0.0123375 0.0137728 0.0175991 0.0195445 0.0219826 0.0229952 0.0230437 0.0264644 0.0279818 0.0280489 0.0290782 0.0291324 0.0301509 0.0311726 0.0302371 0.0302634 0.0312663 0.0317838 0.0327937 0.0343043 0.0363212 0.0378594 0.0394093 0.0394806 0.0365541 0.0395501 0.0425866 0.0431627 0.0477395 0.0519111 0.0521337 0.0543595 0.0525642 0.0522352 0.057094 0.0594819 0.107388 0.0345577 0.0243136 0.0882302 0.0398759 0.014571 0.0192449 0.0769399 0.0424704 0.00537126 0.027157 0.0431154 0.0621886 0.0607425 0.0346522 0.0169635 0.0345964 0.0544688 0.0116175 0.0246471 0.0180549 0.0327048 0.0731043 0.105899 0.00353426 0.0111363 0.0334545 0.0396023 0.0371148 0.031918 0.0229099 0.0222431 0.0259866 0.0302267 0.0323955 0.090726 0.0907684 0.0908057 0.0908379 0.0908656 0.0908891 0.0909091 0.0909261 0.0909405 0.0909527
# Shore 0.235714 0.222316 0.222679 0.222963 0.251144 0.279422 0.181719 0.153734 0.181676 0.209667 0.223718 0.2238 0.223871 0.223929 0.237983 0.252051 0.224082 0.182024 0.153938 0.209867 0.223885 0.251942 0.280074 0.280233 0.294413 0.308619 0.336917 0.351217 0.379632 0.37993 0.408402 0.521836 0.593585 0.651638 0.66733 0.668621 0.769856 0.828928 0.830756 0.875461 0.862576 0.878224 0.92277 0.894967 0.895674 0.925306 0.940561 0.970388 1.02952 1.0746 1.10544 1.1657 1.16764 1.08094 1.1695 1.27385 1.27607 1.41124 1.51947 1.55508 1.60553 1.56681 1.54164 1.68443 1.75401 1.5525 2.93267 1.52533 2.27711 0.651566 1.12051 1.20003 1.46056 0.752323 0.850935 1.11272 1.77931 2.56049 4 1.03499 1.11852 1.57584 1.78621 0.60491 0.820023 2.7357 2.3535 3.00618 1.90318 0.892034 0.638134 1.37711 1.65332 1.44515 1.24128 0.8516 0.878271 1.08571 1.29298 1.33779 3.87098 3.87438 3.87735 3.87992 3.88212 3.88399 3.88557 3.88691 3.88804 3.889
# SpecProj 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
         7         1         0         1         0         1  #  ObsCPFV
         8         1         0         1         0         1  #  ORBS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -7.14689             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Logbook(6)
             0             2      0.023331             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_Logbook(6)
           -15            15      -8.40616             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ObsCPFV(7)
             0             2     0.0936798             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ObsCPFV(7)
           -15            15      -9.01793             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ORBS(8)
             0             2     0.0241783             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ORBS(8)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (mean over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (mean over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 Commercial
 24 0 0 0 # 2 Ocean
 24 0 0 0 # 3 Estuary
 24 0 0 0 # 4 Shore
 0 0 0 0 # 5 SpecProj
 15 0 0 1 # 6 Logbook
 15 0 0 2 # 7 ObsCPFV
 15 0 0 2 # 8 ORBS
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
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (mean over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (mean over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 10 0 0 0 # 1 Commercial
 10 0 0 0 # 2 Ocean
 10 0 0 0 # 3 Estuary
 10 0 0 0 # 4 Shore
 11 0 0 0 # 5 SpecProj
 10 0 0 0 # 6 Logbook
 10 0 0 0 # 7 ObsCPFV
 10 0 0 0 # 8 ORBS
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Commercial LenSelex
            24            45        39.206            36            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Commercial(1)
           -10             5            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Commercial(1)
             0             9        3.2057           3.3            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Commercial(1)
            -9             9      0.918373             2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Commercial(1)
            -9             9            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Commercial(1)
            -9             9      -1.33909            -8            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Commercial(1)
# 2   Ocean LenSelex
            24            45       39.9036            36            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Ocean(2)
           -10             5            -5            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Ocean(2)
             0             9       3.62376             4            50             0          5          0          0          0          0          0          1          1  #  Size_DblN_ascend_se_Ocean(2)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Ocean(2)
            -9             9            -8            -8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Ocean(2)
            -9             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Ocean(2)
# 3   Estuary LenSelex
            10            45       12.2426            16            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Estuary(3)
           -10             5      -5.16733            -5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Estuary(3)
             0             9       4.50329             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Estuary(3)
            -9             9       3.57699             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Estuary(3)
            -9             9            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Estuary(3)
            -9             9       -1.6448            -2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Estuary(3)
# 4   Shore LenSelex
             6            20             6             6            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_Shore(4)
           -10             9            -9            -9            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Shore(4)
             0             9             5             5            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Shore(4)
            -9             9       3.95979             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Shore(4)
            -9             9             8             8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Shore(4)
            -9             9      -5.34689             0            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Shore(4)
# 5   SpecProj LenSelex
# 6   Logbook LenSelex
# 7   ObsCPFV LenSelex
# 8   ORBS LenSelex
# 1   Commercial AgeSelex
# 2   Ocean AgeSelex
# 3   Estuary AgeSelex
# 4   Shore AgeSelex
# 5   SpecProj AgeSelex
             1             1             1             1            50             0        -99          0          0          0          0          0          0          0  #  minage@sel=1_SpecProj(5)
             1             1             1             1            50             0        -99          0          0          0          0          0          0          0  #  maxage@sel=1_SpecProj(5)
# 6   Logbook AgeSelex
# 7   ObsCPFV AgeSelex
# 8   ORBS AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -3             0     -0.249547            -1            99             0      5  # Size_DblN_ascend_se_Ocean(2)_BLK1add_2004
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity? (0/1)
#_no 2D_AR1 selex offset used
#_specs:  fleet, ymin, ymax, amin, amax, sigma_amax, use_rho, len1/age2, devphase, before_range, after_range
#_sigma_amax>amin means create sigma parm for each bin from min to sigma_amax; sigma_amax<0 means just one sigma parm is read and used for all bins
#_needed parameters follow each fleet's specifications
# -9999  0 0 0 0 0 0 0 0 0 0 # terminator
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     9     1     1     1     0     0     0     0     0     0     0
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
      4      1     1.012
      4      2    0.0795
      4      3    0.2162
      4      4    0.2382
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 10 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 6 1 1 1
 1 7 1 1 1
 1 8 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 5 2 1 1 1
 5 1 1 1 1
 5 5 1 1 1
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
#  1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  0 0 0 0 #_lencomp:_5
#  0 0 0 0 #_lencomp:_6
#  0 0 0 0 #_lencomp:_7
#  0 0 0 0 #_lencomp:_8
#  1 1 1 1 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  1 1 1 1 #_agecomp:_5
#  0 0 0 0 #_agecomp:_6
#  0 0 0 0 #_agecomp:_7
#  0 0 0 0 #_agecomp:_8
#  1 1 1 1 #_init_equ_catch1
#  1 1 1 1 #_init_equ_catch2
#  1 1 1 1 #_init_equ_catch3
#  1 1 1 1 #_init_equ_catch4
#  1 1 1 1 #_init_equ_catch5
#  1 1 1 1 #_init_equ_catch6
#  1 1 1 1 #_init_equ_catch7
#  1 1 1 1 #_init_equ_catch8
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

