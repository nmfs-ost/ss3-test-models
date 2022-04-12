#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: Canary_data.SS // Canary_control.SS
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
3 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
 1 1 2 0
 1 1 3 0
#
0 #_N_movement_definitions
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) if do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, GP=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
 1 2 1 #_blocks_per_pattern 
# begin and end years of blocks
 2000 2014
 2000 2010 2011 2014
 1891 1891
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
2 #_N_breakpoints
 6 14 # age(real) at M breakpoints
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 6.8e-06 1.39e-05 2.85e-05 5.83e-05 0.000119295 0.000244164 0.000499664 0.00102224 0.00209011 0.00426839 0.00869559 0.0176272 0.0353807 0.0696495 0.132205 0.235559 0.381109 0.545888 0.692066 0.796225 0.859413 0.894075 0.912046 0.92109 0.925574 0.92778 0.928862 0.929391 0.92965 0.929776
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.04 0.08 0.0521 -2.9551 0.5323 3 -50 0 0 0 0 0.5 0 0 # NatM_break_1_Fem_GP_1
 0 0.9 0.63044 0.4 50 0 3 0 0 0 0 0.5 0 0 # NatM_break_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 2 15 9.06424 4 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 50 70 60.1066 60 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.02 0.21 0.127811 0.14 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.02 0.21 0.117092 0.15 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 -3 3 -1.48646 -1.3 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 1.18e-05 1.55e-05 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.094 3.03 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 40 41 40.5 40.5 50 6 -50 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.25 -0.25 50 6 -50 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 3 0.2619 1 50 6 -50 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -1 1 0.0217 0 50 6 -50 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # NatM_break_1_Mal_GP_1
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # NatM_break_2_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.118336 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.238553 0 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0.0856403 0 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 -1.3604 0 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 1.064e-05 1.55e-05 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.123 3.03 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 999 1 1 50 6 -50 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -7 7 0 1 50 0 -1 0 0 0 0 0 0 0 # RecrDist_Area_1
 -7 7 1.02681 1 50 0 1 0 1 1933 2014 -5 0 0 # RecrDist_Area_2
 -7 7 0.365448 1 50 0 1 0 1 1933 2014 -5 0 0 # RecrDist_Area_3
 0 999 1 1 50 6 -50 0 0 0 0 0.5 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-06 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 0.0001 2 0.5 0.5 0.5 6 -5 # RecrDist_Area_2_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_Area_2_dev_autocorr
 0.0001 2 0.5 0.5 0.5 6 -5 # RecrDist_Area_3_dev_se
 -0.99 0.99 0 0 0.5 6 -6 # RecrDist_Area_3_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 
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
             7            11       7.89813           8.5            50             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.21          0.99         0.773           0.4            50             6         -6          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.4            50             6        -50          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            50             6        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            50             6        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1960 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1933 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1965.76 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1978 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2012 #_last_yr_fullbias_adj_in_MPD
 2014 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 0.8025 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F
#  -0.106924 -0.110962 -0.115059 -0.11947 -0.124525 -0.130346 -0.13686 -0.143857 -0.150186 -0.156231 -0.161998 -0.170139 -0.177926 -0.185906 -0.194864 -0.204798 -0.214924 -0.22449 -0.233994 -0.242706 -0.251958 -0.241061 -0.235407 -0.216756 -0.171725 -0.0698707 0.0458007 0.0352782 0.318979 0.394615 0.378058 0.129261 -0.040935 -0.0377531 0.180908 0.902371 0.320521 -0.153325 -0.233209 0.289164 0.442293 0.284158 0.28943 0.224074 -0.213389 0.507066 0.997293 -1.03722 0.389703 -0.0904742 -0.645381 0.583221 -0.288593 -0.192336 0.184058 0.0195897 0.279733 0.0265724 0.12066 0.351481 0.0134144 0.0674319 0.388298 0.0709678 0.351587 -0.170865 -0.0720964 -0.355284 0.397086 -0.221625 0.336383 -0.817602 -1.19812 -0.345594 0.495298 -2.03845 0.314116 0.566482 -0.765383 -0.562161 -0.781455 -0.388296 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
0.9 # max F (methods 2-4) or harvest fraction (method 1)
# F_Method 1:  no additional input needed
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00619553 0.00988765 0.0102621 0.00669685 0.00707174 0.00603681 0.00557552 0.00678932 0.00691215 0.00781255 0.0107256 0.00938734 0.00930835 0.0103088 0.0110108 0.013338 0.00902884 0.00915005 0.00857031 0.00967331 0.00626811 0.00757655 0.00781171 0.0100228 0.008224 0.00694199 0.0023683 0.00731609 0.0300117 0.0701755 0.0681704 0.0295344 0.0320328 0.0272365 0.0267365 0.0289555 0.0199619 0.0200437 0.0143478 0.0152876 0.0153097 0.0177539 0.0232202 0.0174236 0.0140406 0.0113045 0.0116052 0.0153848 0.0103977 0.0138401 0.010265 0.0137608 0.0130027 0.0325614 0.0356773 0.0541419 0.0685309 0.0554345 0.0719631 0.0829744 0.0951229 0.0984345 0.149596 0.082412 0.124491 0.169311 0.290872 0.237503 0.216838 0.197468 0.112067 0.140143 0.154335 0.131414 0.269136 0.161463 0.287659 0.144238 0.199221 0.209152 0.364334 0.350735 0.367479 0.251747 0.0280801 0.0166007 0.0200592 0.00658624 0.00239518 0.00604377 0.00380556 0.00592004 0.00199341 0.00101421 0.000200066 0.000174417 0.000265756 0.000694332 0.000862394 0.0129212 0.0129212
# 2_OR_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.7344e-05 1.67491e-05 6.83699e-07 1.33332e-05 4.85503e-05 9.4735e-05 0 0.000135244 0.0031117 0.00481388 0.00910957 0.0322333 0.0584887 0.0952646 0.0638574 0.0420232 0.03093 0.0273543 0.0291239 0.0272487 0.0286325 0.0304611 0.0392975 0.0405023 0.061431 0.0666525 0.047607 0.0534849 0.0656387 0.0618963 0.0747529 0.0448012 0.0690723 0.0579788 0.0658265 0.00959552 0.0589203 0.0182575 0.0378163 0.0486519 0.0449505 0.0549206 0.0340802 0.023615 0.0139512 0.0332602 0.0977878 0.0742744 0.16964 0.129264 0.267015 0.306551 0.1459 0.126253 0.119636 0.171929 0.156938 0.20029 0.135469 0.247854 0.225874 0.264063 0.13038 0.107465 0.140767 0.109537 0.128829 0.065596 0.00362818 0.00303216 0.00300104 0.00111725 0.000721039 0.0014048 0.000937434 0.000616785 0.000587504 0.000509442 0.000236882 0.000378326 0.000649289 0.000771614 0.000962894 0.0176383 0.0176383
# 3_WA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.64263e-06 0 1.9821e-05 0.00015329 0.000197592 0.000176482 0.000260496 0.000273227 0.00060542 0.000227087 0.00442749 0.0144191 0.00609211 0.0644684 0.0344993 0.0186117 0.0307571 0.03843 0.0381476 0.0329178 0.032198 0.0142959 0.0206657 0.0197521 0.0190926 0.0159709 0.0203893 0.023073 0.0211648 0.0254372 0.0359939 0.0296581 0.0222409 0.0498872 0.0700693 0.0412985 0.0768682 0.0790127 0.0732374 0.0835924 0.0237067 0.0527698 0.0842599 0.119846 0.0935672 0.078122 0.221457 0.124759 0.13623 0.0973785 0.0809799 0.117979 0.112011 0.188995 0.173302 0.202977 0.208393 0.277681 0.293972 0.305427 0.30295 0.121505 0.0598035 0.0558019 0.0601612 0.0597669 0.055206 0.0354496 0.0036679 0.00279433 0.0052219 0.00231679 0.00171967 0.00372895 0.0024056 0.00159539 0.00146952 0.00115058 0.00116353 0.000867199 0.00125093 0.00108635 0.000391725 0.0279939 0.0279939
# 4_CA_NTWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000849152 0.00140163 0.00161061 0.000841567 0.000932747 0.000893553 0.000812101 0.000900633 0.00116019 0.0015932 0.00189842 0.0020318 0.00178802 0.00173503 0.00225171 0.00223106 0.00274158 0.00131134 0.00169966 0.00248827 0.00258591 0.00191581 0.00190659 0.00179403 0.00124915 0.00166902 0.00110886 0.00145311 0.00610749 0.0154332 0.0173999 0.00396052 0.0075815 0.00299928 0.00233734 0.00203221 0.00150384 0.00086571 0.00178708 0.000430748 0.000679056 0.000845729 0.00107591 0.000777663 0.00130881 0.000557744 0.000719314 0.000978119 0.000679816 0.000855735 0.000628439 0.000899151 0.000638055 0.00296558 0.00186878 0.00331847 0.0065273 0.00322111 0.00841019 0.00636501 0.00931648 0.0118621 0.031066 0.0308299 0.0243697 0.0476165 0.014258 0.0271289 0.0267245 0.0515957 0.0266423 0.0231794 0.026993 0.122813 0.134587 0.131144 0.114889 0.113058 0.0982764 0.118624 0.136192 0.125445 0.10976 0.0523263 0.0268421 0.0177234 0.000723137 0.000632343 0.00203495 0.000775906 0.00129216 0.00160886 0.000598911 0.000648554 0.00106027 0.00243559 0.000963045 0.00133726 0.00138592 0.0422407 0.0422407
# 5_OR_NTWL 0.000204274 0.000204308 0.000204341 5.25936e-05 1.27075e-05 1.30604e-05 7.41261e-06 1.23541e-05 1.72955e-05 2.25898e-05 2.75312e-05 3.24726e-05 3.77671e-05 4.27088e-05 4.76508e-05 5.25932e-05 5.78888e-05 6.2832e-05 6.77755e-05 7.30726e-05 7.80172e-05 8.29623e-05 8.82611e-05 9.32074e-05 9.81543e-05 0.000103102 0.000108403 0.000113352 0.000118302 0.000123605 0.000128556 0.000133509 0.000138815 0.00014377 0.000148726 0.000152624 0.000254747 0.000436427 0.000398031 0.000319643 0.000101854 0.000167642 0.000180742 0.000162364 0.000388107 0.000462708 0.000457316 0.000261135 0.000579867 0.000781058 0.0010945 0.00274365 0.000729188 0.000489333 0.000650768 0.00034622 0.000585628 0.000397628 0.000374822 0.000292748 0.000282082 0.000149219 0.000176882 0.0002239 0.000145804 0.000328773 6.84612e-05 0.000143614 9.78535e-05 0.000281608 0.000264204 0.000244306 0.000546559 0.00112627 0.00115972 0.00206071 0.00200254 0.00285941 0.00201819 0.00223494 0.00361671 0.00376799 0.00414615 0.00247208 0.00279362 0.00294917 0.00697903 0.0127461 0.010017 0.0100959 0.0175194 0.0254136 0.0200106 0.0205754 0.0199751 0.0184855 0.0302718 0.00237417 0.0082834 0.00781111 0.0232694 0.023826 0.0185272 0.0186278 0.0272353 0.0387625 0.037082 0.0229027 0.00653124 0.00294835 0.000146244 7.78711e-05 0.000295027 9.15305e-05 0.000161332 0.000238839 9.70715e-05 0.000126735 0.00019517 0.000530874 0.00023498 0.000321909 0.000341435 0.00955356 0.00955356
# 6_WA_NTWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00179394 0.00146469 0.00149084 0.00166754 0.00171518 0.0020648 0.00192938 0.000616126 0.00014759 0.000499379 0.00012946 0.000106044 5.04044e-05 0.000500235 0.000401362 0.000552805 0.000921287 0.000549817 0.000298905 0.000612953 0.0172664 0.0172664
# 7_CA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00060678 0.00121832 0.0014046 0.00188339 0.00236955 0.00285495 0.00334069 0.00382514 0.00432505 0.00516182 0.00512828 0.00454266 0.00661308 0.00617255 0.00330529 0.00316809 0.00261672 0.00357086 0.00647514 0.00542513 0.0110058 0.0145476 0.0180224 0.021694 0.0193257 0.0167431 0.0213066 0.0260791 0.0294733 0.0279782 0.0481587 0.0396486 0.0312048 0.0219146 0.0264407 0.0276313 0.0246642 0.036093 0.0373866 0.0377003 0.0394234 0.0434913 0.0566271 0.0505843 0.0652535 0.0741622 0.0793513 0.0836117 0.100235 0.101382 0.0997195 0.116558 0.10986 0.105063 0.185727 0.077848 0.0730113 0.111566 0.185889 0.173978 0.167069 0.109287 0.101771 0.113428 0.116679 0.100241 0.0646307 0.122483 0.0860952 0.154715 0.0461385 0.0962408 0.0993836 0.0419702 0.00798508 0.0222609 0.0120319 0.00260671 0.00705939 0.00524168 0.00147009 0.0178169 0.0152779 0.0196543 0.00336801 0.00359071 0.00303734 0.264241 0.264241
# 8_OR_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00435535 0.00942485 0.00745253 0.00102075 0.00404192 0.0122786 0.00293037 0.00745304 0.0136371 0.00660085 0.0088634 0.00905724 0.00959946 0.0120609 0.0110833 0.0120016 0.0063427 0.0127781 0.014067 0.0101303 0.00492525 0.00337793 0.00263547 0.00276942 0.000962549 0.00168037 0.000922279 0.000705583 0.000571319 0.000713966 0.000869977 0.000849307 0.00093718 0.000828749 0.000665259 0.0244106 0.0244106
# 9_WA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000284426 0 0 0 0 0 0 0 0.00128067 0.000611029 0.00161371 0.00229948 0.00187065 0.00152705 0.00101474 0.0011745 0.00193212 0.00296603 0.00144665 0.00257416 0.00479714 0.00439182 0.00520182 0.00517142 0.00608903 0.0126255 0.0124084 0.00686469 0.00549083 0.005006 0.00506327 0.00792231 0.00459028 0.00311489 0.00259709 0.00123016 0.00113596 0.000486603 0.000667166 0.000314377 0.000310538 0.000277815 0.000337331 0.000396674 0.000571023 0.000429732 0.00048822 0.000615027 0.0147075 0.0147075
# 10_CA_AHSOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000186342 0.000185142 0 0.000105579 6.24146e-06 0.000121564 0.000953476 2.15874e-05 2.75791e-05 1.93515e-05 0 1.54851e-05 0 0.00011283 0.000206645 5.55975e-05 2.53995e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.02456e-05 0 8.37716e-06 0 0 0 1.00726e-05 0.00010851 0.00010851
# 11_OR_ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000463405 9.17871e-05 0.000698804 0.000669497 0.000539382 0.000107022 1.60607e-05 0.000192358 0.000133557 0.000564887 9.82573e-05 0.000294869 0.000445158 0.000205962 0.000265102 0.000234012 1.27898e-05 2.64586e-05 2.56723e-05 2.77315e-05 4.44599e-06 9.70175e-05 5.18463e-05 4.32478e-06 4.67096e-05 0.00018628 0.000608898 5.01959e-05 0.000624859 0.00010796 0.000102118 0.00021702 0.000158247 1.81856e-05 1.35116e-05 1.10971e-05 2.51341e-05 3.97903e-05 4.89716e-05 0.000814601 0.000814601
# 12_WA_ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.25999e-05 0.00011892 0.00033765 6.48792e-05 0.00520297 0.00488533 0.00039442 0.000533172 0.000802039 0.00132818 0.000517136 0.000250235 0.000541933 0.00049807 0.000815945 0.000288391 0.00156507 9.38903e-05 0.0003078 0.00086364 0.00144058 0.00194799 0.000621388 0.000732806 0.000698122 0.000152078 0.000165693 0.000201771 0.000148031 0.000163115 0.000736421 0.000481128 0.000238736 0.000204257 6.30624e-05 9.39e-05 5.91884e-05 0.00387669 0.00387669
# 13_CA_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00679144 0.0167169 0.00498826 0.000328488 0 0 0.000167381 0.00644627 0.0187062 0.00533867 0.00540904 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 14_OR_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000144456 0.0266179 0.000209776 0 0 0.000754794 0.0207276 0.00287723 0.0021327 0.00128836 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 15_WA_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.164378 0.0952817 0.0542641 0.00898201 0.0146591 0.0271836 0.0567561 0.0866252 0.0563076 0.0222513 0.0184178 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 16_CA_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.19862e-05 6.49146e-05 0.000483095 8.31872e-05 0.000144326 3.31593e-05 3.88657e-05 7.79912e-06 4.87496e-06 6.88056e-06 3.02301e-05 3.27295e-05 0.000485299 0.000485299
# 17_OR_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.32926e-05 1.57169e-05 9.3088e-06 5.21068e-05 8.39832e-06 4.29526e-05 1.93574e-06 8.11423e-06 9.05715e-06 1.40112e-05 5.09329e-06 0.000111657 0.000870053 0.000870053
# 18_WA_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.21051e-05 0.000135247 1.50438e-05 0.00075616 6.07073e-05 3.74116e-05 1.65543e-05 0.000159717 0.000101271 0.000174016 1.51005e-05 0.000126147 0.00338917 0.00338917
# 19_CA_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.01441e-05 0 0 8.30243e-05 0 0 0.000644133 0 0 0.00020962 0 0 0.000204106 0 0 4.37366e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 20_OR_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.49022e-05 0 0 7.12915e-05 0 0 0.000133852 0 0 0.000163596 0 0 5.85621e-05 0 0 1.39823e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 21_WA_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000275972 0 0 2.81431e-05 0 0 0.000639043 0 0 0.00093155 0 0 0.000502251 0 0 9.57438e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 22_CA_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000439473 0 0 0.00033292 0 0 7.29869e-05 0 0 0.000118672 0 0 0 0 0 0 0 0 0 0 0 0
# 23_OR_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7.88641e-05 0 0 1.07719e-05 0 0 3.56452e-05 0 0 2.40125e-05 0 0 0 0 0 0 0 0 0 0 0 0
# 24_WA_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.67062e-06 0 0 3.46114e-05 0 0 0.0001145 0 0 6.31164e-05 0 0 0 0 0 0 0 0 0 0 0 0
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
        16         1         0         0         0         1  #  16_CA_NWFSC
        17         1         0         0         0         1  #  17_OR_NWFSC
        18         1         0         0         0         1  #  18_WA_NWFSC
        19         1         0         0         0         1  #  19_CA_Tri_early
        20         1         0         0         0         1  #  20_OR_Tri_early
        21         1         0         0         0         1  #  21_WA_Tri_early
        22         1         0         0         0         1  #  22_CA_Tri_late
        23         1         0         0         0         1  #  23_OR_Tri_late
        24         1         0         0         0         1  #  24_WA_Tri_late
        25         1         0         1         0         1  #  25_CA_prerec
        26         1         0         1         0         1  #  26_OR_prerec
        27         1         0         1         0         1  #  27_WA_prerec
        28         1         0         0         0         1  #  28_coastwide_NWFSC
        29         1         0         0         0         1  #  29_coastwide_Tri_early
        30         1         0         0         0         1  #  30_coastwide_Tri_late
        31         1         0         0         0         1  #  31_coastwide_prerec
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15     -0.607967             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_16_CA_NWFSC(16)
           -15            15      -1.04546             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_17_OR_NWFSC(17)
           -15            15     -0.194343             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_18_WA_NWFSC(18)
           -15            15      0.469639             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_19_CA_Tri_early(19)
           -15            15     -0.859163             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_20_OR_Tri_early(20)
           -15            15     -0.422087             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_21_WA_Tri_early(21)
           -15            15      0.627283             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_22_CA_Tri_late(22)
           -15            15      -1.23912             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_23_OR_Tri_late(23)
           -15            15      -1.00247             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_24_WA_Tri_late(24)
           -15            15      -8.42255             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_25_CA_prerec(25)
             0             3      0.812325           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_25_CA_prerec(25)
           -15            15      -8.31371             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_26_OR_prerec(26)
             0             3      0.696095           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_26_OR_prerec(26)
           -15            15      -8.86502             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_27_WA_prerec(27)
             0             3       1.19366           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_27_WA_prerec(27)
           -15            15       1.46356             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_28_coastwide_NWFSC(28)
           -15            15       1.73525             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_29_coastwide_Tri_early(29)
           -15            15       1.88031             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_30_coastwide_Tri_late(30)
           -15            15      -6.70773             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_31_coastwide_prerec(31)
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
 24 0 0 0 # 1 1_CA_TWL
 15 0 0 1 # 2 2_OR_TWL
 15 0 0 1 # 3 3_WA_TWL
 24 0 0 0 # 4 4_CA_NTWL
 15 0 0 4 # 5 5_OR_NTWL
 15 0 0 4 # 6 6_WA_NTWL
 24 0 0 0 # 7 7_CA_REC
 15 0 0 7 # 8 8_OR_REC
 15 0 0 7 # 9 9_WA_REC
 24 0 0 0 # 10 10_CA_AHSOP
 15 0 0 10 # 11 11_OR_ASHOP
 15 0 0 10 # 12 12_WA_ASHOP
 15 0 0 1 # 13 13_CA_FOR
 15 0 0 13 # 14 14_OR_FOR
 15 0 0 13 # 15 15_WA_FOR
 24 0 0 0 # 16 16_CA_NWFSC
 15 0 0 16 # 17 17_OR_NWFSC
 15 0 0 16 # 18 18_WA_NWFSC
 24 0 0 0 # 19 19_CA_Tri_early
 15 0 0 19 # 20 20_OR_Tri_early
 15 0 0 19 # 21 21_WA_Tri_early
 24 0 0 0 # 22 22_CA_Tri_late
 15 0 0 22 # 23 23_OR_Tri_late
 15 0 0 22 # 24 24_WA_Tri_late
 0 0 0 0 # 25 25_CA_prerec
 0 0 0 0 # 26 26_OR_prerec
 0 0 0 0 # 27 27_WA_prerec
 15 0 0 16 # 28 28_coastwide_NWFSC
 15 0 0 19 # 29 29_coastwide_Tri_early
 15 0 0 22 # 30 30_coastwide_Tri_late
 0 0 0 0 # 31 31_coastwide_prerec
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
 10 0 0 0 # 1 1_CA_TWL
 10 0 0 0 # 2 2_OR_TWL
 10 0 0 0 # 3 3_WA_TWL
 10 0 0 0 # 4 4_CA_NTWL
 10 0 0 0 # 5 5_OR_NTWL
 10 0 0 0 # 6 6_WA_NTWL
 10 0 0 0 # 7 7_CA_REC
 10 0 0 0 # 8 8_OR_REC
 10 0 0 0 # 9 9_WA_REC
 10 0 0 0 # 10 10_CA_AHSOP
 10 0 0 0 # 11 11_OR_ASHOP
 10 0 0 0 # 12 12_WA_ASHOP
 10 0 0 0 # 13 13_CA_FOR
 10 0 0 0 # 14 14_OR_FOR
 10 0 0 0 # 15 15_WA_FOR
 10 0 0 0 # 16 16_CA_NWFSC
 10 0 0 0 # 17 17_OR_NWFSC
 10 0 0 0 # 18 18_WA_NWFSC
 10 0 0 0 # 19 19_CA_Tri_early
 10 0 0 0 # 20 20_OR_Tri_early
 10 0 0 0 # 21 21_WA_Tri_early
 10 0 0 0 # 22 22_CA_Tri_late
 10 0 0 0 # 23 23_OR_Tri_late
 10 0 0 0 # 24 24_WA_Tri_late
 10 0 0 0 # 25 25_CA_prerec
 10 0 0 0 # 26 26_OR_prerec
 10 0 0 0 # 27 27_WA_prerec
 10 0 0 0 # 28 28_coastwide_NWFSC
 10 0 0 0 # 29 29_coastwide_Tri_early
 10 0 0 0 # 30 30_coastwide_Tri_late
 10 0 0 0 # 31 31_coastwide_prerec
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   1_CA_TWL LenSelex
          13.1            65       48.3567            50            50             0          4          0          0          0          0          0          2          2  #  Size_DblN_peak_1_CA_TWL(1)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_1_CA_TWL(1)
             0             9       4.20704           4.2            50             0          5          0          0          0          0          0          2          2  #  Size_DblN_ascend_se_1_CA_TWL(1)
             0             9    0.00710717           2.6            50             0          5          0          0          0          0          0          2          2  #  Size_DblN_descend_se_1_CA_TWL(1)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_1_CA_TWL(1)
            -5             5        1.5101             5            50             0          5          0          0          0          0          0          2          2  #  Size_DblN_end_logit_1_CA_TWL(1)
# 2   2_OR_TWL LenSelex
# 3   3_WA_TWL LenSelex
# 4   4_CA_NTWL LenSelex
        13.001            65       43.7275            50            50             0          4          0          0          0          0          0          1          2  #  Size_DblN_peak_4_CA_NTWL(4)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_4_CA_NTWL(4)
             0             9       5.02961           4.2            50             0          5          0          0          0          0          0          1          2  #  Size_DblN_ascend_se_4_CA_NTWL(4)
             0             9        6.0098           2.6            50             0          5          0          0          0          0          0          1          2  #  Size_DblN_descend_se_4_CA_NTWL(4)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_4_CA_NTWL(4)
            -5             5       -4.5879             5            50             0          5          0          0          0          0          0          1          2  #  Size_DblN_end_logit_4_CA_NTWL(4)
# 5   5_OR_NTWL LenSelex
# 6   6_WA_NTWL LenSelex
# 7   7_CA_REC LenSelex
        13.001            65       32.4189            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_7_CA_REC(7)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_7_CA_REC(7)
             0             9       3.72801           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_7_CA_REC(7)
             0             9       3.41372           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_7_CA_REC(7)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_7_CA_REC(7)
            -5             5      -1.78665             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_7_CA_REC(7)
# 8   8_OR_REC LenSelex
# 9   9_WA_REC LenSelex
# 10   10_CA_AHSOP LenSelex
        13.001            65       45.8904            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_10_CA_AHSOP(10)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_10_CA_AHSOP(10)
             0             9       2.96418           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_10_CA_AHSOP(10)
             0             9    0.00583914           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_10_CA_AHSOP(10)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_10_CA_AHSOP(10)
            -5             5       0.72461             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_10_CA_AHSOP(10)
# 11   11_OR_ASHOP LenSelex
# 12   12_WA_ASHOP LenSelex
# 13   13_CA_FOR LenSelex
# 14   14_OR_FOR LenSelex
# 15   15_WA_FOR LenSelex
# 16   16_CA_NWFSC LenSelex
        13.001            65       13.0241            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_16_CA_NWFSC(16)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_16_CA_NWFSC(16)
             0             9       4.48811           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_16_CA_NWFSC(16)
             0             9       8.64162           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_16_CA_NWFSC(16)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_16_CA_NWFSC(16)
            -5             5       4.87429             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_16_CA_NWFSC(16)
# 17   17_OR_NWFSC LenSelex
# 18   18_WA_NWFSC LenSelex
# 19   19_CA_Tri_early LenSelex
        13.001            65       54.3291            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_19_CA_Tri_early(19)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_19_CA_Tri_early(19)
             0             9       6.60878           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_19_CA_Tri_early(19)
             0             9      0.252696           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_19_CA_Tri_early(19)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_19_CA_Tri_early(19)
            -5             5      0.455113             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_19_CA_Tri_early(19)
# 20   20_OR_Tri_early LenSelex
# 21   21_WA_Tri_early LenSelex
# 22   22_CA_Tri_late LenSelex
        13.001            65       51.3761            50            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_22_CA_Tri_late(22)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_top_logit_22_CA_Tri_late(22)
             0             9       5.69703           4.2            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_22_CA_Tri_late(22)
             0             9       4.61741           2.6            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_descend_se_22_CA_Tri_late(22)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  Size_DblN_start_logit_22_CA_Tri_late(22)
            -5             5      0.492379             5            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_end_logit_22_CA_Tri_late(22)
# 23   23_OR_Tri_late LenSelex
# 24   24_WA_Tri_late LenSelex
# 25   25_CA_prerec LenSelex
# 26   26_OR_prerec LenSelex
# 27   27_WA_prerec LenSelex
# 28   28_coastwide_NWFSC LenSelex
# 29   29_coastwide_Tri_early LenSelex
# 30   30_coastwide_Tri_late LenSelex
# 31   31_coastwide_prerec LenSelex
# 1   1_CA_TWL AgeSelex
# 2   2_OR_TWL AgeSelex
# 3   3_WA_TWL AgeSelex
# 4   4_CA_NTWL AgeSelex
# 5   5_OR_NTWL AgeSelex
# 6   6_WA_NTWL AgeSelex
# 7   7_CA_REC AgeSelex
# 8   8_OR_REC AgeSelex
# 9   9_WA_REC AgeSelex
# 10   10_CA_AHSOP AgeSelex
# 11   11_OR_ASHOP AgeSelex
# 12   12_WA_ASHOP AgeSelex
# 13   13_CA_FOR AgeSelex
# 14   14_OR_FOR AgeSelex
# 15   15_WA_FOR AgeSelex
# 16   16_CA_NWFSC AgeSelex
# 17   17_OR_NWFSC AgeSelex
# 18   18_WA_NWFSC AgeSelex
# 19   19_CA_Tri_early AgeSelex
# 20   20_OR_Tri_early AgeSelex
# 21   21_WA_Tri_early AgeSelex
# 22   22_CA_Tri_late AgeSelex
# 23   23_OR_Tri_late AgeSelex
# 24   24_WA_Tri_late AgeSelex
# 25   25_CA_prerec AgeSelex
# 26   26_OR_prerec AgeSelex
# 27   27_WA_prerec AgeSelex
# 28   28_coastwide_NWFSC AgeSelex
# 29   29_coastwide_Tri_early AgeSelex
# 30   30_coastwide_Tri_late AgeSelex
# 31   31_coastwide_prerec AgeSelex
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        13.001            65       43.6159            50            50             0      4  # Size_DblN_peak_1_CA_TWL(1)_BLK2repl_2000
        13.001            65       43.8766            50            50             0      4  # Size_DblN_peak_1_CA_TWL(1)_BLK2repl_2011
             0             9       4.25791           4.2            50             0      5  # Size_DblN_ascend_se_1_CA_TWL(1)_BLK2repl_2000
             0             9       4.93812           4.2            50             0      5  # Size_DblN_ascend_se_1_CA_TWL(1)_BLK2repl_2011
             0             9       1.50368           2.6            50             0      5  # Size_DblN_descend_se_1_CA_TWL(1)_BLK2repl_2000
             0             9     0.0224259           2.6            50             0      5  # Size_DblN_descend_se_1_CA_TWL(1)_BLK2repl_2011
            -5             5      0.264536             5            50             0      5  # Size_DblN_end_logit_1_CA_TWL(1)_BLK2repl_2000
            -5             5     -0.879918             5            50             0      5  # Size_DblN_end_logit_1_CA_TWL(1)_BLK2repl_2011
        13.001            65       42.5552            50            50             0      4  # Size_DblN_peak_4_CA_NTWL(4)_BLK1repl_2000
             0             9       4.62636           4.2            50             0      5  # Size_DblN_ascend_se_4_CA_NTWL(4)_BLK1repl_2000
             0             9       4.66754           2.6            50             0      5  # Size_DblN_descend_se_4_CA_NTWL(4)_BLK1repl_2000
            -5             5       3.18202             5            50             0      5  # Size_DblN_end_logit_4_CA_NTWL(4)_BLK1repl_2000
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
#      1    25     1     0     0     0     0     1     1  1933  2014    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      1    26     3     0     0     0     0     2     1  1933  2014    -5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     5     2     2     0     0     0     0     0     0     0
#      5     3     7     2     2     0     0     0     0     0     0     0
#      5     4     9     2     2     0     0     0     0     0     0     0
#      5     6    11     2     2     0     0     0     0     0     0     0
#      5     7    13     1     2     0     0     0     0     0     0     0
#      5     9    14     1     2     0     0     0     0     0     0     0
#      5    10    15     1     2     0     0     0     0     0     0     0
#      5    12    16     1     2     0     0     0     0     0     0     0
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
      4      1     0.128
      5      1     0.266
      4      2     0.128
      5      2     0.266
      4      3     0.128
      5      3     0.266
      4      4     0.325
      4      5     0.325
      4      6     0.325
      4      7     0.092
      5      7       0.1
      4      8     0.092
      5      8       0.1
      4      9     0.092
      5      9       0.1
      4     10     0.176
      5     10     0.235
      4     11     0.176
      5     11     0.235
      4     12     0.176
      5     12     0.235
      4     16     0.081
      4     17     0.081
      4     18     0.081
      4     19     0.093
      4     20     0.093
      4     21     0.093
      4     22     0.114
      4     23     0.114
      4     24     0.114
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 36 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 28 1 0 1
 1 29 1 0 1
 1 30 1 0 1
 1 31 1 0 1
 4 28 1 0 1
 4 29 1 0 1
 4 30 1 0 1
 4 31 1 0 1
 5 28 1 0 1
 5 29 1 0 1
 5 30 1 0 1
 5 31 1 0 1
 4 1 1 0.7034 1
 4 2 1 0.4561 1
 4 3 1 0.4429 1
 4 4 1 0.9871 1
 4 5 1 0.7753 1
 4 6 1 0.5091 1
 4 7 1 1 1
 4 8 1 1 1
 4 9 1 0.8585 1
 4 10 1 0.8889 1
 4 11 1 0.5509 1
 4 12 1 0.5351 1
 5 1 1 0.2966 1
 5 2 1 0.5439 1
 5 3 1 0.5571 1
 5 4 1 0.0129 1
 5 5 1 0.2247 1
 5 6 1 0.4909 1
 5 7 1 0 1
 5 8 1 0 1
 5 9 1 0.1415 1
 5 10 1 0.1111 1
 5 11 1 0.4491 1
 5 12 1 0.4649 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  0 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  0 #_CPUE/survey:_7
#  0 #_CPUE/survey:_8
#  0 #_CPUE/survey:_9
#  0 #_CPUE/survey:_10
#  0 #_CPUE/survey:_11
#  0 #_CPUE/survey:_12
#  0 #_CPUE/survey:_13
#  0 #_CPUE/survey:_14
#  0 #_CPUE/survey:_15
#  1 #_CPUE/survey:_16
#  1 #_CPUE/survey:_17
#  1 #_CPUE/survey:_18
#  1 #_CPUE/survey:_19
#  1 #_CPUE/survey:_20
#  1 #_CPUE/survey:_21
#  1 #_CPUE/survey:_22
#  1 #_CPUE/survey:_23
#  1 #_CPUE/survey:_24
#  1 #_CPUE/survey:_25
#  1 #_CPUE/survey:_26
#  1 #_CPUE/survey:_27
#  0 #_CPUE/survey:_28
#  0 #_CPUE/survey:_29
#  0 #_CPUE/survey:_30
#  0 #_CPUE/survey:_31
#  0.7034 #_lencomp:_1
#  0.4561 #_lencomp:_2
#  0.4429 #_lencomp:_3
#  0.9871 #_lencomp:_4
#  0.7753 #_lencomp:_5
#  0.5091 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  0.8585 #_lencomp:_9
#  0.8889 #_lencomp:_10
#  0.5509 #_lencomp:_11
#  0.5351 #_lencomp:_12
#  0 #_lencomp:_13
#  0 #_lencomp:_14
#  0 #_lencomp:_15
#  1 #_lencomp:_16
#  1 #_lencomp:_17
#  1 #_lencomp:_18
#  1 #_lencomp:_19
#  1 #_lencomp:_20
#  1 #_lencomp:_21
#  1 #_lencomp:_22
#  1 #_lencomp:_23
#  1 #_lencomp:_24
#  0 #_lencomp:_25
#  0 #_lencomp:_26
#  0 #_lencomp:_27
#  0 #_lencomp:_28
#  0 #_lencomp:_29
#  0 #_lencomp:_30
#  0 #_lencomp:_31
#  0.2966 #_agecomp:_1
#  0.5439 #_agecomp:_2
#  0.5571 #_agecomp:_3
#  0.0129 #_agecomp:_4
#  0.2247 #_agecomp:_5
#  0.4909 #_agecomp:_6
#  0 #_agecomp:_7
#  0 #_agecomp:_8
#  0.1415 #_agecomp:_9
#  0.1111 #_agecomp:_10
#  0.4491 #_agecomp:_11
#  0.4649 #_agecomp:_12
#  0 #_agecomp:_13
#  0 #_agecomp:_14
#  0 #_agecomp:_15
#  1 #_agecomp:_16
#  1 #_agecomp:_17
#  1 #_agecomp:_18
#  1 #_agecomp:_19
#  1 #_agecomp:_20
#  1 #_agecomp:_21
#  1 #_agecomp:_22
#  1 #_agecomp:_23
#  1 #_agecomp:_24
#  0 #_agecomp:_25
#  0 #_agecomp:_26
#  0 #_agecomp:_27
#  0 #_agecomp:_28
#  0 #_agecomp:_29
#  0 #_agecomp:_30
#  0 #_agecomp:_31
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
#  1 #_init_equ_catch13
#  1 #_init_equ_catch14
#  1 #_init_equ_catch15
#  1 #_init_equ_catch16
#  1 #_init_equ_catch17
#  1 #_init_equ_catch18
#  1 #_init_equ_catch19
#  1 #_init_equ_catch20
#  1 #_init_equ_catch21
#  1 #_init_equ_catch22
#  1 #_init_equ_catch23
#  1 #_init_equ_catch24
#  1 #_init_equ_catch25
#  1 #_init_equ_catch26
#  1 #_init_equ_catch27
#  1 #_init_equ_catch28
#  1 #_init_equ_catch29
#  1 #_init_equ_catch30
#  1 #_init_equ_catch31
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

