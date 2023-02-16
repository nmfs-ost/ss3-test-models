#V3.30.21.00;_safe;_compile_date:_Feb 10 2023;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C 2015 Assessent of Kelp Greenling (Berger, Arnold, Rodomsky) run with SSv3.24u
#_data_and_control_files: BC_dat.ss // BC_ctl.ss
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
1 #_Age(post-settlement)_for_L1;linear growth below this
11 #_Growth_Age_for_L2 (999 to use as Linf)
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
 -10 30 25.0668 20 10 6 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 60 36.4388 38.51 10 6 3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.1 1 0.261353 0.3 0.5 6 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.15 0.105097 0.1 0.8 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
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
 -20 60 -0.0191201 37.33 10 6 3 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0 0 0.5 6 -3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -0.3 0.3 0 0 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -0.3 0.3 0 0 0.5 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 9.76e-06 9.76e-06 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 1 5 3.1164 3.1164 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution 
 0 1 1 1 0.8 6 -3 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 1 1 1 0.8 6 -3 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 1 1 1 0.8 6 -3 0 0 0 0 0 0 0 # RecrDist_month_1
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
             5            15       7.28012             7            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.7           0.7          0.09             6         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2          0.65          0.45           0.2             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0           0.2             0         -3          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0         -3          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1980 # first year of main recr_devs; early devs can preceed this era
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
#  -0.108016 0.0457131 -0.279402 0.488272 0.567818 0.983951 0.420642 0.423064 0.189508 -0.536609 -0.547613 -0.497409 -0.218096 -0.521196 0.016036 -0.502156 -0.290407 0.287659 -0.0568246 -0.085313 0.992807 0.678607 0.145108 -0.105473 -0.406745 -0.250317 -1.02541 0.226391 0.44647 1.10964 0.458863 -0.952687 -1.09688 -0.335294 0 0 0 0 0 0 0 0 0 0 0
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
# Commercial 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000185968 0.000166888 6.80094e-06 4.94473e-05 3.8561e-05 0.000227487 0.000560341 0.0001254 0.00243318 0.0417886 0.0409012 0.104537 0.0827525 0.119366 0.204578 0.0686487 0.0718396 0.0617665 0.0434617 0.0585099 0.076809 0.0773167 0.0672392 0.0676513 0.0546399 0.0600315 0.0438765 0.133701 0.133753 0.133812 0.133871 0.133925 0.133973 0.134013 0.134048 0.134078 0.134103
# Ocean 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00381708 0.00514095 0.00570992 0.0123648 0.0104706 0.0263243 0.0189317 0.013077 0.0195943 0.0134989 0.00995866 0.00787249 0.00458877 0.00793666 0.00753438 0.00429894 0.00601845 0.00539059 0.00381739 0.00714125 0.00948512 0.0132421 0.0105868 0.0112932 0.0176261 0.0120082 0.0200362 0.0179314 0.0122271 0.0128572 0.0115462 0.0115258 0.0113794 0.00786205 0.00904033 0.011794 0.0172929 0.0261851 0.0188317 0.0176562 0.022412 0.0133015 0.0405325 0.0405482 0.0405661 0.0405841 0.0406007 0.0406153 0.040628 0.0406389 0.0406482 0.0406562
# Estuary 0.00745856 0.00703537 0.00704767 0.00661629 0.00839156 0.0092879 0.00531071 0.00530989 0.00619446 0.00663816 0.00708308 0.00752863 0.0075312 0.00753327 0.00753523 0.00753739 0.00753877 0.00576373 0.00531748 0.00664502 0.00708875 0.00753392 0.00842455 0.00887322 0.00932246 0.0097726 0.010669 0.0106773 0.0120225 0.0115869 0.0129347 0.0165276 0.0183539 0.0206425 0.0215922 0.0216369 0.0248477 0.026271 0.0263328 0.027298 0.0273478 0.0283031 0.0292612 0.0283823 0.0284066 0.0293474 0.0298326 0.0307798 0.0321969 0.0340888 0.0355312 0.0369844 0.0370499 0.034303 0.0371138 0.0399619 0.0405009 0.0447934 0.0487038 0.0489083 0.0509921 0.0493038 0.0489917 0.0535429 0.0557753 0.100681 0.0323889 0.0227858 0.0826343 0.0373465 0.0136497 0.0180298 0.0720816 0.0397825 0.00503279 0.0254351 0.0403764 0.0582359 0.0568374 0.0324434 0.0159089 0.0324572 0.05115 0.0109345 0.0231935 0.0169861 0.0307957 0.0687677 0.0994855 0.00331765 0.010448 0.0313765 0.0371122 0.0347856 0.0299039 0.0214635 0.0208162 0.0242873 0.0282264 0.0302619 0.0922207 0.0922541 0.0922836 0.0923093 0.0923313 0.0923501 0.0923662 0.0923799 0.0923916 0.0924016
# Shore 0.217048 0.204702 0.20503 0.205287 0.231228 0.257257 0.167302 0.141538 0.167263 0.193033 0.205968 0.206042 0.206106 0.206158 0.219096 0.232046 0.206296 0.167578 0.141722 0.193214 0.206118 0.231948 0.257845 0.257988 0.271039 0.284115 0.310161 0.323321 0.349473 0.349742 0.375946 0.480351 0.546374 0.599782 0.614197 0.615362 0.708502 0.762828 0.764477 0.805583 0.793698 0.808073 0.849034 0.823434 0.82407 0.851319 0.865338 0.892763 0.947145 0.988588 1.01692 1.07232 1.07406 0.994293 1.07574 1.17169 1.17369 1.29794 1.39738 1.43001 1.47629 1.44057 1.41734 1.54845 1.61222 1.42679 2.69436 1.40121 2.09053 0.598042 1.02868 1.10153 1.34116 0.690757 0.781682 1.02179 1.63394 2.35138 3.67662 0.950359 1.02877 1.44973 1.64499 0.558301 0.756401 2.52284 2.17135 2.77068 1.75214 0.820775 0.58692 1.26622 1.51914 1.32772 1.13965 0.781576 0.80532 0.994594 1.18389 1.22556 3.82701 3.82959 3.83186 3.83386 3.83558 3.83706 3.83833 3.83941 3.84033 3.84111
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
           -15            15       -7.1696             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Logbook(6)
             0             2     0.0222876             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_Logbook(6)
           -15            15      -8.42918             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ObsCPFV(7)
             0             2     0.0935545             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ObsCPFV(7)
           -15            15      -9.04099             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ORBS(8)
             0             2     0.0236524             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ORBS(8)
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
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
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
            24            45       39.1959            36            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Commercial(1)
           -10             5            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Commercial(1)
             0             9       3.20418           3.3            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Commercial(1)
            -9             9      0.928092             2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Commercial(1)
            -9             9            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Commercial(1)
            -9             9      -1.35033            -8            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Commercial(1)
# 2   Ocean LenSelex
            24            45       39.8904            36            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Ocean(2)
           -10             5            -5            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Ocean(2)
             0             9       3.62312             4            50             0          5          0          0          0          0          0          1          1  #  Size_DblN_ascend_se_Ocean(2)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Ocean(2)
            -9             9            -8            -8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Ocean(2)
            -9             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Ocean(2)
# 3   Estuary LenSelex
            10            45       12.2822            16            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Estuary(3)
           -10             5      -5.15575            -5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Estuary(3)
             0             9       4.50309             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Estuary(3)
            -9             9       3.57606             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Estuary(3)
            -9             9            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Estuary(3)
            -9             9      -1.59162            -2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Estuary(3)
# 4   Shore LenSelex
             6            20             6             6            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_Shore(4)
           -10             9            -9            -9            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Shore(4)
             0             9             5             5            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Shore(4)
            -9             9       3.97111             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Shore(4)
            -9             9             8             8            50             0         -5          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Shore(4)
            -9             9      -5.28356             0            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Shore(4)
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
            -3             0     -0.250964            -1            99             0      5  # Size_DblN_ascend_se_Ocean(2)_BLK1add_2004
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

