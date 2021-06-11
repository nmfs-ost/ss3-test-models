#V3.30.17.00;_2021_06_11;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_data_and_control_files: 2017pop.dat // 2017pop.ctl
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
 5 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1918 1991 1992 2001 2002 2007 2008 2008 2009 2010
 1918 2010
 1995 2004
 1918 1999
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
20 #_Growth_Age_for_L2 (999 to use as Linf)
0.055 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
3 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.02 0.1 0.054 -2.92 0.44 3 -5 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 15 25 20.8 20.8 10 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 35 45 41.4 41.4 10 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.1 0.4 0.166 0.166 0.05 0 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.03 5 1.31 1.31 0.5 0 5 0 0 0 0 0 0 0 # SD_young_Fem_GP_1
 0.03 5 2.68 2.68 0.5 0 5 0 0 0 0 0 0 0 # SD_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 3 1.003e-05 1.003e-05 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.1026 3.1026 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 20 40 32.1 32.1 99 0 -99 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -2 4 -1 -1 99 0 -99 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 6 8.66e-10 1 99 0 -99 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 -3 5 4.9767 5 99 0 -99 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -1 1 0 0.05 0.1 6 -5 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -1 1 0 0 0.1 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 1 -0.066 -0.066 0.1 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -1 1 0.167 0.167 0.1 0 3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -5 5 0 0 0.5 0 -5 0 0 0 0 0 0 0 # SD_young_Mal_GP_1
 -5 5 -0.1 0 0.5 0 5 0 0 0 0 0 0 0 # SD_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 3 9.881e-06 9.881e-06 99 0 -99 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.1039 3.1039 99 0 -99 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
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
 0.01 0.99 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
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
             5            20           9.5            10             5             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.15             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
           0.5           1.2           0.7           0.7            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -99          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1940 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1900 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1955 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1975 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2012 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.7 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940R 1941R 1942R 1943R 1944R 1945R 1946R 1947R 1948R 1949R 1950R 1951R 1952R 1953R 1954R 1955R 1956R 1957R 1958R 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.03 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
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
# Yr:  1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fishery 1.10313e-05 4.10576e-06 3.41688e-06 3.19645e-06 1.91052e-06 2.49838e-06 5.13455e-06 6.49399e-06 1.03335e-05 1.3429e-05 1.20054e-05 9.71829e-06 1.0343e-05 8.63449e-06 7.11889e-06 1.07565e-05 2.5215e-05 7.49771e-05 1.863e-05 2.58876e-05 5.28421e-05 9.24507e-05 0.00020372 0.000266391 0.000419907 0.00505635 0.0083924 0.020032 0.00989777 0.00527646 0.00641984 0.00847341 0.0131846 0.0153692 0.0230453 0.0172769 0.0252709 0.0200092 0.0324375 0.0282851 0.0225504 0.0133282 0.0251757 0.0359412 0.0489526 0.0674553 0.0747628 0.0991869 0.0488782 0.0392348 0.060344 0.0355399 0.0384453 0.0205653 0.0189865 0.0174651 0.0163335 0.0123159 0.0240041 0.0241509 0.037771 0.0282881 0.0316223 0.0256157 0.0191227 0.0297729 0.0304893 0.0256766 0.0246969 0.0199064 0.0246594 0.0261804 0.0185266 0.0253004 0.0210119 0.0248441 0.019116 0.0156647 0.0149811 0.0120573 0.011744 0.00905749 0.00244464 0.00437871 0.00276077 0.00230553 0.00221803 0.00111638 0.00120639 0.00224722 0.00169652 0.00277994 0.00238333 0.000710799 0.000725372 0.000681867 0.000677053 0.000667204 0.000722676 0.00325337 0.00323217 0.0382243 0.0382243 0.0382243 0.0382243 0.0382243 0.0382243 0.0382243 0.0382243 0.0382243 0.0382243
# ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00122095 0.000616657 7.20015e-05 0.00029053 0.000283143 0.000876113 0.0002845 0.000517871 0.000198005 4.16968e-05 0.000204847 0.000353638 9.48741e-05 7.97574e-05 7.5999e-05 0.0014062 0.00079611 0.00642602 1.48913e-05 0.00142973 0.000788321 0.000105506 0.000105321 0.000363702 0.00026585 0.000160247 0.000328005 5.91772e-05 9.49342e-05 1.5801e-05 2.48562e-05 4.52337e-05 5.75496e-05 0.000223549 2.16189e-05 0.000231129 0.000124084 6.04353e-05 7.15035e-05 5.12732e-05 0.000112711 0.000131933 0.000419197 0.000416002 0.00697831 0.00697831 0.00697831 0.00697831 0.00697831 0.00697831 0.00697831 0.00697831 0.00697831 0.00697831
# Foreign 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.219701 0.207917 0.128128 0.00955209 0.00894547 0.0181379 0.018857 0.0349393 0.0286194 0.0096225 0.00456283 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# POP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000467375 0 0 0 0 0 0.000178616 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# Triennial 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000330248 0 0 0.000128056 0 0 0.000118798 0 0 3.79667e-05 0 0 0.000111613 0 0 9.72973e-05 0 0 7.29336e-05 0 0 9.53607e-05 0 0 4.2042e-05 0 0 4.55029e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# AFSCSlope 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.07086e-05 0 0 0 6.2526e-06 0 2.30257e-07 0 1.39609e-05 2.03859e-06 0 9.47386e-08 1.37893e-05 1.27794e-06 0 1.16978e-05 2.54507e-06 6.7058e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# NWFSCSlope 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.08361e-06 4.96024e-06 6.98403e-06 3.98722e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# NWFSCcombo 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.79729e-05 6.40125e-06 1.30476e-05 1.24866e-05 5.85331e-06 7.97351e-06 2.68322e-05 1.58773e-05 1.15639e-05 1.5334e-05 1.62887e-05 5.2965e-06 1.40942e-05 2.75797e-05 0 0 0.00145877 0.00145877 0.00145877 0.00145877 0.00145877 0.00145877 0.00145877 0.00145877 0.00145877 0.00145877
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         0         0         1  #  POP
         5         1         0         1         0         1  #  Triennial
         6         1         0         0         0         1  #  AFSCSlope
         7         1         0         0         0         1  #  NWFSCSlope
         8         1         0         1         0         1  #  NWFSCcombo
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15     -0.503519             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_POP(4)
           -15            15      -2.26513             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial(5)
             0           0.5        0.3853             0             1             0         -2          0          0          0          0          0          0          0  #  Q_extraSD_Triennial(5)
           -15            15      -2.91733             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_AFSCSlope(6)
           -15            15      -3.23493             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCSlope(7)
           -15            15       -2.7715             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCcombo(8)
             0           0.5      0.036141             0             1             0          2          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCcombo(8)
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
 24 1 0 0 # 1 Fishery
 24 0 0 0 # 2 ASHOP
 15 0 0 1 # 3 Foreign
 1 0 0 0 # 4 POP
 24 0 0 0 # 5 Triennial
 24 0 0 0 # 6 AFSCSlope
 24 0 0 0 # 7 NWFSCSlope
 24 0 0 0 # 8 NWFSCcombo
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
 10 0 0 0 # 1 Fishery
 10 0 0 0 # 2 ASHOP
 10 0 0 0 # 3 Foreign
 10 0 0 0 # 4 POP
 10 0 0 0 # 5 Triennial
 10 0 0 0 # 6 AFSCSlope
 10 0 0 0 # 7 NWFSCSlope
 10 0 0 0 # 8 NWFSCcombo
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Fishery LenSelex
            20            45       38.2359            28            10             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_Fishery(1)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Fishery(1)
            -1             9       3.54865             4             2             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Fishery(1)
            -9             9         -1.65             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Fishery(1)
            -5             9          -3.5             4             2             0          4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Fishery(1)
            -5             9      0.627262            -2             2             0          2          0          0          0          0          0          4          2  #  Size_DblN_end_logit_Fishery(1)
            15            45       28.2494            35            10             0          1          0          0          0          0        0.5          0          0  #  Retain_L_infl_Fishery(1)
           0.1            10       1.09467             1             2             0          1          0          0          0          0        0.5          2          1  #  Retain_L_width_Fishery(1)
           -10            10           6.5           6.5             2             0          1          0          0          0          0        0.5          1          2  #  Retain_L_asymptote_logit_Fishery(1)
             0             0             0             0            99             0         -3          0          0          0          0        0.5          0          0  #  Retain_L_maleoffset_Fishery(1)
# 2   ASHOP LenSelex
            20          49.5            45            28            10             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_ASHOP(2)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_ASHOP(2)
            -1             9       4.96786             4             2             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_ASHOP(2)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_ASHOP(2)
            -9             9         -4.35            -4             2             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_ASHOP(2)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_ASHOP(2)
# 3   Foreign LenSelex
# 4   POP LenSelex
            20            70       23.0092            30            10             0          1          0          0          0          0          0          0          0  #  Size_inflection_POP(4)
         0.001            50       12.1564            15             5             0          3          0          0          0          0          0          0          0  #  Size_95%width_POP(4)
# 5   Triennial LenSelex
            20            45       27.6542            28            10             0         -1          0          0          0          0          0          0          0  #  Size_DblN_peak_Triennial(5)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_Triennial(5)
            -1             9           5.5             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_Triennial(5)
            -1             9        3.2432             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_Triennial(5)
            -5             9            -5            -5             2             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_Triennial(5)
            -5             9      -0.67802            -2             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_Triennial(5)
# 6   AFSCSlope LenSelex
            20            45       22.0613            28            10             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_AFSCSlope(6)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_AFSCSlope(6)
            -1             9       1.42853             4             2             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_AFSCSlope(6)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_AFSCSlope(6)
            -9             9            -9            -9             2             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_AFSCSlope(6)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_AFSCSlope(6)
# 7   NWFSCSlope LenSelex
            20            45       36.6071            28            10             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_NWFSCSlope(7)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NWFSCSlope(7)
            -1             9       1.84426             4             2             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NWFSCSlope(7)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NWFSCSlope(7)
            -9             9            -9            -9             2             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NWFSCSlope(7)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NWFSCSlope(7)
# 8   NWFSCcombo LenSelex
            18          49.5         21.43            28            10             0          1          0          0          0          0          0          0          0  #  Size_DblN_peak_NWFSCcombo(8)
            -6             4            -5            -1             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_top_logit_NWFSCcombo(8)
            -1             9       2.90756             4             2             0          3          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_NWFSCcombo(8)
            -1             9             1             4             2             0         -3          0          0          0          0          0          0          0  #  Size_DblN_descend_se_NWFSCcombo(8)
            -9             9            -9            -4             2             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_NWFSCcombo(8)
            -5           999           999           999             2             0         -2          0          0          0          0          0          0          0  #  Size_DblN_end_logit_NWFSCcombo(8)
# 1   Fishery AgeSelex
# 2   ASHOP AgeSelex
# 3   Foreign AgeSelex
# 4   POP AgeSelex
# 5   Triennial AgeSelex
# 6   AFSCSlope AgeSelex
# 7   NWFSCSlope AgeSelex
# 8   NWFSCcombo AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -5             9      0.627262            -2             2             0      4  # Size_DblN_end_logit_Fishery(1)_BLK4repl_1918
           0.1            10       1.09467             1             2             0      4  # Retain_L_width_Fishery(1)_BLK2add_1918
           -10            10       3.93772           3.9             2             0      4  # Retain_L_asymptote_logit_Fishery(1)_BLK1repl_1918
           -10            10        2.3021           1.7             2             0      4  # Retain_L_asymptote_logit_Fishery(1)_BLK1repl_1992
           -10            10       1.74548           0.6             2             0      4  # Retain_L_asymptote_logit_Fishery(1)_BLK1repl_2002
           -10            10      0.635019             0             2             0      4  # Retain_L_asymptote_logit_Fishery(1)_BLK1repl_2008
           -10            10      -0.06241             0             2             0      4  # Retain_L_asymptote_logit_Fishery(1)_BLK1repl_2009
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
#      5     6     1     4     2     0     0     0     0     0     0     0
#      5     8     2     2     1     0     0     0     0     0     0     0
#      5     9     3     1     2     0     0     0     0     0     0     0
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
      4      1 0.0955977
      4      2  0.104648
      4      4         1
      4      6  0.076979
      4      7  0.564539
      4      8  0.030745
      5      1  0.217385
      5      2    0.0318
      5      4         1
      5      7  0.303584
      5      8  0.363011
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 12 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 4 1 1 0.5 1
 4 2 1 0.5 1
 4 4 1 0.5 1
 4 6 1 0.5 1
 4 7 1 0.5 1
 5 1 1 0.5 1
 5 2 1 0.5 1
 5 4 1 0.5 1
 5 7 1 0.5 1
 1 5 1 0 1
 4 5 1 0 1
 5 5 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  1 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_discard:_1
#  0 #_discard:_2
#  0 #_discard:_3
#  0 #_discard:_4
#  0 #_discard:_5
#  0 #_discard:_6
#  0 #_discard:_7
#  0 #_discard:_8
#  0.5 #_lencomp:_1
#  0.5 #_lencomp:_2
#  0 #_lencomp:_3
#  0.5 #_lencomp:_4
#  0 #_lencomp:_5
#  0.5 #_lencomp:_6
#  0.5 #_lencomp:_7
#  1 #_lencomp:_8
#  0.5 #_agecomp:_1
#  0.5 #_agecomp:_2
#  0 #_agecomp:_3
#  0.5 #_agecomp:_4
#  0 #_agecomp:_5
#  0 #_agecomp:_6
#  0.5 #_agecomp:_7
#  1 #_agecomp:_8
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_init_equ_catch7
#  1 #_init_equ_catch8
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

