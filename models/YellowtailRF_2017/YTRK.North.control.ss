#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_data_and_control_files: YTRK.North.data.ss // YTRK.North.control.ss
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
3 #_Nblock_Patterns
 10 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2016
 2002 2016
 2003 2016
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
25 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
5 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.02 0.25 0.145109 -2.12 0.438 3 2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 1 25 15.0337 22 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 35 70 53.8936 55 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.1 0.4 0.13556 0.1 99 0 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.03 0.16 0.0989 0.1 99 0 5 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.03 0.16 0.04357 0.1 99 0 5 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 1.1843e-05 99 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.0672 99 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 30 56 42.49 42.49 99 0 -50 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -2 1 -0.40078 -0.40078 99 0 -50 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 6 1.1185e-11 99 99 0 -50 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 2 7 4.59 4.59 99 0 -50 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 -0.1386 0 99 0 2 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -1 1 0 0 99 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 1 -0.149 0 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -1 1 0.3779 0 99 0 3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 1 0 0 99 0 -5 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 1 0.16921 0 99 0 5 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 3 1.1843e-05 99 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.0672 99 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 0.001 0.999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
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
             5            20            12            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.718         0.718         0.158             0         -6          0          0          0          0          0          0          0 # SR_BH_steep
           0.4           1.2        0.4997          0.67            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1962 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1932 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1945.4 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1976.7 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2010.5 #_last_yr_fullbias_adj_in_MPD
 2013 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.8154 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -6 #min rec_dev
 6 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
1984 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.95 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# CommercialTrawl 2.99958e-07 3.23032e-07 5.76843e-07 5.47095e-06 4.80183e-06 4.80184e-06 1.30399e-06 2.9725e-07 3.0298e-07 1.71487e-07 2.90049e-07 4.08609e-07 5.27146e-07 6.45702e-07 7.64257e-07 1.52884e-06 1.00134e-06 1.11989e-06 1.23844e-06 1.70305e-06 1.47552e-06 1.59407e-06 1.71262e-06 1.83115e-06 1.9497e-06 2.06825e-06 2.41751e-06 8.0522e-06 1.36505e-05 3.45142e-05 1.08316e-05 1.26397e-05 1.65941e-05 1.28783e-05 7.24243e-06 1.38873e-05 3.26816e-05 3.46988e-05 5.96045e-05 5.4477e-05 7.21715e-05 0.000102707 0.000119598 7.94416e-05 7.3435e-05 7.05679e-05 0.000113477 0.000113841 0.00012583 0.000152624 0.000176106 0.000345033 0.000462664 0.000748204 0.00309384 0.00549886 0.0103188 0.00624559 0.00317585 0.00287571 0.00143895 0.00280281 0.00292383 0.00375163 0.00208181 0.00271272 0.00271605 0.00315812 0.00324031 0.00336685 0.00348028 0.0042351 0.00399111 0.0053613 0.00441498 0.00367769 0.00344092 0.00265072 0.00325802 0.00466495 0.00781526 0.00357547 0.00374577 0.00564201 0.0067632 0.00487699 0.00349391 0.00979869 0.0148863 0.0209928 0.0187892 0.0183808 0.0239605 0.0249678 0.0265416 0.0135904 0.00900508 0.0128205 0.0129295 0.0170073 0.0134435 0.0123493 0.0104491 0.0160604 0.0152832 0.0149751 0.0135174 0.014974 0.00529569 0.00714604 0.00641064 0.0082956 0.00541282 0.00307774 0.0011426 0.00201394 0.00425742 0.00111147 0.00196413 0.000791047 0.0022849 0.00367672 0.00307824 0.00392368 0.00290197 0.0035447 0.00476906 0.00338923 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865 0.0780865
# HakeByCatch 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.70866e-05 2.46861e-05 0.000253299 0.000279935 0.000883686 0.000534978 0.00196548 0.00198971 0.00115237 0.000646456 0.00208025 0.00201866 0.00158446 0.000695274 0.00111402 0.00180761 0.00262788 0.00103995 0.00214009 0.00247917 0.0028676 0.0015287 0.00168092 0.00458292 0.00242395 0.000812575 0.00071961 0.000137759 0.000177569 0.00041604 0.000401524 0.000288927 0.000639161 0.000640105 0.000543496 0.00036563 0.00015505 0.000968646 0.000150826 0.000310077 0.000223641 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526 0.0051526
# RecORandCA 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.84196e-07 3.684e-07 4.25089e-07 5.6681e-07 7.08547e-07 8.50275e-07 9.77832e-07 1.11956e-06 1.26132e-06 1.5023e-06 1.47401e-06 1.28982e-06 1.85689e-06 1.7154e-06 9.075e-07 8.79443e-07 7.24605e-07 9.5466e-07 1.66168e-06 1.32118e-06 2.64364e-06 3.42038e-06 4.1655e-06 4.78523e-06 4.18446e-06 3.57081e-06 4.46576e-06 5.36479e-06 6.00713e-06 5.14969e-06 8.87009e-06 8.09045e-06 6.02754e-06 4.54105e-06 5.32989e-06 3.71815e-06 2.85994e-06 4.73029e-06 5.17274e-06 5.21435e-06 5.8698e-06 7.13228e-06 8.25371e-06 6.52836e-06 8.71052e-06 1.11915e-05 1.22364e-05 1.21881e-05 1.44179e-05 1.28276e-05 1.17598e-05 3.97224e-05 3.83229e-05 0.000111286 0.000113222 0.000203176 6.23797e-05 0.00031864 4.87563e-05 4.00644e-05 2.99589e-05 7.0432e-05 6.38269e-05 8.88802e-05 0.000340582 0.000303003 0.000137872 0.000111616 0.000103304 0.000131674 0.000120932 7.74987e-05 4.66936e-05 4.4517e-05 4.6369e-05 0.000115783 0.000108095 0.00015461 0.000134374 0.000102169 0.000136985 9.6633e-05 6.6301e-05 0.000105554 0.000114807 0.000115367 9.05766e-05 0.000166072 7.91232e-05 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297 0.00182297
# RecWA 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000147272 0 0 0 0 0 0 0 4.79472e-05 6.41022e-05 3.22716e-05 5.2957e-05 1.65119e-05 1.25201e-05 1.68638e-05 8.54111e-06 1.29805e-05 1.31509e-05 2.19871e-05 3.95757e-05 7.05529e-05 7.07397e-05 7.10835e-05 6.23165e-05 0.000133707 0.00014268 0.000188122 8.08662e-05 6.75795e-05 9.02655e-05 9.05072e-05 0.000135195 4.94438e-05 5.83412e-05 4.0342e-05 1.78665e-05 2.22759e-05 4.43971e-05 4.02532e-05 2.81395e-05 3.00714e-05 3.6012e-05 5.58909e-05 7.57408e-05 8.56379e-05 3.77994e-05 4.77105e-05 6.55384e-05 0.000111063 0.000118659 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386 0.00273386
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         0         0         1  #  CommercialTrawl
         2         1         0         0         0         1  #  HakeByCatch
         5         1         0         1         0         1  #  Triennial
         6         1         0         1         0         1  #  NWFSCcombo
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -30            15      -7.00859             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CommercialTrawl(1)
           -30            15      -12.5317             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_HakeByCatch(2)
           -30            15      -3.50674             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial(5)
             0           0.5          0.01             0             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_Triennial(5)
           -30            15      -2.72674             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCcombo(6)
             0           0.5          0.01             0             1             0          1          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCcombo(6)
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
 24 1 0 0 # 1 CommercialTrawl
 24 0 0 0 # 2 HakeByCatch
 24 0 0 0 # 3 RecORandCA
 24 0 0 0 # 4 RecWA
 24 0 0 0 # 5 Triennial
 24 0 0 0 # 6 NWFSCcombo
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
 10 0 0 0 # 1 CommercialTrawl
 10 0 0 0 # 2 HakeByCatch
 10 0 0 0 # 3 RecORandCA
 10 0 0 0 # 4 RecWA
 10 0 0 0 # 5 Triennial
 10 0 0 0 # 6 NWFSCcombo
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   CommercialTrawl LenSelex
            20            55       48.6485             0            99             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_CommercialTrawl(1)
           -20            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_CommercialTrawl(1)
            -5            20       4.27222             0            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_CommercialTrawl(1)
            -5            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_CommercialTrawl(1)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_start_logit_CommercialTrawl(1)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_end_logit_CommercialTrawl(1)
            20            55       24.5115            27            99             0          3          0          0          0          0          0          0          0  #  Retain_L_infl_CommercialTrawl(1)
           0.1            40       1.59935            15            99             0          3          0          0          0          0          0          0          0  #  Retain_L_width_CommercialTrawl(1)
           -10            20       3.06533             3            99             0          3          0          0          0          0          0          1          2  #  Retain_L_asymptote_logit_CommercialTrawl(1)
            -3             3             0             0             3             0         -4          0          0          0          0          0          0          0  #  Retain_L_maleoffset_CommercialTrawl(1)
# 2   HakeByCatch LenSelex
            20            55       52.2551             0            99             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_HakeByCatch(2)
           -20            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_HakeByCatch(2)
            -5            20        4.2846             0            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_HakeByCatch(2)
            -5            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_HakeByCatch(2)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_start_logit_HakeByCatch(2)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_end_logit_HakeByCatch(2)
# 3   RecORandCA LenSelex
            20            55        30.811             0            99             0          6          0          0          0          0          0          3          2  #  Size_DblN_peak_RecORandCA(3)
           -20            70           -20             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_RecORandCA(3)
            -5            20         3.173             0            99             0          6          0          0          0          0          0          3          2  #  Size_DblN_ascend_se_RecORandCA(3)
            -5            20            20             0            99             0         -4          0          0          0          0          0          3          2  #  Size_DblN_descend_se_RecORandCA(3)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_start_logit_RecORandCA(3)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_end_logit_RecORandCA(3)
# 4   RecWA LenSelex
            20            55            55             0            99             0         -6          0          0          0          0          0          3          2  #  Size_DblN_peak_RecWA(4)
           -20            70           -20             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_RecWA(4)
            -5            20         5.365             0            99             0          6          0          0          0          0          0          3          2  #  Size_DblN_ascend_se_RecWA(4)
            -5            70            20             0            99             0         -4          0          0          0          0          0          3          2  #  Size_DblN_descend_se_RecWA(4)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_start_logit_RecWA(4)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_end_logit_RecWA(4)
# 5   Triennial LenSelex
            20            55            55             0            99             0         -1          0          0          0          0          0          0          0  #  Size_DblN_peak_Triennial(5)
           -20            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Triennial(5)
            -5            20       5.11635             0            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Triennial(5)
            -5            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Triennial(5)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Triennial(5)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Triennial(5)
# 6   NWFSCcombo LenSelex
            20            55       49.7058             0            99             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_NWFSCcombo(6)
           -20            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NWFSCcombo(6)
            -5            20       4.53247             0            99             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NWFSCcombo(6)
            -5            70            70             0            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NWFSCcombo(6)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NWFSCcombo(6)
          -999            25          -999             0            99             0        -99          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NWFSCcombo(6)
# 1   CommercialTrawl AgeSelex
# 2   HakeByCatch AgeSelex
# 3   RecORandCA AgeSelex
# 4   RecWA AgeSelex
# 5   Triennial AgeSelex
# 6   NWFSCcombo AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
           -10            20       2.22742             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2002
           -10            20       3.70725             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2003
           -10            20       1.12665             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2004
           -10            20     -0.119847             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2005
           -10            20       1.76073             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2006
           -10            20       -0.5268             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2007
           -10            20       2.39693             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2008
           -10            20      0.475635             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2009
           -10            20      0.138629             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2010
           -10            20       7.37535             3            99             0      6  # Retain_L_asymptote_logit_CommercialTrawl(1)_BLK1repl_2011
            20            55         31.22             0            99             0      6  # Size_DblN_peak_RecORandCA(3)_BLK3repl_2003
            -5            20         2.904             0            99             0      6  # Size_DblN_ascend_se_RecORandCA(3)_BLK3repl_2003
            -5            20         4.248             0            99             0      6  # Size_DblN_descend_se_RecORandCA(3)_BLK3repl_2003
            20            55         33.46             0            99             0      6  # Size_DblN_peak_RecWA(4)_BLK3repl_2003
            -5            20         2.726             0            99             0      6  # Size_DblN_ascend_se_RecWA(4)_BLK3repl_2003
            -5            70         8.841             0            99             0      6  # Size_DblN_descend_se_RecWA(4)_BLK3repl_2003
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
#      5     9     1     1     2     0     0     0     0     0     0     0
#      5    17    11     3     2     0     0     0     0     0     0     0
#      5    19    12     3     2     0     0     0     0     0     0     0
#      5    20    13     3     2     0     0     0     0     0     0     0
#      5    23    14     3     2     0     0     0     0     0     0     0
#      5    25    15     3     2     0     0     0     0     0     0     0
#      5    26    16     3     2     0     0     0     0     0     0     0
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
      4      1  0.034445
      4      2  0.111832
      4      3  0.105365
      4      4   0.03222
      4      5  0.037147
      4      6  0.027307
      5      1  0.128648
      5      4  0.021984
      5      5  0.094145
      5      6  0.320667
 -9999   1    0  # terminator
#
5 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 3 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 1 1 0 0
 1 2 1 0 0
 17 1 5 0 0
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 #_discard:_1
#  0 0 0 0 0 #_discard:_2
#  0 0 0 0 0 #_discard:_3
#  0 0 0 0 0 #_discard:_4
#  0 0 0 0 0 #_discard:_5
#  0 0 0 0 0 #_discard:_6
#  1 1 1 1 1 #_lencomp:_1
#  1 1 1 1 1 #_lencomp:_2
#  1 1 1 1 1 #_lencomp:_3
#  1 1 1 1 1 #_lencomp:_4
#  1 1 1 1 1 #_lencomp:_5
#  1 1 1 1 1 #_lencomp:_6
#  1 1 1 1 1 #_agecomp:_1
#  0 0 0 0 0 #_agecomp:_2
#  0 0 0 0 0 #_agecomp:_3
#  1 1 1 1 1 #_agecomp:_4
#  1 1 1 1 1 #_agecomp:_5
#  1 1 1 1 1 #_agecomp:_6
#  1 1 1 1 1 #_init_equ_catch1
#  1 1 1 1 1 #_init_equ_catch2
#  1 1 1 1 1 #_init_equ_catch3
#  1 1 1 1 1 #_init_equ_catch4
#  1 1 1 1 1 #_init_equ_catch5
#  1 1 1 1 1 #_init_equ_catch6
#  1 1 1 1 1 #_recruitments
#  1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 #_crashPenLambda
#  1 1 1 1 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

