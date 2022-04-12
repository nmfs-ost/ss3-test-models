#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C China rockfish control file for central model (40-10 to OR/WA border)
#_data_and_control_files: china_central_data.ss // china_central_control.ss
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
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1899 1899
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
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
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.01 0.15 0.07 -2.94 0.53 3 -3 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 -10 45 2 2 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 50 36.852 34 10 0 6 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.158753 0.1 0.8 0 6 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.25 0.1 0.1 0.8 0 -6 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.25 0.078843 0.1 0.8 0 6 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 0 1 1.17e-05 1.17e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.177 3 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 1 100 28.5 28.5 0.8 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -9 9 -1 0 0.8 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 0.196 1 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0.0571 0 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -1 0.15 0 0.053 0.8 0 -3 0 0 0 0 0 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -1 45 0 2 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 50 0 33.13 10 0 -4 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -1 0.3 0 0.2461 0.8 0 -4 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 0.25 0 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 0.25 0 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 0 1 1.17e-05 1.17e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal_GP_1
 2 4 3.177 3 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_month_1
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
             3            12       4.26638             6            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.773         0.773         0.147             2         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.5           0.8             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1971 # first year of main recr_devs; early devs can preceed this era
2001 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -4 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 900 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1820 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2001 #_last_yr_fullbias_adj_in_MPD
 2015 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 1 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
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
#  1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002F 2003F 2004F 2005F 2006F 2007F 2008F 2009F 2010F 2011F 2012F 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark value in units of annual_F
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
2.9 # max F (methods 2-4) or harvest fraction (method 1)
5  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_NorthOf4010_Comm_Dead 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.06937e-05 2.06951e-05 0 6.209e-05 0.000186292 0.00205126 0.00170182 0.00255746 0.00162467 0.00643719 0.0125364 0.00747804 0.00211015 0.00153531 4.26229e-05 0 0 0.000127372 0.000169637 0.000190625 2.11592e-05 0.000232539 0.000295711 0 0 0 0 0 0.000189128 0 2.09877e-05 0 0 0 0 0 4.18164e-05 0.00016719 2.08901e-05 0 0 0 0 2.08468e-05 0 2.08924e-05 2.09241e-05 2.09679e-05 4.2088e-05 0.000232488 4.26331e-05 2.1512e-05 0 2.18667e-05 0 0 0 0 0 2.27884e-05 0.000527802 0.00587865 0.00169039 0.00682166 0.00203604 0.00247926 0.0117708 0.00984289 0.00525779 0.00397869 0.00177267 0.00182797 0.00133744 0.00153134 0.000302336 0.000743252 0.000470418 0.000500182 0.00136699 0.000872481 0.000168817 0.000134903 0.000303537 0.000272106 0.000171232 6.82004e-05 6.71751e-05 6.59961e-05 0.000310753 0.000310753 0.000310753 0.000310753 0.000310753 0.000310753 0.000310753 0.000310753 0.000310753 0.000310753
# 2_CA_NorthOf4010_Comm_Live 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.47091e-05 0.00451088 0.00223856 0.00447516 0.00608323 0.00329027 0.00590735 0.00162719 0.000948733 0.00195193 0.00274413 0.00529373 0.00519765 0.00202635 0.000881493 0.0011754 0.00128409 0.000563511 0.000297069 0.000195118 0.000191751 0.0013744 0.0013744 0.0013744 0.0013744 0.0013744 0.0013744 0.0013744 0.0013744 0.0013744 0.0013744
# 3_CA_NorthOf4010_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.39047e-05 3.39724e-05 3.40385e-05 3.41637e-05 3.44608e-05 3.47727e-05 3.49091e-05 0 0 0 0 3.48236e-05 3.47869e-05 3.47478e-05 3.47111e-05 6.93531e-05 6.92871e-05 6.92146e-05 6.91349e-05 6.90593e-05 6.89886e-05 0.000103385 0.000103306 0.000103231 6.87652e-05 3.43543e-05 3.43262e-05 3.42989e-05 3.42724e-05 3.42479e-05 3.42262e-05 0 6.83789e-05 3.41709e-05 6.83062e-05 3.41359e-05 3.41184e-05 6.82077e-05 3.4119e-05 3.41825e-05 0 0 0 0.00010387 0.000104864 0.000141272 0.000142486 0.000107964 0.000291116 3.67903e-05 7.41454e-05 0.00044735 0.00105129 0.000415947 0.000228771 0.000889564 0.000782959 0.000474686 0.00060117 0.000570631 0.000501117 0.000256739 0.000264372 9.21027e-05 0.000490004 0.00129419 0.00167834 0.00154517 0.00196391 0.000481785 0.00096254 0.00083835 0.00384224 0.00121148 0.00403029 0.00164845 0.000977314 0.00228168 0.00161593 0.00049506 0.000365205 0.000358031 0.00229584 0.00229584 0.00229584 0.00229584 0.00229584 0.00229584 0.00229584 0.00229584 0.00229584 0.00229584
# 4_CA_NorthOf4010_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.95899e-05 2.95921e-05 2.95933e-05 2.95945e-05 2.95982e-05 2.96288e-05 2.968e-05 5.94761e-05 5.95889e-05 5.98034e-05 6.03137e-05 6.08467e-05 6.10748e-05 3.0561e-05 3.05524e-05 3.05187e-05 3.04821e-05 6.08976e-05 6.08317e-05 9.11445e-05 0.000121399 0.000151601 0.000181753 0.000151308 0.00015114 0.000181178 0.000211167 0.000241117 0.000301177 0.000240777 0.000180444 0.000120201 0.000120108 6.00084e-05 5.99642e-05 5.99235e-05 0.000119775 2.99279e-05 0.000149567 5.97959e-05 0.000149416 2.98689e-05 5.97087e-05 0.000149211 8.95667e-05 5.98202e-05 2.99587e-05 3.00259e-05 3.01434e-05 0.000242281 0.000305665 0.000246988 0.00031129 0.000440123 0.000508393 0.000192661 0.000452815 0.00159313 0.00173486 0.00115339 0.000465023 0.00205422 0.0021804 0.00144519 0.00229967 0.0024789 0.00217513 0.00103918 0.000229062 0.000717149 0.00169214 0.00222941 0.00204722 0.00255061 0.00462984 0.00226112 0.00189685 0.00249814 0.00444303 0.00417042 0.00461656 0.00331812 0.00549725 0.00533858 0.00511509 0.00346534 0.00227334 0.00228079 0.00743677 0.00743677 0.00743677 0.00743677 0.00743677 0.00743677 0.00743677 0.00743677 0.00743677 0.00743677
# 5_OR_SouthernOR_Comm_Dead 2.17981e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.17969e-05 2.17984e-05 0 0 0 0 0 2.19031e-05 2.19429e-05 0 0 2.2391e-05 2.24685e-05 2.24802e-05 8.98745e-05 2.24395e-05 8.96361e-05 0.00011191 2.23559e-05 2.23299e-05 0.000156145 2.22853e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 2.20435e-05 0 0 0 0 0 0 0 0 0 2.20134e-05 0 0 0.000199599 2.22768e-05 0.000292156 0.000158805 0.000160034 0.000761427 0.000838957 0.000564781 0.000521124 0.000333145 0.00215471 0.00209555 0.00262027 0.0028508 0.00168919 0.00220615 0.00213048 0.0162996 0.0171642 0.0155289 0.015063 0.0282024 0.0262555 0.00838091 0.0130717 0.0109642 0.00696127 0.00403053 0.00234848 0.00197224 0.00423127 0.00537849 0.00417737 0.00192296 0.00511534 0.00483042 0.00585953 0.0027152 0.00173398 0.00177336 0.00668737 0.00668737 0.00668737 0.00668737 0.00668737 0.00668737 0.00668737 0.00668737 0.00668737 0.00668737
# 6_OR_SouthernOR_Comm_Live 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0147346 0.0264538 0.0456132 0.0305351 0.0516155 0.0597127 0.0294876 0.0212466 0.0122585 0.0147509 0.0175096 0.0226901 0.0243536 0.0156269 0.0239332 0.0271356 0.019965 0.0132999 0.00858945 0.00871071 0.0326987 0.0326987 0.0326987 0.0326987 0.0326987 0.0326987 0.0326987 0.0326987 0.0326987 0.0326987
# 7_OR_SouthernOR_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000504847 0.000853498 0.000411619 0.00120593 0.00130628 0.00169666 0.00950025 0.00297054 0.00513521 0.00472144 0.00457128 0.00485828 0.00355962 0.00340667 0.00446982 0.00132578 0.00365789 0.00460105 0.00187674 0.00277088 0.00332349 0.00364154 0.00261428 0.00330742 0.00437625 0.0033429 0.00800498 0.00403318 0.00158596 0.0016739 0.00141226 0.00126285 0.00142492 0.00190825 0.00207603 0.00143251 0.000666266 0.00111002 0.00172114 0.0020735 0.00141175 0.00101206 0.000663802 0.000650992 0.00239726 0.00239726 0.00239726 0.00239726 0.00239726 0.00239726 0.00239726 0.00239726 0.00239726 0.00239726
# 8_OR_SouthernOR_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000613953 0.00103594 0.000518824 0.00152752 0.00159886 0.00209832 0.00506376 0.00177211 0.00300101 0.00279302 0.00278927 0.00167082 0.00206916 0.00200987 0.00245007 0.001609 0.00565957 0.00661718 0.0025158 0.00328919 0.00424046 0.00465793 0.00370619 0.00286744 0.00415704 0.00330013 0.00581695 0.00287505 0.00183308 0.00204318 0.00178745 0.00225929 0.00287593 0.00280544 0.00269912 0.00255228 0.00280093 0.00348574 0.00342991 0.00236588 0.00372159 0.00277912 0.00176571 0.00178729 0.00516262 0.00516262 0.00516262 0.00516262 0.00516262 0.00516262 0.00516262 0.00516262 0.00516262 0.00516262
# 9_OR_NorthernOR_Comm 2.17981e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.17969e-05 2.17984e-05 0 0 0 0 0 2.19031e-05 2.19429e-05 0 0 2.2391e-05 2.24685e-05 2.24802e-05 8.98745e-05 2.24395e-05 8.96361e-05 0.00011191 2.23559e-05 2.23299e-05 0.000156145 2.22853e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 2.20435e-05 0 0 0 0 0 0 0 0 0 2.20134e-05 0 0 0.000199599 2.22768e-05 0.000292156 0.000158805 0.000160034 0.000738353 0.000815652 0.000541248 0.000497437 0.000333145 0.00201106 0.00267364 0.0019652 0.00130252 0.00158983 0.00160447 2.53629e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 3.58582e-05 0.000144389 0.00021795 0.000108847 7.2558e-05 0.000219564 7.37048e-05 0.000110075 7.22458e-05 7.09312e-05 0.000191281 0.000191281 0.000191281 0.000191281 0.000191281 0.000191281 0.000191281 0.000191281 0.000191281 0.000191281
# 10_OR_NorthernOR_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.001122 0.00191591 0.00094667 0.00276925 0.00295989 0.00387824 0.00396515 0.00429311 0.00578714 0.00573474 0.00728246 0.00741039 0.00379939 0.00437109 0.00286765 0.00403457 0.00623852 0.00626396 0.00416447 0.00703586 0.0089521 0.00639124 0.00334501 0.00546112 0.00657826 0.00524077 0.007508 0.00639631 0.00548987 0.00572929 0.00474104 0.00422494 0.00327412 0.00468987 0.00592074 0.00532559 0.00407526 0.00437223 0.00668807 0.00726626 0.00644713 0.00221212 0.00145195 0.00146734 0.00882748 0.00882748 0.00882748 0.00882748 0.00882748 0.00882748 0.00882748 0.00882748 0.00882748 0.00882748
# 11_OR_NorthernOR_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0001785 0.00033209 0.000153514 0.000692313 0.000746408 0.000646373 0.00255648 0.00237043 0.00257501 0.0025458 0.00324868 0.0033087 0.00170697 0.00193656 0.0012807 0.000812517 0.000875087 0.00140153 0.000896517 0.00189764 0.00292494 0.00219042 0.00156509 0.00081603 0.00151558 0.00157895 0.00160123 0.00145881 0.00221931 0.00245541 0.00215887 0.00183507 0.00216857 0.00283082 0.00346786 0.00379182 0.00326021 0.00312914 0.00411574 0.00536319 0.00548877 0.00229887 0.00149466 0.00150927 0.00667176 0.00667176 0.00667176 0.00667176 0.00667176 0.00667176 0.00667176 0.00667176 0.00667176 0.00667176
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         6         1         0         1         1         1  #  6_OR_SouthernOR_Comm_Live
         7         1         0         0         1         1  #  7_OR_SouthernOR_Rec_PC
        10         1         0         0         1         1  #  10_OR_NorthernOR_Rec_PC
        12         1         0         1         1         1  #  12_OR_SouthernOR_Rec_PC_ORBS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -9.08663             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_6_OR_SouthernOR_Comm_Live(6)
             0             2     0.0205425             1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_6_OR_SouthernOR_Comm_Live(6)
           -15            15             0             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_7_OR_SouthernOR_Rec_PC(7)
           -15            15      -8.70618             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_10_OR_NorthernOR_Rec_PC(10)
           -15            15      -9.06985             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_12_OR_SouthernOR_Rec_PC_ORBS(12)
             0             2     0.0910689             1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_12_OR_SouthernOR_Rec_PC_ORBS(12)
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
 24 0 0 0 # 1 1_CA_NorthOf4010_Comm_Dead
 24 0 0 0 # 2 2_CA_NorthOf4010_Comm_Live
 24 0 0 0 # 3 3_CA_NorthOf4010_Rec_PC
 24 0 0 0 # 4 4_CA_NorthOf4010_Rec_PR
 24 0 0 0 # 5 5_OR_SouthernOR_Comm_Dead
 24 0 0 0 # 6 6_OR_SouthernOR_Comm_Live
 24 0 0 0 # 7 7_OR_SouthernOR_Rec_PC
 24 0 0 0 # 8 8_OR_SouthernOR_Rec_PR
 15 0 0 5 # 9 9_OR_NorthernOR_Comm
 24 0 0 0 # 10 10_OR_NorthernOR_Rec_PC
 15 0 0 10 # 11 11_OR_NorthernOR_Rec_PR
 15 0 0 7 # 12 12_OR_SouthernOR_Rec_PC_ORBS
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
 10 0 0 0 # 1 1_CA_NorthOf4010_Comm_Dead
 10 0 0 0 # 2 2_CA_NorthOf4010_Comm_Live
 10 0 0 0 # 3 3_CA_NorthOf4010_Rec_PC
 10 0 0 0 # 4 4_CA_NorthOf4010_Rec_PR
 10 0 0 0 # 5 5_OR_SouthernOR_Comm_Dead
 10 0 0 0 # 6 6_OR_SouthernOR_Comm_Live
 10 0 0 0 # 7 7_OR_SouthernOR_Rec_PC
 10 0 0 0 # 8 8_OR_SouthernOR_Rec_PR
 10 0 0 0 # 9 9_OR_NorthernOR_Comm
 10 0 0 0 # 10 10_OR_NorthernOR_Rec_PC
 10 0 0 0 # 11 11_OR_NorthernOR_Rec_PR
 10 0 0 0 # 12 12_OR_SouthernOR_Rec_PC_ORBS
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   1_CA_NorthOf4010_Comm_Dead LenSelex
            19            45       33.3365            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_1_CA_NorthOf4010_Comm_Dead(1)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_1_CA_NorthOf4010_Comm_Dead(1)
             0             9       2.71027             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_1_CA_NorthOf4010_Comm_Dead(1)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_1_CA_NorthOf4010_Comm_Dead(1)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_1_CA_NorthOf4010_Comm_Dead(1)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_1_CA_NorthOf4010_Comm_Dead(1)
# 2   2_CA_NorthOf4010_Comm_Live LenSelex
            19            45       32.6968            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_2_CA_NorthOf4010_Comm_Live(2)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_2_CA_NorthOf4010_Comm_Live(2)
             0             9        2.6758             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_2_CA_NorthOf4010_Comm_Live(2)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_2_CA_NorthOf4010_Comm_Live(2)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_2_CA_NorthOf4010_Comm_Live(2)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_2_CA_NorthOf4010_Comm_Live(2)
# 3   3_CA_NorthOf4010_Rec_PC LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_3_CA_NorthOf4010_Rec_PC(3)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_3_CA_NorthOf4010_Rec_PC(3)
             0             9       3.43077             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_3_CA_NorthOf4010_Rec_PC(3)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_3_CA_NorthOf4010_Rec_PC(3)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_3_CA_NorthOf4010_Rec_PC(3)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_3_CA_NorthOf4010_Rec_PC(3)
# 4   4_CA_NorthOf4010_Rec_PR LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_4_CA_NorthOf4010_Rec_PR(4)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_4_CA_NorthOf4010_Rec_PR(4)
             0             9       3.83796             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_4_CA_NorthOf4010_Rec_PR(4)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_4_CA_NorthOf4010_Rec_PR(4)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_4_CA_NorthOf4010_Rec_PR(4)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_4_CA_NorthOf4010_Rec_PR(4)
# 5   5_OR_SouthernOR_Comm_Dead LenSelex
            19            45       33.6809            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_5_OR_SouthernOR_Comm_Dead(5)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_5_OR_SouthernOR_Comm_Dead(5)
             0             9       2.17676             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_5_OR_SouthernOR_Comm_Dead(5)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_5_OR_SouthernOR_Comm_Dead(5)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_5_OR_SouthernOR_Comm_Dead(5)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_5_OR_SouthernOR_Comm_Dead(5)
# 6   6_OR_SouthernOR_Comm_Live LenSelex
            19            45       32.2566            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_6_OR_SouthernOR_Comm_Live(6)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_6_OR_SouthernOR_Comm_Live(6)
             0             9       1.08275             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_6_OR_SouthernOR_Comm_Live(6)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_6_OR_SouthernOR_Comm_Live(6)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_6_OR_SouthernOR_Comm_Live(6)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_6_OR_SouthernOR_Comm_Live(6)
# 7   7_OR_SouthernOR_Rec_PC LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_7_OR_SouthernOR_Rec_PC(7)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_7_OR_SouthernOR_Rec_PC(7)
             0             9       3.66389             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_7_OR_SouthernOR_Rec_PC(7)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_7_OR_SouthernOR_Rec_PC(7)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_7_OR_SouthernOR_Rec_PC(7)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_7_OR_SouthernOR_Rec_PC(7)
# 8   8_OR_SouthernOR_Rec_PR LenSelex
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  Size_DblN_peak_8_OR_SouthernOR_Rec_PR(8)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_8_OR_SouthernOR_Rec_PR(8)
             0             9       3.59146             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_8_OR_SouthernOR_Rec_PR(8)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_8_OR_SouthernOR_Rec_PR(8)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_8_OR_SouthernOR_Rec_PR(8)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_8_OR_SouthernOR_Rec_PR(8)
# 9   9_OR_NorthernOR_Comm LenSelex
# 10   10_OR_NorthernOR_Rec_PC LenSelex
            19            45       39.0664            30            50             0          4          0          0          0          0          0          0          0  #  Size_DblN_peak_10_OR_NorthernOR_Rec_PC(10)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_top_logit_10_OR_NorthernOR_Rec_PC(10)
             0             9       4.10353             4            50             0          5          0          0          0          0          0          0          0  #  Size_DblN_ascend_se_10_OR_NorthernOR_Rec_PC(10)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_descend_se_10_OR_NorthernOR_Rec_PC(10)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_start_logit_10_OR_NorthernOR_Rec_PC(10)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  Size_DblN_end_logit_10_OR_NorthernOR_Rec_PC(10)
# 11   11_OR_NorthernOR_Rec_PR LenSelex
# 12   12_OR_SouthernOR_Rec_PC_ORBS LenSelex
# 1   1_CA_NorthOf4010_Comm_Dead AgeSelex
# 2   2_CA_NorthOf4010_Comm_Live AgeSelex
# 3   3_CA_NorthOf4010_Rec_PC AgeSelex
# 4   4_CA_NorthOf4010_Rec_PR AgeSelex
# 5   5_OR_SouthernOR_Comm_Dead AgeSelex
# 6   6_OR_SouthernOR_Comm_Live AgeSelex
# 7   7_OR_SouthernOR_Rec_PC AgeSelex
# 8   8_OR_SouthernOR_Rec_PR AgeSelex
# 9   9_OR_NorthernOR_Comm AgeSelex
# 10   10_OR_NorthernOR_Rec_PC AgeSelex
# 11   11_OR_NorthernOR_Rec_PR AgeSelex
# 12   12_OR_SouthernOR_Rec_PC_ORBS AgeSelex
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
# no timevary parameters
#
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
      4      1      0.68
      4      2      0.33
      4      3      0.25
      4      4      0.12
      4      5      0.09
      5      5     0.259
      4      6      0.04
      4      7      0.06
      5      7     0.428
      4      8      0.04
      4     10      0.13
      5     10      0.47
      4     11      0.15
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
#  1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 #_CPUE/survey:_7
#  0 0 0 0 #_CPUE/survey:_8
#  0 0 0 0 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  0 0 0 0 #_CPUE/survey:_11
#  1 1 1 1 #_CPUE/survey:_12
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  1 1 1 1 #_lencomp:_7
#  1 1 1 1 #_lencomp:_8
#  0 0 0 0 #_lencomp:_9
#  1 1 1 1 #_lencomp:_10
#  1 1 1 1 #_lencomp:_11
#  0 0 0 0 #_lencomp:_12
#  0 0 0 0 #_agecomp:_1
#  0 0 0 0 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  1 1 1 1 #_agecomp:_5
#  0 0 0 0 #_agecomp:_6
#  1 1 1 1 #_agecomp:_7
#  0 0 0 0 #_agecomp:_8
#  0 0 0 0 #_agecomp:_9
#  1 1 1 1 #_agecomp:_10
#  0 0 0 0 #_agecomp:_11
#  0 0 0 0 #_agecomp:_12
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

