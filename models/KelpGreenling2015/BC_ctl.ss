#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C 2015 Assessent of Kelp Greenling (Berger, Arnold, Rodomsky) run with SSv3.24u
#_data_and_control_files: BC_dat.ss // BC_ctl.ss
#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
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
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1 #_Age(post-settlement)_for_L1;linear growth below this
11 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 0 0 0 0 0 0 0 0 0 0 0 0 0 0.115 0.25 0.7933 0.944 1 1 1 1 1 1 1 1 1 1 1 1 1 1
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.1 0.6 0.36 -1.02 0.437 3 -2 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 -10 30 20 20 10 6 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 60 38.51 38.51 10 6 3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.1 1 0.3 0.3 0.5 6 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.15 0.1 0.1 0.8 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 -0.3 0.3 0 0 0.8 0 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 0 1 6.81e-06 6.81e-06 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
 1 5 3.2114 3.2114 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
 1 60 29.34 29.34 0.8 6 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -1 -1 0.8 6 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 3 1 1 0.8 6 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 0.8 6 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 -0.6 0.6 -0.12516 -1.15 0.438 0 -2 0 0 0 0 0 0 0 # NatM_p_1_Mal_GP_1
 -10 30 0 12 10 6 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -20 60 3.55271e-15 37.33 10 6 3 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0 0 0.5 6 -3 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -0.3 0.3 0 0 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -0.3 0.3 0 0 0.5 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 0 1 9.76e-06 9.76e-06 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal
 1 5 3.1164 3.1164 0.8 6 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal
 0 1 1 1 0.8 6 -3 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 1 1 1 0.8 6 -3 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 1 1 1 0.8 6 -3 0 0 0 0 0 0 0 # RecrDist_timing_1
 1 1 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             5            15             7             7            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.7           0.7          0.09             6         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2          0.65          0.45           0.2             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0           0.2             0         -3          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0         -3          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1980 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1980 #_last_early_yr_nobias_adj_in_MPD
 1984 #_first_yr_fullbias_adj_in_MPD
 2010 #_last_yr_fullbias_adj_in_MPD
 2014 #_first_recent_yr_nobias_adj_in_MPD
 0.81 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2024 2035
# F rates by fleet
# Yr:  1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Commercial 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000245106 0.000238961 9.98593e-06 7.0317e-05 5.08541e-05 0.000272508 0.00060431 0.000121995 0.00216835 0.034744 0.0325427 0.0825538 0.0667931 0.103151 0.208261 0.0851793 0.101368 0.0901988 0.0604983 0.0741647 0.0878489 0.0823073 0.0731181 0.0828576 0.0756503 0.0868048 0.0600322 0.202017 0.202017 0.202017 0.202017 0.202017 0.202017 0.202017 0.202017 0.202017 0.201773
# Ocean 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00274302 0.00370554 0.00412851 0.00897042 0.00761974 0.0192285 0.0138908 0.00962859 0.0144889 0.00997239 0.00727106 0.00576409 0.00347943 0.00659414 0.0070723 0.00451965 0.00677879 0.00615329 0.00419979 0.00729254 0.00884381 0.0111671 0.00811055 0.00796576 0.0116316 0.00764212 0.0127068 0.0116083 0.00861158 0.0107736 0.0116686 0.0138416 0.0142975 0.0095415 0.0100795 0.0119335 0.0163144 0.0251303 0.0201326 0.0211438 0.0280449 0.015906 0.0535262 0.0535262 0.0535262 0.0535262 0.0535262 0.0535262 0.0535262 0.0535262 0.0535262 0.0534615
# Estuary 0.00791869 0.00747545 0.007491 0.00703379 0.00892438 0.00988248 0.0056499 0.00564764 0.00658906 0.00706246 0.00753718 0.00801261 0.00801629 0.00801913 0.00802181 0.00802462 0.00802629 0.00613529 0.00565888 0.00707207 0.00754548 0.00802044 0.00897024 0.00944973 0.00992998 0.0104115 0.0113695 0.0113809 0.0128185 0.0123568 0.013798 0.0176437 0.01961 0.022074 0.0231068 0.0231672 0.0266275 0.0281795 0.0282648 0.0293191 0.0293879 0.0304303 0.0314795 0.030545 0.0305784 0.0316029 0.0321382 0.0331728 0.034719 0.0367839 0.0383676 0.0399665 0.0400605 0.0370914 0.0401461 0.0432664 0.0438833 0.0485877 0.0529127 0.0532032 0.0555382 0.0537534 0.0534504 0.058522 0.0610777 0.111009 0.0349 0.0248651 0.086653 0.0450562 0.0185868 0.0306425 0.126618 0.0714903 0.00866142 0.0382879 0.0535705 0.0688974 0.0630908 0.0321756 0.0158798 0.0296601 0.0450717 0.0107761 0.0228922 0.0167649 0.0436699 0.113858 0.166168 0.00517125 0.0144161 0.0399147 0.0396816 0.0395195 0.0379952 0.0379061 0.037865 0.0371987 0.0355692 0.0343191 0.115489 0.115489 0.115489 0.115489 0.115489 0.115489 0.115489 0.115489 0.115489 0.115349
# Shore 0.00354506 0.00334811 0.00335807 0.00336637 0.00379587 0.00422803 0.00275215 0.0023289 0.00275241 0.00317696 0.00339066 0.00339289 0.00339503 0.00339683 0.0036109 0.00382522 0.00340142 0.00276312 0.0023362 0.00318411 0.00339663 0.00382264 0.00425051 0.00425454 0.00447175 0.00468976 0.0051225 0.00534313 0.00577904 0.0057876 0.00622534 0.00796165 0.00906926 0.00997355 0.0102335 0.0102722 0.0118487 0.0127843 0.0128391 0.0135555 0.0133794 0.0136429 0.0143556 0.0139417 0.0139668 0.0144415 0.0146924 0.0151716 0.0161119 0.0168376 0.0173452 0.0183191 0.0183794 0.0170364 0.0184474 0.0201178 0.0201842 0.0223612 0.024144 0.0248009 0.0256995 0.0251826 0.0248703 0.0273017 0.0285912 0.0254556 0.0470273 0.0248787 0.0343796 0.0117362 0.0226451 0.0309566 0.0371327 0.0195685 0.0211479 0.0234582 0.0328597 0.0424371 0.0638026 0.01482 0.0167585 0.0210381 0.0232269 0.0092738 0.0123604 0.0412322 0.0556121 0.0812504 0.050497 0.0220053 0.013741 0.0272227 0.0264655 0.0263087 0.0258889 0.0258222 0.0257871 0.0252231 0.0245349 0.0238853 0.0803776 0.0803776 0.0803776 0.0803776 0.0803776 0.0803776 0.0803776 0.0803776 0.0803776 0.0802805
# SpecProj 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         6         1         0         1         0         1  #  Logbook
         7         1         0         1         0         1  #  ObsCPFV
         8         1         0         1         0         1  #  ORBS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -6.92438             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Logbook(6)
             0             2           0.5             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_Logbook(6)
           -15            15      -8.41957             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ObsCPFV(7)
             0             2           0.5             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ObsCPFV(7)
           -15            15      -9.10306             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_ORBS(8)
             0             2           0.5             1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_ORBS(8)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
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
#_age_selex_types
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
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
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
            24            45            36            36            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Commercial(1)
           -10             5            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  SizeSel_P2_Commercial(1)
             0             9           3.3           3.3            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_Commercial(1)
            -9             9             2             2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_Commercial(1)
            -9             9            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  SizeSel_P5_Commercial(1)
            -9             9            -8            -8            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_Commercial(1)
            24            45            36            36            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Ocean(2)
           -10             5            -5            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_Ocean(2)
             0             9             4             4            50             0          5          0          0          0          0          0          1          1  #  SizeSel_P3_Ocean(2)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_Ocean(2)
            -9             9            -8            -8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_Ocean(2)
            -9             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_Ocean(2)
            10            45            16            16            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Estuary(3)
           -10             5            -5            -5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Estuary(3)
             0             9             5             5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_Estuary(3)
            -9             9             4             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_Estuary(3)
            -9             9            -8            -8            50             0         -5          0          0          0          0          0          0          0  #  SizeSel_P5_Estuary(3)
            -9             9            -2            -2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_Estuary(3)
             6            20             6             6            50             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_Shore(4)
           -10             9            -9            -9            50             0         -5          0          0          0          0          0          0          0  #  SizeSel_P2_Shore(4)
             0             9             5             5            50             0         -5          0          0          0          0          0          0          0  #  SizeSel_P3_Shore(4)
            -9             9             4             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_Shore(4)
            -9             9             8             8            50             0         -5          0          0          0          0          0          0          0  #  SizeSel_P5_Shore(4)
            -9             9             0             0            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_Shore(4)
             1             1             1             1            50             0         -5          0          0          0          0          0          0          0  #  AgeSel_P1_SpecProj(5)
             1             1             1             1            50             0         -5          0          0          0          0          0          0          0  #  AgeSel_P2_SpecProj(5)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -3             0            -1            -1            99             0      5  # SizeSel_P3_Ocean(2)_BLK1add_2004
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     9     1     1     1     2     0     0     0     0     0     0
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
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
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
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

