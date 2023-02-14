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
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
# Commercial 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000260455 0.000252706 1.05784e-05 7.49422e-05 5.43695e-05 0.000290215 0.000641521 0.000130073 0.00233064 0.0374922 0.0351072 0.0887754 0.0713083 0.108967 0.213841 0.0847659 0.099434 0.088475 0.0602686 0.0749583 0.0891374 0.0834042 0.0740301 0.0838867 0.0765961 0.0877859 0.0609334 0.184568 0.184577 0.184585 0.184594 0.184602 0.184608 0.184615 0.18462 0.184624 0.184627
# Ocean 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00381711 0.00514099 0.00570997 0.0123649 0.0104707 0.0263244 0.0189318 0.0130771 0.0195352 0.0134037 0.00979452 0.00777205 0.00470083 0.00891856 0.00955443 0.00607912 0.00910218 0.00828816 0.00567874 0.00986482 0.0119034 0.0149868 0.0109343 0.0108081 0.015807 0.010369 0.0171855 0.0155717 0.0114135 0.0138636 0.0145237 0.0157214 0.0161223 0.0108594 0.0116207 0.0138293 0.0189112 0.0291306 0.023342 0.0245144 0.0324374 0.0184144 0.0557775 0.0557799 0.0557826 0.0557852 0.0557876 0.0557895 0.0557915 0.0557932 0.0557946 0.0557957
# Estuary 0.00745862 0.00703543 0.00704773 0.00661634 0.00839162 0.00928797 0.00531075 0.00530993 0.00619451 0.00663822 0.00708313 0.00752869 0.00753126 0.00753333 0.00753529 0.00753745 0.00753883 0.00576377 0.00531752 0.00664507 0.0070888 0.00753398 0.00842461 0.00887329 0.00932254 0.00977268 0.010669 0.0106774 0.0120226 0.011587 0.0129348 0.0165278 0.018354 0.0206426 0.0215924 0.0216371 0.0248479 0.0262712 0.026333 0.0272982 0.0273481 0.0283033 0.0292614 0.0283826 0.0284068 0.0293477 0.0298328 0.0307801 0.0321972 0.034089 0.0355315 0.0369847 0.0370502 0.0343033 0.0371141 0.0399622 0.0405013 0.0447938 0.0487042 0.0489087 0.0509926 0.0493042 0.0489921 0.0535433 0.0557758 0.100682 0.0316613 0.0225756 0.0778194 0.0402143 0.0165953 0.027477 0.112921 0.0638182 0.00782196 0.0347868 0.0486442 0.06241 0.0570436 0.0292656 0.0145344 0.0271915 0.0412277 0.00988682 0.0210153 0.0153585 0.0397658 0.10183 0.145686 0.00455543 0.0128208 0.0354387 0.0351611 0.0350399 0.0337323 0.0336833 0.0336604 0.0332991 0.0321021 0.0312179 0.0945604 0.0945642 0.0945674 0.0945701 0.0945724 0.094574 0.0945761 0.0945776 0.0945788 0.0945798
# Shore 0.21705 0.204704 0.205032 0.205289 0.23123 0.257259 0.167304 0.141539 0.167265 0.193035 0.20597 0.206043 0.206108 0.20616 0.219098 0.232049 0.206298 0.167579 0.141723 0.193215 0.20612 0.23195 0.257848 0.257991 0.271042 0.284118 0.310164 0.323324 0.349476 0.349745 0.375949 0.480355 0.546379 0.599787 0.614203 0.615367 0.708509 0.762835 0.764484 0.805591 0.793706 0.808081 0.849042 0.823442 0.824078 0.851327 0.865347 0.892771 0.947154 0.988598 1.01693 1.07233 1.07408 0.994303 1.07575 1.1717 1.1737 1.29796 1.3974 1.43003 1.4763 1.44059 1.41735 1.54846 1.61223 1.4268 2.61683 1.39213 1.94096 0.66628 1.30034 1.78642 2.13357 1.11195 1.19919 1.33418 1.86937 2.40552 3.59008 0.828809 0.940946 1.18785 1.30958 0.520831 0.691171 2.28459 3.04034 4 2.55352 1.09607 0.689386 1.38181 1.35392 1.34954 1.32913 1.32733 1.32649 1.29084 1.24684 1.21004 3.67751 3.67767 3.67781 3.67793 3.67803 3.6781 3.67819 3.67826 3.67832 3.67837
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
           -15            15      -6.91787             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Logbook(6)
             0             2     0.0222876             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_Logbook(6)
           -15            15      -8.18843             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ObsCPFV(7)
             0             2     0.0935545             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ObsCPFV(7)
           -15            15      -8.80421             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ORBS(8)
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
            10            45       12.2821            16            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_Estuary(3)
           -10             5       -5.1555            -5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Estuary(3)
             0             9       4.50287             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Estuary(3)
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

