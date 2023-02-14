#V3.30.21.00;_safe;_compile_date:_Feb 10 2023;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.1
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: data_boot_new.ss // control.ss
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
 1926 1926
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
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity;_6=Lorenzen_range
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
4 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Fecundity by growth pattern
 0 0 0 0 0.172382 0.650652 1.81357 3.76773 6.23659 8.91957 11.6852 14.4983 17.3441 20.2029 23.0486 25.8524 28.5862 31.2252 33.7489 36.1418 38.3932 40.4967 42.4499 44.2534 45.9104 47.4263 48.8077 50.0621 51.1978 52.2232 53.1467
1 #_First_Mature_Age
# NOTE: maturity options 4 and 5 cause fecundity_at_length to be ignored, but parameters still needed 
1 #_fecundity_at_length option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.15 0.3 0.15 0.2446 0.8 6 5 0 0 0 0 0.5 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 5 100 54.4 42 10 6 -3 0 0 1979 2006 0.5 0 0 # L_at_Amin_Fem_GP_1
 80 430 201.9 100 10 6 -2 0 0 1979 2006 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.35 0.123 0.1596 0.8 6 -3 0 0 1979 2006 0.5 0 0 # VonBert_K_Fem_GP_1
 0.0005 0.25 0.0685697 0.01 0.8 6 5 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.0005 0.25 0.0278142 0.01 0.8 6 5 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 1.22e-06 3.75e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 2 5 3.18 3.013 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 -3 1000 63.7 70 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -10 1000 -9 -9 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 0.8 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 0.8 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 0.15 0.3 0.15 0.2446 0.8 6 5 0 0 0 0 0.5 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 5 100 52.9 42 10 6 -3 0 0 1979 2006 0.5 0 0 # L_at_Amin_Mal_GP_1
 80 430 138.7 100 10 6 -2 0 0 1979 2006 0.5 0 0 # L_at_Amax_Mal_GP_1
 0.05 0.35 0.253 0.1596 0.8 6 -3 0 0 1979 2006 0.5 0 0 # VonBert_K_Mal_GP_1
 0.0005 0.25 0.0460608 0.01 0.8 6 5 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 0.0005 0.25 0.0677679 0.01 0.8 6 5 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -3 3 4.38e-06 3.75e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 2 5 2.97 3.013 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
# Hermaphroditism
#  Recruitment Distribution 
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 0 99 0 -3 0 0 0 0 0.5 0 0 # RecrDist_month_1
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
             1            15       6.56045           9.3            10             6          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.9           0.9           0.2             6         -5          0          0          0          0          0          0          0 # SR_BH_steep
            -2             2           0.4           0.6           0.8             6         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             6         -4          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            50             6        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1964 # first year of main recr_devs; early devs can preceed this era
2002 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -3 #_recdev_early_phase
 -4 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1966 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1974 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2006 #_last_yr_fullbias_adj_in_MPD
 2007 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
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
#  1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003F 2004F 2005F 2006F 2007F 2008F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.1 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
2.99 # max F (methods 2-4) or harvest fraction (method 1)
4  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# cpue1 0.000256571 0.000293337 0.00124374 0.000604931 0.000489837 0.000821049 0.0085204 0.00522259 0.00922856 0.0166917 0.0169962 0.0166458 0.0220372 0.0237902 0.0385542 0.0319956 0.0452014 0.0479207 0.0429593 0.0450341 0.0459307 0.0641276 0.0771886 0.0674853 0.0386989 0.053885 0.0765811 0.0413776 0.0507009 0.0544669 0.0331749 0.0299363 0.0359403 0.0533473 0.0575845 0.0654504 0.0606212 0.0841842 0.0623059 0.0637913 0.0754054 0.061549 0.0649924 0.0692646 0.0282997 0.017776 0.0135986 0.0218988 0.0230193 0.0178213 0.022699 0.0279666 0.0232951 0.0314682 0.0297373 0.0160291 0.0170192 0.0264315 0.0351858 0.0345644 0.0256761 0.0252171 0.0491715 0.0291619 0.0513287 0.0737189 0.0707449 0.029323 0.0204051 0.0254705 0.0271839 0.0254169 0.0288024 0.058334 0.0395417 0.0315293 0.0376067 0.0238679 0.0225538 0.0203087 0.00765241 0.00762829
# cpue2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0035192 0.00481266 0.00936326 0.0190139 0.0274789 0.0120732 0.0208891 0.0438478 0.0631599 0.23658 0.269641 0.318682 0.391007 0.351262 0.279405 0.338444 0.401968 0.526363 0.503198 0.582802 0.552567 0.567102 0.546721 0.520762 0.792948 0.449774 0.611092 0.578004 0.824119 0.625711 1.00838 0.580627 0.542004 0.463808 0.616655 0.648021 0.806384 0.673195 0.865443 0.776028 0.89463 0.76915 0.171552 0.171011
# cpue3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.75763e-05 5.49478e-05 0.000108263 0.000189346 0.000332422 0.000119457 0.000190187 0.000444218 0.000905719 0 0 0 0 0.00127225 0.00207793 0.00359393 0.00415344 5.46848e-05 0.000830952 0.000717034 0.00417476 0.00911434 0.00390341 0.00356255 0.00370835 0 0.0119948 0.00212536 0.000321079 0.0015508 0.0389824 0.00940774 0.0642273 0.021438 0.00584324 0.0366461 0.0347753 0.0367008 0.0171613 0.0178856 0.0168204 0.0171133 0.00624609 0.0062264
# cpue4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.02917 0.0332948 0.0762298 0.149635 0.222181 0.101196 0.166767 0.39583 0.541006 0.191932 0.0731062 0.0607372 0.00450275 0.00440656 0.017467 0.019929 0.0426054 0.0341237 0.0381134 0.0226893 0.00672629 0.00607188 0.0106878 0.00232603 0.00788441 0.00732148 0.00609873 0.00959848 0.0138067 0.0185541 0.0510163 0.0216052 0 0 0 0 3.77955e-06 0 3.61246e-05 0.00428458 0 0 0.000582548 0.000580712
# Cpue5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00143271 0.00154596 0.00257348 0.00636671 0.0142547 0.00910393 0.0127555 0.0206637 0.0300681 0.00163411 0.000274069 0.0049483 0.00083033 0.000246266 0.000185021 0 0 0.000240849 1.22334e-06 0 0 1.26886e-05 0.00788251 0.000466012 0.00180805 0 0.000231867 5.25866e-05 0.0383733 0.0199086 0 0 0.0300536 0 0 0 0 0 0 0 0 0 0.000675196 0.000673068
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         2         1         0         0         0         1  #  cpue2
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -3.13756             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_cpue2(2)
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
 6 0 0 44 # 1 cpue1
 6 0 0 44 # 2 cpue2
 6 0 0 44 # 3 cpue3
 6 0 0 44 # 4 cpue4
 6 0 0 44 # 5 Cpue5
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
 20 0 0 0 # 1 cpue1
 15 0 0 1 # 2 cpue2
 15 0 0 1 # 3 cpue3
 15 0 0 1 # 4 cpue4
 15 0 0 1 # 5 Cpue5
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   cpue1 LenSelex
             1           500          32.5          32.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_cpue1(1)
             1           500         247.5         247.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P3_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P6_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P7_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P8_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P9_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P10_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P11_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P12_cpue1(1)
            -1            50             0             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P13_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P14_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P15_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P16_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P17_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P18_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P19_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P20_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P21_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P22_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P23_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P24_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P25_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P26_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P27_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P28_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P29_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P30_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P31_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P32_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P33_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P34_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P35_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P36_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P37_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P38_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P39_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P40_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P41_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P42_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P43_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P44_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P45_cpue1(1)
            -1            50            20             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P46_cpue1(1)
# 2   cpue2 LenSelex
             1           500          32.5          32.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_cpue2(2)
             1           500         247.5         247.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_cpue2(2)
           -27            50      -26.9451             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P3_cpue2(2)
           -27            50      -21.8171             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_cpue2(2)
            -1            50      -17.6973             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_cpue2(2)
            -1            50      -14.3325             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P6_cpue2(2)
            -1            50      -11.5543             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P7_cpue2(2)
            -1            50      -9.24508             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P8_cpue2(2)
            -1            50      -7.31939             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P9_cpue2(2)
            -1            50      -5.71317             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P10_cpue2(2)
            -1            50      -4.37719             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P11_cpue2(2)
            -1            50      -3.27279             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P12_cpue2(2)
            -1            50      -2.36906             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P13_cpue2(2)
            -1            50      -1.64089             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P14_cpue2(2)
            -1            50      -1.06761             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P15_cpue2(2)
            -1            50     -0.631981             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P16_cpue2(2)
            -1            50     -0.319517             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P17_cpue2(2)
            -1            50     -0.117889             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P18_cpue2(2)
            -1            50     -0.016535             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P19_cpue2(2)
            -1            50   -0.00633502             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P20_cpue2(2)
            -1            50    -0.0793582             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P21_cpue2(2)
            -1            50     -0.228666             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P22_cpue2(2)
            -1            50     -0.448153             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P23_cpue2(2)
            -1            50     -0.732418             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P24_cpue2(2)
            -1            50      -1.07666             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P25_cpue2(2)
            -1            50       -1.4766             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P26_cpue2(2)
            -1            50      -1.92839             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P27_cpue2(2)
            -1            50      -2.42857             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P28_cpue2(2)
            -1            50      -2.97402             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P29_cpue2(2)
            -1            50      -3.56192             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P30_cpue2(2)
            -1            50      -4.18968             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P31_cpue2(2)
            -1            50      -4.85496             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P32_cpue2(2)
            -1            50      -5.55561             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P33_cpue2(2)
            -1            50      -6.28968             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P34_cpue2(2)
            -1            50      -7.05536             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P35_cpue2(2)
            -1            50      -7.85098             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P36_cpue2(2)
            -1            50      -8.67499             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P37_cpue2(2)
            -1            50        -9.526             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P38_cpue2(2)
            -1            50      -10.4027             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P39_cpue2(2)
            -1            50      -11.3038             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P40_cpue2(2)
            -1            50      -12.2282             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P41_cpue2(2)
            -1            50      -13.1749             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P42_cpue2(2)
            -1            50      -14.1429             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P43_cpue2(2)
            -1            50      -15.1311             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P44_cpue2(2)
            -1            50      -16.1389             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P45_cpue2(2)
            -1            50      -17.1653             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P46_cpue2(2)
# 3   cpue3 LenSelex
             1           500          32.5          32.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_cpue3(3)
             1           500         247.5         247.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_cpue3(3)
            -1            50      -34.5153             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P3_cpue3(3)
            -1            50       -28.346             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_cpue3(3)
            -1            50       -23.356             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_cpue3(3)
            -1            50      -19.2491             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P6_cpue3(3)
            -1            50      -15.8283             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P7_cpue3(3)
            -1            50      -12.9561             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P8_cpue3(3)
            -1            50      -10.5324             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P9_cpue3(3)
            -1            50      -8.48245             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P10_cpue3(3)
            -1            50      -6.74856             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P11_cpue3(3)
            -1            50      -5.28554             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P12_cpue3(3)
            -1            50      -4.05723             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P13_cpue3(3)
            -1            50      -3.03427             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P14_cpue3(3)
            -1            50      -2.19248             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P15_cpue3(3)
            -1            50      -1.51169             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P16_cpue3(3)
            -1            50     -0.974966             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P17_cpue3(3)
            -1            50     -0.567883             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P18_cpue3(3)
            -1            50     -0.278086             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P19_cpue3(3)
            -1            50    -0.0949065             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P20_cpue3(3)
            -1            50   -0.00907001             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P21_cpue3(3)
            -1            50    -0.0124613             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P22_cpue3(3)
            -1            50    -0.0979381             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P23_cpue3(3)
            -1            50     -0.259184             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P24_cpue3(3)
            -1            50     -0.490584             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P25_cpue3(3)
            -1            50     -0.787126             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P26_cpue3(3)
            -1            50      -1.14432             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P27_cpue3(3)
            -1            50      -1.55811             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P28_cpue3(3)
            -1            50      -2.02485             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P29_cpue3(3)
            -1            50      -2.54124             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P30_cpue3(3)
            -1            50      -3.10426             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P31_cpue3(3)
            -1            50      -3.71117             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P32_cpue3(3)
            -1            50      -4.35945             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P33_cpue3(3)
            -1            50      -5.04681             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P34_cpue3(3)
            -1            50      -5.77114             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P35_cpue3(3)
            -1            50       -6.5305             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P36_cpue3(3)
            -1            50      -7.32307             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P37_cpue3(3)
            -1            50      -8.14721             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P38_cpue3(3)
            -1            50      -9.00138             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P39_cpue3(3)
            -1            50      -9.88414             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P40_cpue3(3)
            -1            50      -10.7942             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P41_cpue3(3)
            -1            50      -11.7302             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P42_cpue3(3)
            -1            50      -12.6911             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P43_cpue3(3)
            -1            50      -13.6758             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P44_cpue3(3)
            -1            50      -14.6833             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P45_cpue3(3)
            -1            50      -15.7126             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P46_cpue3(3)
# 4   cpue4 LenSelex
             1           500          32.5          32.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_cpue4(4)
             1           500         247.5         247.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_cpue4(4)
            -1            50      -43.2078             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P3_cpue4(4)
            -1            50      -35.9024             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_cpue4(4)
            -1            50       -29.961             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_cpue4(4)
            -1            50       -25.041             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P6_cpue4(4)
            -1            50      -20.9146             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P7_cpue4(4)
            -1            50      -17.4227             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P8_cpue4(4)
            -1            50      -14.4497             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P9_cpue4(4)
            -1            50      -11.9088             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P10_cpue4(4)
            -1            50      -9.73354             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P11_cpue4(4)
            -1            50      -7.87158             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P12_cpue4(4)
            -1            50       -6.2811             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P13_cpue4(4)
            -1            50      -4.92813             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P14_cpue4(4)
            -1            50       -3.7847             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P15_cpue4(4)
            -1            50      -2.82751             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P16_cpue4(4)
            -1            50      -2.03693             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P17_cpue4(4)
            -1            50      -1.39631             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P18_cpue4(4)
            -1            50     -0.891344             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P19_cpue4(4)
            -1            50     -0.509696             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P20_cpue4(4)
            -1            50     -0.240639             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P21_cpue4(4)
            -1            50     -0.074785             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P22_cpue4(4)
            -1            50   -0.00387349             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P23_cpue4(4)
            -1            50    -0.0206007             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P24_cpue4(4)
            -1            50     -0.118471             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P25_cpue4(4)
            -1            50     -0.291686             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P26_cpue4(4)
            -1            50      -0.53505             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P27_cpue4(4)
            -1            50     -0.843884             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P28_cpue4(4)
            -1            50      -1.21396             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P29_cpue4(4)
            -1            50      -1.64146             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P30_cpue4(4)
            -1            50      -2.12288             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P31_cpue4(4)
            -1            50      -2.65508             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P32_cpue4(4)
            -1            50      -3.23513             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P33_cpue4(4)
            -1            50      -3.86038             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P34_cpue4(4)
            -1            50      -4.52839             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P35_cpue4(4)
            -1            50      -5.23692             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P36_cpue4(4)
            -1            50      -5.98387             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P37_cpue4(4)
            -1            50      -6.76732             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P38_cpue4(4)
            -1            50       -7.5855             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P39_cpue4(4)
            -1            50      -8.43676             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P40_cpue4(4)
            -1            50      -9.31954             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P41_cpue4(4)
            -1            50      -10.2324             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P42_cpue4(4)
            -1            50      -11.1741             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P43_cpue4(4)
            -1            50      -12.1432             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P44_cpue4(4)
            -1            50      -13.1387             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P45_cpue4(4)
            -1            50      -14.1595             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P46_cpue4(4)
# 5   Cpue5 LenSelex
             1           500          32.5          32.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Cpue5(5)
             1           500         247.5         247.5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_Cpue5(5)
            -1            50       -64.199             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Cpue5(5)
            -1            50      -54.2645             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_Cpue5(5)
            -1            50      -46.1763             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P5_Cpue5(5)
            -1            50       -39.417             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P6_Cpue5(5)
            -1            50        -33.69             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P7_Cpue5(5)
            -1            50      -28.7885             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P8_Cpue5(5)
            -1            50      -24.5619             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P9_Cpue5(5)
            -1            50      -20.8976             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P10_Cpue5(5)
            -1            50      -17.7088             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P11_Cpue5(5)
            -1            50      -14.9277             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P12_Cpue5(5)
            -1            50      -12.4997             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P13_Cpue5(5)
            -1            50      -10.3807             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P14_Cpue5(5)
            -1            50      -8.53434             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P15_Cpue5(5)
            -1            50      -6.93022             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P16_Cpue5(5)
            -1            50      -5.54285             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P17_Cpue5(5)
            -1            50      -4.35055             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P18_Cpue5(5)
            -1            50      -3.33474             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P19_Cpue5(5)
            -1            50      -2.47934             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P20_Cpue5(5)
            -1            50      -1.77042             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P21_Cpue5(5)
            -1            50      -1.19576             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P22_Cpue5(5)
            -1            50     -0.744609             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P23_Cpue5(5)
            -1            50     -0.407466             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P24_Cpue5(5)
            -1            50     -0.175883             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P25_Cpue5(5)
            -1            50    -0.0423179             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P26_Cpue5(5)
            -1            50  -9.00004e-06             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P27_Cpue5(5)
            -1            50    -0.0428699             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P28_Cpue5(5)
            -1            50     -0.165405             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P29_Cpue5(5)
            -1            50     -0.362634             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P30_Cpue5(5)
            -1            50     -0.630028             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P31_Cpue5(5)
            -1            50     -0.963458             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P32_Cpue5(5)
            -1            50      -1.35915             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P33_Cpue5(5)
            -1            50      -1.81365             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P34_Cpue5(5)
            -1            50      -2.32377             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P35_Cpue5(5)
            -1            50      -2.88658             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P36_Cpue5(5)
            -1            50      -3.49939             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P37_Cpue5(5)
            -1            50      -4.15969             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P38_Cpue5(5)
            -1            50      -4.86517             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P39_Cpue5(5)
            -1            50      -5.61367             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P40_Cpue5(5)
            -1            50      -6.40319             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P41_Cpue5(5)
            -1            50      -7.23187             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P42_Cpue5(5)
            -1            50      -8.09797             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P43_Cpue5(5)
            -1            50      -8.99986             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P44_Cpue5(5)
            -1            50      -9.93602             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P45_Cpue5(5)
            -1            50       -10.905             5            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P46_Cpue5(5)
# 1   cpue1 AgeSelex
             0            50             1           100            99             0         -4          0          0          0          0        0.5          0          0  #  Age_DblN_peak_cpue1(1)
           -10            10      -4.25268           100            99             6          1          0          0          0          0        0.5          0          0  #  Age_DblN_top_logit_cpue1(1)
            -1            10             8           100            99             0         -4          0          0          0          0        0.5          0          0  #  Age_DblN_ascend_se_cpue1(1)
            -1            10       2.34493           100            99             6          1          0          0          0          0        0.5          0          0  #  Age_DblN_descend_se_cpue1(1)
            -5            10             9           100            99             0         -4          0          0          0          0        0.5          0          0  #  Age_DblN_start_logit_cpue1(1)
            -5            10      -1.77664           100            99             6          1          0          0          0          0        0.5          0          0  #  Age_DblN_end_logit_cpue1(1)
# 2   cpue2 AgeSelex
# 3   cpue3 AgeSelex
# 4   cpue4 AgeSelex
# 5   Cpue5 AgeSelex
#_No_Dirichlet parameters
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
1 # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Note -  tag parameters cannot be time-varying
#_Note -  phase=-1000 sets parm value to previous parm; phase=-100X sets to parm(X) value
 -10 10 -2.571  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_init_1
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_2
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_3
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_4
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_5
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_6
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_7
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_8
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_9
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_10
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_11
 -10 10 -2.571  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_12
 -10 10 -1.05  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_init_13
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_14
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_15
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_16
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_17
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_18
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_19
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_20
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_21
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_22
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_23
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_24
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_25
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_26
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_27
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_28
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_29
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_30
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_31
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_32
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_33
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_34
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_35
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_36
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_37
 -10 10 -1.05  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_init_38
 -10 10 -9  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_chronic_1
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_2
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_3
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_4
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_5
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_6
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_7
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_8
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_9
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_10
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_11
 -10 10 -9  -9 99 6 -1000 0 0 0 0 0 0 0 # TG_loss_chronic_12
 -10 10 -2.132  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_chronic_13
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_14
 -10 10 0.905  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_chronic_15
 -10 10 0.905  -9 99 6 -1015 0 0 0 0 0 0 0 # TG_loss_chronic_16
 -10 10 -2.512  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_chronic_17
 -10 10 -2.512  -9 99 6 -1017 0 0 0 0 0 0 0 # TG_loss_chronic_18
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_19
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_20
 -10 10 0.905  -9 99 6 -1015 0 0 0 0 0 0 0 # TG_loss_chronic_21
 -10 10 0.905  -9 99 6 -1015 0 0 0 0 0 0 0 # TG_loss_chronic_22
 -10 10 -2.512  -9 99 6 -1017 0 0 0 0 0 0 0 # TG_loss_chronic_23
 -10 10 -2.512  -9 99 6 -1017 0 0 0 0 0 0 0 # TG_loss_chronic_24
 -10 10 -9  -9 99 6 -4 0 0 0 0 0 0 0 # TG_loss_chronic_25
 -10 10 -9  -9 99 6 -1025 0 0 0 0 0 0 0 # TG_loss_chronic_26
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_27
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_28
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_29
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_30
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_31
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_32
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_33
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_34
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_35
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_36
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_37
 -10 10 -2.132  -9 99 6 -1013 0 0 0 0 0 0 0 # TG_loss_chronic_38
 1 100 1.001  2 99 6 -4 0 0 0 0 0 0 0 # TG_overdispersion_1
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_2
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_3
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_4
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_5
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_6
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_7
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_8
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_9
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_10
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_11
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_12
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_13
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_14
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_15
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_16
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_17
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_18
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_19
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_20
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_21
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_22
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_23
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_24
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_25
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_26
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_27
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_28
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_29
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_30
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_31
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_32
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_33
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_34
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_35
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_36
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_37
 1 100 1.001  2 99 6 -1000 0 0 0 0 0 0 0 # TG_overdispersion_38
 -10 50 0.405  3 99 6 -4 0 0 0 0 0 0 0 # TG_report_fleet:_1
 -10 50 0.405  3 99 6 -1000 0 0 0 0 0 0 0 # TG_report_fleet:_2
 -10 50 0.405  3 99 6 -1000 0 0 0 0 0 0 0 # TG_report_fleet:_3
 -10 50 0.405  3 99 6 -1000 0 0 0 0 0 0 0 # TG_report_fleet:_4
 -10 50 0.405  3 99 6 -1000 0 0 0 0 0 0 0 # TG_report_fleet:_5
 -10 10 0  3 99 6 -4 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_1
 -10 10 0  3 99 6 -1000 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_2
 -10 10 0  3 99 6 -1000 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_3
 -10 10 0  3 99 6 -1000 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_4
 -10 10 0  3 99 6 -1000 0 0 0 0 0 0 0 # TG_rpt_decay_fleet:_5
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
 -9999   1    0  # terminator
#
6 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 38 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 15 1 1 0.001 1
 15 2 1 0.001 1
 15 3 1 0.001 1
 15 4 1 0.001 1
 15 5 1 0.001 1
 15 6 1 0.001 1
 15 7 1 0.001 1
 15 8 1 0.001 1
 15 9 1 0.001 1
 15 10 1 0.001 1
 15 11 1 0.001 1
 15 12 1 0.001 1
 15 13 1 0.001 1
 15 14 1 0.001 1
 15 15 1 0.001 1
 15 16 1 0.001 1
 15 17 1 0.001 1
 15 18 1 0.001 1
 15 19 1 0.001 1
 15 20 1 0.001 1
 15 21 1 0.001 1
 15 22 1 0.001 1
 15 23 1 0.001 1
 15 24 1 0.001 1
 15 25 1 0.001 1
 15 26 1 0.001 1
 15 27 1 0.001 1
 15 28 1 0.001 1
 15 29 1 0.001 1
 15 30 1 0.001 1
 15 31 1 0.001 1
 15 32 1 0.001 1
 15 33 1 0.001 1
 15 34 1 0.001 1
 15 35 1 0.001 1
 15 36 1 0.001 1
 15 37 1 0.001 1
 15 38 1 0.001 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 0 0 #_CPUE/survey:_1
#  1 1 1 1 1 1 #_CPUE/survey:_2
#  0 0 0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 0 0 #_CPUE/survey:_4
#  0 0 0 0 0 0 #_CPUE/survey:_5
#  0 0 0 0 0 0 #_lencomp:_1
#  1 1 1 1 1 1 #_lencomp:_2
#  0 0 0 0 0 0 #_lencomp:_3
#  1 1 1 1 1 1 #_lencomp:_4
#  0 0 0 0 0 0 #_lencomp:_5
#  0 0 0 0 0 0 #_agecomp:_1
#  1 1 1 1 1 1 #_agecomp:_2
#  0 0 0 0 0 0 #_agecomp:_3
#  0 0 0 0 0 0 #_agecomp:_4
#  0 0 0 0 0 0 #_agecomp:_5
#  1 1 1 1 1 1 #_init_equ_catch1
#  1 1 1 1 1 1 #_init_equ_catch2
#  1 1 1 1 1 1 #_init_equ_catch3
#  1 1 1 1 1 1 #_init_equ_catch4
#  1 1 1 1 1 1 #_init_equ_catch5
#  1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 #_parameter-dev-vectors
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_1
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_2
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_3
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_4
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_5
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_6
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_7
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_8
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_9
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_10
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_11
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_12
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_13
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_14
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_15
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_16
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_17
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_18
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_19
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_20
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_21
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_22
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_23
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_24
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_25
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_26
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_27
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_28
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_29
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_30
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_31
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_32
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_33
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_34
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_35
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_36
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_37
#  0.001 0.001 0.001 0.001 0.001 0.001 #_TG-comp_group:_38
#  1 1 1 1 1 1 #_TG-negbin_group:_1
#  1 1 1 1 1 1 #_TG-negbin_group:_2
#  1 1 1 1 1 1 #_TG-negbin_group:_3
#  1 1 1 1 1 1 #_TG-negbin_group:_4
#  1 1 1 1 1 1 #_TG-negbin_group:_5
#  1 1 1 1 1 1 #_TG-negbin_group:_6
#  1 1 1 1 1 1 #_TG-negbin_group:_7
#  1 1 1 1 1 1 #_TG-negbin_group:_8
#  1 1 1 1 1 1 #_TG-negbin_group:_9
#  1 1 1 1 1 1 #_TG-negbin_group:_10
#  1 1 1 1 1 1 #_TG-negbin_group:_11
#  1 1 1 1 1 1 #_TG-negbin_group:_12
#  1 1 1 1 1 1 #_TG-negbin_group:_13
#  1 1 1 1 1 1 #_TG-negbin_group:_14
#  1 1 1 1 1 1 #_TG-negbin_group:_15
#  1 1 1 1 1 1 #_TG-negbin_group:_16
#  1 1 1 1 1 1 #_TG-negbin_group:_17
#  1 1 1 1 1 1 #_TG-negbin_group:_18
#  1 1 1 1 1 1 #_TG-negbin_group:_19
#  1 1 1 1 1 1 #_TG-negbin_group:_20
#  1 1 1 1 1 1 #_TG-negbin_group:_21
#  1 1 1 1 1 1 #_TG-negbin_group:_22
#  1 1 1 1 1 1 #_TG-negbin_group:_23
#  1 1 1 1 1 1 #_TG-negbin_group:_24
#  1 1 1 1 1 1 #_TG-negbin_group:_25
#  1 1 1 1 1 1 #_TG-negbin_group:_26
#  1 1 1 1 1 1 #_TG-negbin_group:_27
#  1 1 1 1 1 1 #_TG-negbin_group:_28
#  1 1 1 1 1 1 #_TG-negbin_group:_29
#  1 1 1 1 1 1 #_TG-negbin_group:_30
#  1 1 1 1 1 1 #_TG-negbin_group:_31
#  1 1 1 1 1 1 #_TG-negbin_group:_32
#  1 1 1 1 1 1 #_TG-negbin_group:_33
#  1 1 1 1 1 1 #_TG-negbin_group:_34
#  1 1 1 1 1 1 #_TG-negbin_group:_35
#  1 1 1 1 1 1 #_TG-negbin_group:_36
#  1 1 1 1 1 1 #_TG-negbin_group:_37
#  1 1 1 1 1 1 #_TG-negbin_group:_38
#  1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

