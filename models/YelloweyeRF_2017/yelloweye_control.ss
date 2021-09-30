#V3.30.18.00;_safe;_compile_date:_Sep 30 2021;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C Yelloweye 2017 control file
#_data_and_control_files: yelloweye_data.ss // yelloweye_control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
2 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
 1 1 2 0
#
0 #_N_movement_definitions
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) if do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, GP=1, source=1 dest=2, age1=4, age2=10
#
4 #_Nblock_Patterns
 1 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1992 2004
 2005 2016
 2002 2016
 2002 2016
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
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
1 #_N_breakpoints
 4 # age(real) at M breakpoints
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
70 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.15 0.0439034 -3.12576 0.438438 3 -1 0 0 0 0 0 0 0 # NatM_break_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 1 35 23 30 99 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40 120 61 66 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.2 0.05 0.05 99 0 1 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.5 0.1 0.1 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.5 0.1 0.1 99 0 7 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 7.31281e-06 7.31281e-06 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 -3 4 3.24248 3.24248 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 38 45 42.0705 41.765 99 0 -50 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.402214 -0.36886 99 0 -50 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 300000 7.21847e-08 7.21847e-08 1 6 -6 0 0 0 0 0 0 0 # Eggs_scalar_Fem_GP_1
 -3 39000 4.043 4.043 1 6 -6 0 0 0 0 0 0 0 # Eggs_exp_len_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 -0.1 0 99 0 3 0 0 0 0 0 0 0 # RecrDist_Area_2
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # CohortGrowDev
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
             3            15           6.1             5            99             0          3          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.718         0.718         0.158             2         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             5           0.5           0.5            99             0         -2          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
            -1             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1980 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
7 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1889 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 7 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1917 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1975 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2013 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.36 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1889E 1890E 1891E 1892E 1893E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978E 1979E 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.09 # F ballpark value in units of annual_F
1999 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
0.9 # max F (methods 2-4) or harvest fraction (method 1)
# F_Method 1:  no additional input needed
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_TWL 0 2.0229e-06 3.03438e-06 5.05738e-06 6.069e-06 8.09225e-06 9.10414e-06 1.11278e-05 1.21401e-05 1.41643e-05 1.61888e-05 1.7202e-05 1.92273e-05 2.02411e-05 2.22673e-05 2.32819e-05 2.53091e-05 2.63246e-05 2.8353e-05 3.0382e-05 3.1399e-05 3.34294e-05 3.44474e-05 3.64792e-05 3.74983e-05 3.95316e-05 4.05519e-05 4.25867e-05 6.69337e-05 7.81136e-05 5.48012e-05 5.58252e-05 4.56835e-05 3.95993e-05 4.2652e-05 2.43767e-05 1.72708e-05 6.30091e-05 0.000106756 0.000136316 0.000160824 0.000149726 8.9703e-05 0.000107111 0.000166449 0.000164525 0.000171835 0.000152581 0.000181479 0.000171419 0.000177781 0.000164601 0.000119467 2.78385e-05 0.000211504 0.000863292 0.00191976 0.00170142 0.000743405 0.000681858 0.000392073 0.000361194 0.00104882 0.00092378 0.000912465 0.000532485 0.000600175 0.00092014 0.00112829 0.00111587 0.000933305 0.000813736 0.000388303 0.00040205 0.00065908 0.000342547 0.000424668 0.000399574 0.000683346 0.000420171 0.0024327 0.0027194 0.0047223 0.00640929 0.0050305 0.00522651 0.00594451 0.00542057 0.00516302 0.015191 0.00769351 0.00198874 0.00392352 0.0265395 0.00780791 0.00613637 0.00104693 0.00141449 0.00242845 0.00446363 0.00138532 0.0015028 0.00210842 0.00243406 0.000962072 0.00073263 0.000576485 0.00255331 0.000974175 0.000646275 0.00135861 0.000114122 9.62397e-05 5.54644e-05 1.98589e-05 3.03024e-06 3.00463e-06 5.95902e-07 0 2.49216e-06 3.19927e-06 8.66073e-06 0 4.26413e-07 1.26992e-06 7.70388e-06 4.17133e-07 4.14196e-07 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05 1.3833e-05
# 2_CA_NONTWL 0 7.08015e-06 1.3149e-05 2.02295e-05 2.6299e-05 3.33805e-05 3.94513e-05 4.65344e-05 5.26069e-05 5.96922e-05 6.67789e-05 7.28553e-05 7.99451e-05 8.60246e-05 9.31179e-05 9.92011e-05 0.000106298 0.000112386 0.000119487 0.000126592 0.000132686 0.000139796 0.000145895 0.00015301 0.000159114 0.000166235 0.000172346 0.000179473 0.000300187 0.000353033 0.000164404 0.000186761 0.00018781 0.000170582 0.000181779 0.000262049 0.000374879 0.000431917 0.000495145 0.000425225 0.000414274 0.000539828 0.000483173 0.000722231 0.000286945 0.000426131 0.000645403 0.000675862 0.000441907 0.00048141 0.000484017 0.000305541 0.000431524 0.000319627 0.000396183 0.00170593 0.00414395 0.00431553 0.000963595 0.00176611 0.000650293 0.000486873 0.000748253 0.000577628 0.000339646 0.000723497 0.000195779 0.000194109 0.000437764 0.000329148 0.000177772 0.000243686 0.000184335 0.000191192 0.000614193 0.000500646 0.000606196 0.000491189 0.000485098 0.000432399 0.000436324 0.000389608 0.000534749 0.000848188 0.000679268 0.00135213 0.0011733 0.0016033 0.00181574 0.00378543 0.00483019 0.00341478 0.0155252 0.00206948 0.00105851 0.000616006 0.000596832 0.00335101 0.00547987 0.00510317 0.00625758 0.0104748 0.0200692 0.0148919 0.0072529 0.00775964 0.007449 0.00878951 0.00896555 0.00278056 0.00215401 0.000517455 0.000605379 4.62203e-06 7.63803e-06 0.000113634 0.000109669 2.97951e-05 0.000137393 9.38226e-05 2.76301e-05 5.77382e-06 2.86432e-05 0.000125081 7.90172e-05 2.80141e-06 5.56177e-05 0 0 0 0 0 0 0 0 0 0 0 0 0
# 3_CA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.47826e-05 0.000130653 0.000149996 0.000199815 0.000250714 0.000300762 0.000350805 0.000402011 0.000452415 0.000537655 0.000529068 0.000463209 0.000666397 0.000616917 0.0003283 0.000314141 0.000257908 0.00034516 0.000597147 0.000478875 0.000959666 0.00124585 0.00152267 0.00180703 0.00158474 0.00136129 0.00171683 0.00207673 0.00233677 0.00232331 0.00363346 0.00315242 0.0022578 0.00177429 0.00226198 0.00237454 0.00207101 0.00318624 0.00347014 0.0035138 0.00416465 0.00450953 0.00511474 0.00457977 0.00593824 0.00762685 0.008141 0.00836021 0.00960327 0.00879214 0.00830973 0.00956882 0.00926411 0.00607215 0.0134636 0.00698885 0.010669 0.017393 0.00924119 0.0107506 0.00841737 0.0086602 0.00685259 0.0050208 0.00317042 0.00123746 0.00216832 0.0020179 0.0018653 0.00234159 0.000783014 0.00202622 0.00124252 0.000771093 0.000306143 0.000607108 0.000150541 0.000149274 0.000148031 0.000587213 0.000145679 0.000722579 0.000143452 0.000284669 0.000282536 0.000140244 0.000139223 0.000276412 0.000137235 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328 0.00458328
# 4_ORWA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.23751e-06 1.11938e-06 0 1.12162e-06 3.36754e-06 6.74551e-06 0 1.01469e-05 0.000232451 0.000358342 0.000674632 0.00236838 0.00418686 0.00656418 0.00405017 0.0025036 0.00177491 0.00148557 0.00161211 0.0014189 0.00151366 0.00118115 0.00152036 0.00156092 0.00202302 0.00273768 0.00219717 0.00238669 0.00302167 0.00273064 0.00317931 0.00086559 0.000235417 0.00818896 0.000368207 0.000828235 0.000360753 0.00579893 0.000861002 0.00166686 0.000898566 0.00116464 0.000540521 0.000658447 0.000849872 0.000613276 0.00292994 0.00556742 0.0106326 0.0117487 0.0204038 0.0386264 0.0161251 0.0290294 0.0140568 0.0111357 0.0208492 0.0326511 0.0138072 0.0211713 0.0245747 0.0260674 0.0171336 0.0269261 0.0177357 0.0174765 0.00930805 0.00434114 0.00118613 0.000379528 0.000368775 0.000125707 0.0001125 0.0002746 0.000309512 1.92973e-05 3.37595e-05 1.86879e-05 1.6346e-05 1.20638e-05 1.18752e-05 2.14449e-05 5.7631e-06 5.67815e-06 1.30612e-05 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207 0.000436207
# 5_ORWA_NONTWL 4.63343e-06 4.63345e-06 8.10857e-06 0.000421649 0.000411386 0.000411543 0.000106694 2.55159e-05 2.55161e-05 1.50778e-05 2.66761e-05 3.47951e-05 4.52341e-05 5.56739e-05 6.49547e-05 8.46761e-05 8.58406e-05 9.62857e-05 0.000105573 0.000226242 0.000126486 0.000136942 0.000146239 0.0001567 0.000167164 0.000177632 0.000258933 0.000197431 0.000207911 0.00215375 0.000885775 0.000765301 0.000737811 0.000510829 0.000595026 0.00108437 0.00134121 0.00204452 0.00267037 0.00259447 0.00208711 0.00229953 0.00138123 0.000866994 0.00121898 0.00149962 0.00114913 0.00197609 0.00176167 0.00194618 0.00126723 0.00204508 0.00327281 0.00376248 0.0061648 0.00274123 0.00140605 0.00254255 0.00135413 0.00165978 0.00139424 0.00184201 0.00224402 0.00163615 0.000704324 0.00128801 0.00122226 0.000547214 0.00107455 0.000302572 0.0006858 0.000624826 0.000625035 0.000658206 0.000524298 0.000397717 0.000598064 0.000417099 0.000849112 0.000728335 0.00168251 0.000557685 0.00107903 0.00140672 0.00148547 0.00187793 0.000995798 0.00132284 0.00222558 0.00316553 0.00649924 0.00335143 0.00326665 0.00436088 0.00655595 0.00591816 0.0107528 0.0106463 0.0160457 0.00807447 0.00723891 0.0125532 0.0159868 0.0174586 0.028068 0.0170138 0.00894595 0.0213171 0.0273031 0.0110589 0.0254367 0.00383636 0.00668773 0.00105202 0.000559894 0.000585811 0.000402192 0.000515048 0.000862937 0.00079115 0.000494556 0.000191851 0.000265417 0.000412072 0.000624243 0.000451522 0.000648255 0.000525062 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356 0.0175356
# 6_OR_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000906583 0.00156865 0.000767644 0.00238698 0.00246031 0.00304334 0.00386698 0.00349301 0.0031043 0.00522079 0.00728276 0.00506338 0.00442653 0.0043584 0.00466566 0.00149107 0.00261781 0.00268612 0.00274741 0.00365874 0.00359676 0.00256947 0.003131 0.00207694 0.00233669 0.00352154 0.00393808 0.0018622 0.00119126 0.000696638 0.000778024 0.000324382 0.000454505 0.000257496 0.00039068 0.000443595 0.000478116 0.000492974 0.000511271 0.000604325 0.000690896 0.00050771 0.000674546 0.000500605 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188 0.0167188
# 7_WA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00048419 0.000505901 0.00104389 0.000518689 0.000535219 0.000312452 0.000589736 0.000860878 0.00121626 0.00216791 0.00169025 0.0017105 0.00220207 0.00177152 0.0032006 0.00281039 0.0071871 0.00665064 0.00708189 0.00459767 0.00459228 0.00483909 0.00520529 0.00678284 0.00564591 0.00606987 0.00647481 0.000862857 0.000595491 0.00101034 0.000970294 0.000367939 0.000526897 0.000435876 0.000422039 0.000495728 0.000504038 0.000696051 0.000472769 0.000606051 0.000590258 0.000656559 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272 0.0219272
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         3         1         0         1         0         1  #  3_CA_REC
         6         1         0         1         0         1  #  6_OR_REC
         7         1         0         1         0         1  #  7_WA_REC
         8         1         0         1         0         1  #  8_CACPFV
         9         1         0         1         0         1  #  9_OR_RECOB
        10         1         0         1         0         1  #  10_TRI_ORWA
        11         1         0         1         0         1  #  11_NWFSC_ORWA
        12         1         0         1         0         1  #  12_IPHC_ORWA
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -11.1349             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_3_CA_REC(3)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_3_CA_REC(3)
           -15            15      -10.3284             0            99             0         -1          0          0          0          0          0          2          1  #  LnQ_base_6_OR_REC(6)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_6_OR_REC(6)
           -20            15      -9.48439             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_7_WA_REC(7)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_7_WA_REC(7)
           -15            15      -11.3209             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_8_CACPFV(8)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_8_CACPFV(8)
           -15            15      -9.98138             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_9_OR_RECOB(9)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_9_OR_RECOB(9)
           -15            15      -2.71003             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_10_TRI_ORWA(10)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_10_TRI_ORWA(10)
           -15            15      -1.79222             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_11_NWFSC_ORWA(11)
             0             5             0          0.01            99             0         -5          0          0          0          0          0          0          0  #  Q_extraSD_11_NWFSC_ORWA(11)
           -15            15      -6.48507             0            99             0         -1          0          0          0          0          0          0          0  #  LnQ_base_12_IPHC_ORWA(12)
             0             5             0          0.01            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_12_IPHC_ORWA(12)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
            -4             4          -0.6             0            99            -1      1  # LnQ_base_6_OR_REC(6)_BLK2add_2005
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
 24 0 0 0 # 1 1_CA_TWL
 24 0 0 0 # 2 2_CA_NONTWL
 24 0 0 0 # 3 3_CA_REC
 24 0 0 1 # 4 4_ORWA_TWL
 24 0 0 2 # 5 5_ORWA_NONTWL
 24 0 0 0 # 6 6_OR_REC
 24 0 0 0 # 7 7_WA_REC
 15 0 0 3 # 8 8_CACPFV
 24 0 0 0 # 9 9_OR_RECOB
 24 0 0 0 # 10 10_TRI_ORWA
 24 0 0 0 # 11 11_NWFSC_ORWA
 24 0 0 0 # 12 12_IPHC_ORWA
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
 10 0 0 0 # 1 1_CA_TWL
 10 0 0 0 # 2 2_CA_NONTWL
 10 0 0 0 # 3 3_CA_REC
 10 0 0 0 # 4 4_ORWA_TWL
 10 0 0 0 # 5 5_ORWA_NONTWL
 10 0 0 0 # 6 6_OR_REC
 10 0 0 0 # 7 7_WA_REC
 10 0 0 0 # 8 8_CACPFV
 10 0 0 0 # 9 9_OR_RECOB
 10 0 0 0 # 10 10_TRI_ORWA
 10 0 0 0 # 11 11_NWFSC_ORWA
 10 0 0 0 # 12 12_IPHC_ORWA
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   1_CA_TWL LenSelex
            20            60            45            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_1_CA_TWL(1)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_1_CA_TWL(1)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_1_CA_TWL(1)
            -1            30            20             9            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_1_CA_TWL(1)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_1_CA_TWL(1)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_1_CA_TWL(1)
# 2   2_CA_NONTWL LenSelex
            20            60            45            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_2_CA_NONTWL(2)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_2_CA_NONTWL(2)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_2_CA_NONTWL(2)
            -1            30            20             9            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_2_CA_NONTWL(2)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_2_CA_NONTWL(2)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_2_CA_NONTWL(2)
# 3   3_CA_REC LenSelex
            20            60            44            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_3_CA_REC(3)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_3_CA_REC(3)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_3_CA_REC(3)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_3_CA_REC(3)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_3_CA_REC(3)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_3_CA_REC(3)
# 4   4_ORWA_TWL LenSelex
            20            60            40            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_4_ORWA_TWL(4)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_4_ORWA_TWL(4)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_4_ORWA_TWL(4)
            -1            30            20             9            99             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_4_ORWA_TWL(4)
          -999             9          -999          -999            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_4_ORWA_TWL(4)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_4_ORWA_TWL(4)
# 5   5_ORWA_NONTWL LenSelex
            20            60            50            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_5_ORWA_NONTWL(5)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_5_ORWA_NONTWL(5)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_5_ORWA_NONTWL(5)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_5_ORWA_NONTWL(5)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_5_ORWA_NONTWL(5)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_5_ORWA_NONTWL(5)
# 6   6_OR_REC LenSelex
            20            60            40            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_6_OR_REC(6)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_6_OR_REC(6)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_6_OR_REC(6)
            -1            30            12             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_6_OR_REC(6)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_6_OR_REC(6)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_6_OR_REC(6)
# 7   7_WA_REC LenSelex
            20            60          44.4            30            99             0          6          0          0          0          0          0          0          0  #  Size_DblN_peak_7_WA_REC(7)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_7_WA_REC(7)
            -1             9          4.49             6            99             0          6          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_7_WA_REC(7)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_7_WA_REC(7)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_7_WA_REC(7)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_7_WA_REC(7)
# 8   8_CACPFV LenSelex
# 9   9_OR_RECOB LenSelex
            20            60            40            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_9_OR_RECOB(9)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_9_OR_RECOB(9)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_9_OR_RECOB(9)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_9_OR_RECOB(9)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_9_OR_RECOB(9)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_9_OR_RECOB(9)
# 10   10_TRI_ORWA LenSelex
            20            80            50            30            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_10_TRI_ORWA(10)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_10_TRI_ORWA(10)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_10_TRI_ORWA(10)
            -1            30            12             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_10_TRI_ORWA(10)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_10_TRI_ORWA(10)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_10_TRI_ORWA(10)
# 11   11_NWFSC_ORWA LenSelex
            20            60            50            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_11_NWFSC_ORWA(11)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_11_NWFSC_ORWA(11)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_11_NWFSC_ORWA(11)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_11_NWFSC_ORWA(11)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_11_NWFSC_ORWA(11)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_11_NWFSC_ORWA(11)
# 12   12_IPHC_ORWA LenSelex
            20            60            50            40            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_12_IPHC_ORWA(12)
           -15             4           -15           -15            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_top_logit_12_IPHC_ORWA(12)
            -1             9             6             6            99             0          4          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_12_IPHC_ORWA(12)
            -1            30            20             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_12_IPHC_ORWA(12)
          -999             9          -999            -5            99             0         -4          0          0          0          0          0          0          0  #  Size_DblN_start_logit_12_IPHC_ORWA(12)
          -999             9          -999             9            99             0         -5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_12_IPHC_ORWA(12)
# 1   1_CA_TWL AgeSelex
# 2   2_CA_NONTWL AgeSelex
# 3   3_CA_REC AgeSelex
# 4   4_ORWA_TWL AgeSelex
# 5   5_ORWA_NONTWL AgeSelex
# 6   6_OR_REC AgeSelex
# 7   7_WA_REC AgeSelex
# 8   8_CACPFV AgeSelex
# 9   9_OR_RECOB AgeSelex
# 10   10_TRI_ORWA AgeSelex
# 11   11_NWFSC_ORWA AgeSelex
# 12   12_IPHC_ORWA AgeSelex
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
#      3     3     1     2     1     0     0     0     0     0     0     0
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
      4      1   0.84204
      4      2   0.35975
      4      3  0.600663
      4      4  0.182385
      4      5  0.486995
      4      6  0.395623
      4      7  0.892214
      4      8  0.705075
      4      9  0.780701
      4     10  0.537479
      4     11  0.654133
      4     12         1
      5      2  0.555438
      5      3  0.587597
      5      4   0.47074
      5      5  0.478139
      5      6   0.36123
      5      7         1
      5     11         1
      5     12 0.0277953
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_CPUE/survey:_9
#  1 #_CPUE/survey:_10
#  1 #_CPUE/survey:_11
#  1 #_CPUE/survey:_12
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  1 #_lencomp:_9
#  1 #_lencomp:_10
#  1 #_lencomp:_11
#  1 #_lencomp:_12
#  0 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_agecomp:_4
#  1 #_agecomp:_5
#  1 #_agecomp:_6
#  1 #_agecomp:_7
#  0 #_agecomp:_8
#  0 #_agecomp:_9
#  0 #_agecomp:_10
#  1 #_agecomp:_11
#  1 #_agecomp:_12
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
#  1 #_init_equ_catch11
#  1 #_init_equ_catch12
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  1 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

