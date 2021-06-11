#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_data_and_control_files: Spiny_Dogfish.DAT // Spiny_Dogfish.CTL
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
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
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
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
4 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.12 0.064 0.064 99 0 -2 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 10 50 25.2456 25.2456 99 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 80 200 109.1 109.1 99 0 -3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.005 0.1 0.0262574 0.0262574 99 0 -2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.3 0.123153 0.123153 99 0 -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.05 0.3 0.240138 0.240138 99 0 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 2.3065e-06 2.3065e-06 99 0 -5 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.1526 3.1526 99 0 -5 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 50 100 88.2 88.2 99 0 -5 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -2 0 -0.27 -0.27 99 0 -5 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -20 20 -14.7 1 99 0 -5 0 0 0 0 0 0 0 # Eggs_intercept_Fem_GP_1
 0 1 0.214 0 99 0 -5 0 0 0 0 0 0 0 # Eggs_slope_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 0 0 99 0 -3 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0 0 99 0 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.236493 -0.236493 99 0 -2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.685115 0.685115 99 0 -2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -3 3 0.444534 0.444534 99 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -3 3 -1.43528 -1.43528 99 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 3.4911e-06 3.4911e-06 99 0 -5 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.0349 3.0349 99 0 -5 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
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
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
7 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             8            18          10.5          10.5            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
             0             1           0.4           0.4            99             0         -5          0          0          0          0          0          0          0 # SR_surv_zfrac
           0.2             5             1             1            99             0         -5          0          0          0          0          0          0          0 # SR_surv_Beta
          0.01             1           0.2           1.1            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -5          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0         -5          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1916 # first year of main recr_devs; early devs can preceed this era
2010 # last year of main recr_devs; forecast devs start in following year
-1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -3 #_recdev_early_phase
 -5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1950 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1960 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2008 #_last_yr_fullbias_adj_in_MPD
 2009 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.9 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -3 #min rec_dev
 3 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1916R 1917R 1918R 1919R 1920R 1921R 1922R 1923R 1924R 1925R 1926R 1927R 1928R 1929R 1930R 1931R 1932R 1933R 1934R 1935R 1936R 1937R 1938R 1939R 1940R 1941R 1942R 1943R 1944R 1945R 1946R 1947R 1948R 1949R 1950R 1951R 1952R 1953R 1954R 1955R 1956R 1957R 1958R 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011F 2012F 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
4  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# TRAWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0029847 0.00378311 0.00670744 0.00297886 0.00285519 0.00301804 0.00180299 0.00678103 0.00160457 0.00127716 0.000599442 0.000329138 0.000133158 0.000138665 0.000156466 0.000143322 0.000164508 0.000103186 0.000173384 0.000242717 9.01243e-05 2.57878e-05 2.59034e-05 1.77368e-05 9.79209e-05 0.00016967 0.000485535 0.00157059 0.00136412 0.00131799 0.000736362 0.00180206 0.000751734 0.000197203 0.0019073 0.0015609 0.000659851 0.000725541 0.0010721 0.000673379 0.00275077 0.00561091 0.00714943 0.00687787 0.00844003 0.00294294 0.00159387 0.00277816 0.00339384 0.00357465 0.0023778 0.00278125 0.00366291 0.00163011 0.00108892 0.00109324 0.000995958 0.00053323 0.000362711 0.00066852 0.000361674 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027 0.00426027
# Trawl_Discard 0 1.69151e-06 3.38304e-06 5.07456e-06 6.76613e-06 8.45771e-06 1.01493e-05 1.1841e-05 1.35327e-05 1.52245e-05 1.69163e-05 1.86082e-05 2.03002e-05 2.19923e-05 2.36844e-05 2.53766e-05 5.79656e-05 5.36927e-05 5.79961e-05 0.000110611 5.92201e-05 0.00016178 0.000946999 0.00173417 0.00277862 0.0152044 0.0135357 0.00901201 0.0294826 0.0181773 0.0144954 0.0135676 0.0147479 0.0132033 0.00309651 0.00286455 0.00182699 0.00310035 0.00312897 0.00308263 0.00330421 0.00179342 0.00330187 0.00326585 0.00282572 0.00224196 0.00131492 0.00135311 0.00146913 0.00138627 0.00152077 0.00109848 0.00157618 0.00192509 0.000995584 0.00034051 0.000342552 0.000240884 0.00106631 0.00156597 0.00263715 0.00325025 0.00324794 0.00325097 0.00299599 0.00327363 0.00302055 0.0017329 0.003278 0.00330418 0.00293788 0.00301148 0.0032364 0.0029618 0.00315405 0.00221647 0.00164563 0.0017675 0.00117388 0.00315503 0.00337409 0.00321184 0.00305126 0.00300531 0.00332269 0.00324302 0.00295504 0.00279039 0.00386216 0.00527698 0.00315948 0.00229577 0.00347392 0.00205568 0.0024188 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513 0.00954513
# MIDWATER 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000128215 2.48128e-05 7.55411e-05 3.87848e-07 1.15595e-05 1.00777e-05 0.000150604 9.79172e-05 0.000107982 3.85224e-05 8.9883e-05 2.42307e-05 0.000116796 0.000218385 0.000326643 0.000303053 0.000486297 0.000234412 0.000343745 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128 0.000627128
# A-SHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.63969e-05 2.32206e-05 5.81046e-05 0.000225269 0.000493032 0.000384143 0.000190991 0.000192581 6.87454e-05 0.000366337 0.00041159 0.000321131 0.000162774 0.000335348 0.000477013 0.00115349 0.00022259 0.000160204 0.000597359 0.00120907 0.000990005 0.000832686 0.00142468 0.000356101 0.0007201 0.00091226 0.000826385 0.00187495 0.00109048 0.000180051 0.000477209 0.00207507 0.000506256 0.00085876 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509 0.00270509
# HKL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.74643e-07 0 1.7837e-05 7.0064e-06 1.1182e-05 0 1.35032e-07 6.12124e-07 2.45833e-05 0.000443933 0.0015862 0.000899985 0.000173184 0.000321349 7.87368e-05 0.000424768 0.00138105 0.000392239 0.000669708 0.00085379 0.0028503 0.00185929 0.00287798 0.00245922 0.00582197 0.00474357 0.000103686 0.000760913 0.00121345 1.20212e-05 0.00062317 0.00459847 0.00311381 0.00591097 0.00343486 0.00342006 0.00340476 0.00279817 0.0031874 0.0041313 0.000803913 0.000146267 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144 0.00957144
# Hkl_Discard 0 2.06262e-07 4.12526e-07 6.18788e-07 8.25057e-07 1.03133e-06 1.2376e-06 1.44389e-06 1.65017e-06 1.85647e-06 2.06277e-06 2.26908e-06 2.4754e-06 2.68173e-06 2.88807e-06 3.09442e-06 7.06828e-06 6.54727e-06 7.07202e-06 1.34879e-05 7.22128e-06 1.97275e-05 0.000115478 0.000211468 0.000275761 0.00205653 0.00038699 0.000480494 0.00862327 0.00308117 0.00106707 0.000562501 3.39268e-05 0.000691168 0.000277153 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.46601e-07 0 1.37146e-05 5.45736e-06 8.69956e-06 0 1.06716e-07 4.84638e-07 1.90606e-05 0.00024321 0.000434765 0.000363761 0.000118121 0.00019436 5.84215e-05 0.000237702 0.00042602 0.000225077 0.000315914 0.000357926 0.000438435 0.000451977 0.000439953 0.00045421 0.000227438 0.000325669 7.43545e-05 0.00033832 0.000414459 9.31278e-06 0.000302826 0.000348028 0.000443709 0.00039565 0.000197602 0.000350942 0.000273189 0.000624062 0.000587082 0.000474697 0.000640776 0.000100265 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485 0.00121485
# OTHERS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00363735 0.00410111 0.0150365 0.0136727 0.00787683 0.0140919 0.00634393 0.00353268 0.00302651 0.00223846 0.00148128 0.00063884 0.000515835 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.66505e-06 2.20436e-06 2.57491e-05 2.28534e-06 1.65048e-06 1.61643e-06 2.1809e-05 2.44016e-05 0.000312717 0.000589882 0.000705533 0.000336125 4.98079e-05 3.70091e-05 8.215e-05 2.55852e-05 3.36189e-06 1.56415e-05 7.80512e-05 6.11748e-06 3.13105e-06 8.81537e-06 3.03738e-06 3.0115e-06 9.49797e-06 2.3496e-07 2.88453e-06 1.0099e-06 7.79116e-07 6.82151e-06 1.50401e-05 1.76598e-05 7.75193e-06 1.4385e-06 3.05709e-05 1.75314e-05 2.5615e-05 2.15139e-05 1.43526e-07 5.24472e-05 4.52572e-06 5.86238e-07 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05 4.92359e-05
# RECREATIONAL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.42085e-06 1.50843e-06 0.000445087 0.000628252 0.00023523 0.000219079 0.000707549 0.000849866 0.000115826 0.000664967 0.000332305 0.000349566 0.000348004 0.000352407 0.000347702 0.000157085 0.000277068 0.000260649 6.49125e-05 1.19748e-05 0.000159562 0.000143944 0.000134081 0.000210162 0.000165746 3.69136e-05 6.3106e-05 5.13009e-05 8.14436e-05 4.05655e-05 6.14145e-05 3.1434e-05 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369 0.000279369
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         9         1         0         1         1         0  #  AFSC_triennial
        10         1         0         1         0         1  #  AFSC_slope
        11         1         0         1         0         1  #  NWFSC_shelf_slope
        12         1         0         1         0         1  #  NWFSC_slope
        13         1         0         1         0         1  #  IPHC
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -10             2       -0.0003             0            99             0          1          0          1       1980       2004         -5          0          0  #  LnQ_base_AFSC_triennial(9)
             0             1           0.4           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_AFSC_triennial(9)
           -15            15      -1.10916             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_AFSC_slope(10)
             0             1           0.4           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_AFSC_slope(10)
           -15            15      -1.81518             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC_shelf_slope(11)
             0             1           0.4           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_NWFSC_shelf_slope(11)
           -15            15      -3.86402             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC_slope(12)
             0             1           0.4           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_NWFSC_slope(12)
           -15            15      -15.3714             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_IPHC(13)
             0             1           0.1           0.1            99             0         -3          0          0          0          0          0          0          0  #  Q_extraSD_IPHC(13)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_AFSC_triennial(9)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_AFSC_triennial(9)_dev_autocorr
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
 24 0 0 0 # 1 TRAWL
 24 0 0 0 # 2 Trawl_Discard
 24 0 0 0 # 3 MIDWATER
 5 0 0 3 # 4 A-SHOP
 24 0 0 0 # 5 HKL
 24 0 0 0 # 6 Hkl_Discard
 5 0 0 6 # 7 OTHERS
 24 0 0 0 # 8 RECREATIONAL
 24 0 0 0 # 9 AFSC_triennial
 24 0 0 0 # 10 AFSC_slope
 24 0 0 0 # 11 NWFSC_shelf_slope
 5 0 0 10 # 12 NWFSC_slope
 5 0 0 6 # 13 IPHC
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
 11 0 0 0 # 1 TRAWL
 11 0 0 0 # 2 Trawl_Discard
 11 0 0 0 # 3 MIDWATER
 11 0 0 0 # 4 A-SHOP
 11 0 0 0 # 5 HKL
 11 0 0 0 # 6 Hkl_Discard
 11 0 0 0 # 7 OTHERS
 11 0 0 0 # 8 RECREATIONAL
 11 0 0 0 # 9 AFSC_triennial
 11 0 0 0 # 10 AFSC_slope
 11 0 0 0 # 11 NWFSC_shelf_slope
 11 0 0 0 # 12 NWFSC_slope
 11 0 0 0 # 13 IPHC
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   TRAWL LenSelex
            20           120           100           100            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_TRAWL(1)
            -6             4            -1            -1            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TRAWL(1)
            -1             9             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_TRAWL(1)
            -1             9             5             5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_TRAWL(1)
            -5             9            -5            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TRAWL(1)
            -5             9             9            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_TRAWL(1)
# 2   Trawl_Discard LenSelex
            20           120            75            75            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Trawl_Discard(2)
            -6             4            -1            -1            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Trawl_Discard(2)
            -1             9             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Trawl_Discard(2)
            -1             9             5             5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Trawl_Discard(2)
            -5             9            -5            -5            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Trawl_Discard(2)
            -5             9             9            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Trawl_Discard(2)
# 3   MIDWATER LenSelex
            20           120            55            55            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_MIDWATER(3)
            -6             4             0             0            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_MIDWATER(3)
            -1             9             5             5            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_MIDWATER(3)
            -1             9             5             5            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_MIDWATER(3)
            -9             9            -7            -7            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_MIDWATER(3)
          -999          -999          -999             0            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_MIDWATER(3)
# 4   A-SHOP LenSelex
             0             0             1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_A-SHOP(4)
             0             0            -1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_A-SHOP(4)
# 5   HKL LenSelex
            20           120           110           110            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_HKL(5)
            -6             4            -1            -1            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_HKL(5)
            -1             9             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_HKL(5)
            -1             9             5             5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_HKL(5)
            -5             9            -5            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_HKL(5)
            -5             9             9            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_HKL(5)
# 6   Hkl_Discard LenSelex
            20           120            70            70            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Hkl_Discard(6)
            -6             4            -1            -1            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Hkl_Discard(6)
            -1             9             5             5            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Hkl_Discard(6)
            -1             9             5             5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Hkl_Discard(6)
            -5             9            -3            -3            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Hkl_Discard(6)
            -5             9             9            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Hkl_Discard(6)
# 7   OTHERS LenSelex
             0             0             1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_OTHERS(7)
             0             0            -1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_OTHERS(7)
# 8   RECREATIONAL LenSelex
            20           120           110           110            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RECREATIONAL(8)
            -6             4            -1            -1            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RECREATIONAL(8)
            -1             9             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RECREATIONAL(8)
            -1             9             5             5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RECREATIONAL(8)
            -5             9            -5            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RECREATIONAL(8)
            -5             9             9            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RECREATIONAL(8)
# 9   AFSC_triennial LenSelex
            25           100            60            60            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_AFSC_triennial(9)
            -9             3            -8            -8            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_AFSC_triennial(9)
            -4            12             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_AFSC_triennial(9)
            -2            15             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_AFSC_triennial(9)
            -5             9            -5            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_AFSC_triennial(9)
          -999          -999          -999             0            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_AFSC_triennial(9)
# 10   AFSC_slope LenSelex
            25           100            60            60            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_AFSC_slope(10)
            -9             3            -1            -1            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_AFSC_slope(10)
            -4            12             5             5            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_AFSC_slope(10)
            -2            15             5             5            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_AFSC_slope(10)
            -5             9            -5            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_AFSC_slope(10)
          -999          -999          -999             0            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_AFSC_slope(10)
# 11   NWFSC_shelf_slope LenSelex
            20           120            60            60            99             6          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSC_shelf_slope(11)
            -6             4            -1            -1            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSC_shelf_slope(11)
            -1             9             6             6            99             6          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSC_shelf_slope(11)
            -1             9             5             5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSC_shelf_slope(11)
            -5             9            -5            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSC_shelf_slope(11)
            -5             9             9            -5            99             6         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSC_shelf_slope(11)
# 12   NWFSC_slope LenSelex
             0             0             1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_NWFSC_slope(12)
             0             0            -1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_NWFSC_slope(12)
# 13   IPHC LenSelex
             0             0             1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_IPHC(13)
             0             0            -1             0            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_IPHC(13)
# 1   TRAWL AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_TRAWL(1)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_TRAWL(1)
# 2   Trawl_Discard AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Trawl_Discard(2)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Trawl_Discard(2)
# 3   MIDWATER AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_MIDWATER(3)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_MIDWATER(3)
# 4   A-SHOP AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_A-SHOP(4)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_A-SHOP(4)
# 5   HKL AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_HKL(5)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_HKL(5)
# 6   Hkl_Discard AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Hkl_Discard(6)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Hkl_Discard(6)
# 7   OTHERS AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_OTHERS(7)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_OTHERS(7)
# 8   RECREATIONAL AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_RECREATIONAL(8)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_RECREATIONAL(8)
# 9   AFSC_triennial AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_AFSC_triennial(9)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_AFSC_triennial(9)
# 10   AFSC_slope AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_AFSC_slope(10)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_AFSC_slope(10)
# 11   NWFSC_shelf_slope AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWFSC_shelf_slope(11)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWFSC_shelf_slope(11)
# 12   NWFSC_slope AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWFSC_slope(12)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWFSC_slope(12)
# 13   IPHC AgeSelex
             0             1             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_IPHC(13)
             0           100            95           100            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_IPHC(13)
#_No_Dirichlet parameters
#_no timevary selex parameters
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
      4      1     0.673
      5      1     0.768
      4      2     0.441
      5      3     0.776
      4      4     0.028
      5      4     0.899
      4      5       0.7
      5      5     0.712
      4      6     0.655
      4      8      0.79
      4      9     0.571
      4     10     0.511
      4     11     0.299
      5     11     0.897
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 #_CPUE/survey:_5
#  0 0 0 0 #_CPUE/survey:_6
#  0 0 0 0 #_CPUE/survey:_7
#  0 0 0 0 #_CPUE/survey:_8
#  1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 #_CPUE/survey:_11
#  1 1 1 1 #_CPUE/survey:_12
#  1 1 1 1 #_CPUE/survey:_13
#  1 1 1 1 #_meanbodywt:1
#  1 1 1 1 #_meanbodywt:2
#  1 1 1 1 #_meanbodywt:3
#  1 1 1 1 #_meanbodywt:4
#  1 1 1 1 #_meanbodywt:5
#  1 1 1 1 #_meanbodywt:6
#  1 1 1 1 #_meanbodywt:7
#  1 1 1 1 #_meanbodywt:8
#  1 1 1 1 #_meanbodywt:9
#  1 1 1 1 #_meanbodywt:10
#  1 1 1 1 #_meanbodywt:11
#  1 1 1 1 #_meanbodywt:12
#  1 1 1 1 #_meanbodywt:13
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  0 0 0 0 #_lencomp:_7
#  1 1 1 1 #_lencomp:_8
#  1 1 1 1 #_lencomp:_9
#  1 1 1 1 #_lencomp:_10
#  1 1 1 1 #_lencomp:_11
#  0 0 0 0 #_lencomp:_12
#  0 0 0 0 #_lencomp:_13
#  1 1 1 1 #_init_equ_catch1
#  1 1 1 1 #_init_equ_catch2
#  1 1 1 1 #_init_equ_catch3
#  1 1 1 1 #_init_equ_catch4
#  1 1 1 1 #_init_equ_catch5
#  1 1 1 1 #_init_equ_catch6
#  1 1 1 1 #_init_equ_catch7
#  1 1 1 1 #_init_equ_catch8
#  1 1 1 1 #_init_equ_catch9
#  1 1 1 1 #_init_equ_catch10
#  1 1 1 1 #_init_equ_catch11
#  1 1 1 1 #_init_equ_catch12
#  1 1 1 1 #_init_equ_catch13
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

