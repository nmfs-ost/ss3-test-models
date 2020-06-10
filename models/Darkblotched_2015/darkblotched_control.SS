#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: darkblotched_data.SS // darkblotched_control.SS
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
5 #_Nblock_Patterns
 1 1 9 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 2011 2014
 2011 2014
 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010
 1995 2004
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
2 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 1.33e-06 2.11e-06 3.35e-06 5.32e-06 8.45e-06 1.34e-05 2.13e-05 3.38e-05 5.36e-05 8.51e-05 0.000135006 0.000214259 0.000340019 0.000539553 0.000856075 0.00135802 0.00215359 0.00341357 0.00540653 0.00855255 0.0135031 0.0212547 0.0332984 0.0517869 0.0796513 0.120502 0.17803 0.254617 0.349288 0.456148 0.565069 0.665136 0.74867 0.813 0.859534 0.891691 0.913216 0.927321 0.936433 0.942267 0.94598 0.948335 0.949824 0.950765 0.951359 0.951733 0.951969 0.952118 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212 0.952212
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.01 0.15 0.054 0.08 99 0 -3 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 1 20 14.5 14.6 99 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 60 42.44 42.5 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.3 0.2 0.2 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.5 15 3 3 99 0 5 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.5 15 3 3 99 0 5 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 0 1 1.1486e-05 1.1486e-05 99 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
 2 4 3.12536 3.12536 99 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
 0 60 34.59 55 99 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -0.6429 -0.6429 99 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 150000 101100 101100 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 0 50000 44800 44800 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 0.01 0.15 0.054 0.08 99 0 3 0 0 0 0 0 0 0 # NatM_p_1_Mal_GP_1
 -3 3 0 0 99 0 -3 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 20 60 42.44 42.5 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.05 0.3 0.2 0.2 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -3 3 0 0 99 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.5 15 2.5 2.5 99 0 5 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 0 1 1.2238e-05 1.2238e-05 99 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal
 2 4 3.10647 3.10647 99 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 99 0 -5 0 0 0 0 0 0 0 # RecrDist_timing_1
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
             5            12           8.2             8            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.773         0.773         0.147             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
             0             2          0.75          0.75            99             0         -1          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_regime
            -1             1             0             0            99             0         -1          0          0          0          0          0          0          0 # SR_autocorr
2 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1960 # first year of main recr_devs; early devs can preceed this era
2013 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1870 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 -5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1967.3 #_last_early_yr_nobias_adj_in_MPD
 1979.8 #_first_yr_fullbias_adj_in_MPD
 2012 #_last_yr_fullbias_adj_in_MPD
 2013 #_first_recent_yr_nobias_adj_in_MPD
 0.8166 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  1870E 1871E 1872E 1873E 1874E 1875E 1876E 1877E 1878E 1879E 1880E 1881E 1882E 1883E 1884E 1885E 1886E 1887E 1888E 1889E 1890E 1891E 1892E 1893E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
4  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2026 2035
# F rates by fleet
# Yr:  1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Shoreside 0 0.000225236 0.000357337 0.000369795 0.000237986 0.000250273 0.000213446 0.000196123 0.000236595 0.000240452 0.000274065 0.000370089 0.000317956 0.000315247 0.00033544 0.000366103 0.000451732 0.000285556 0.000278834 0.000265048 0.000304194 0.000206552 0.000235353 0.000291082 0.000412811 0.000569267 0.000728496 0.000838692 0.00320282 0.00696887 0.0120006 0.00715197 0.00594625 0.00343918 0.00288834 0.00321003 0.00372407 0.00393074 0.00335138 0.00394559 0.00466762 0.0062014 0.00727626 0.00618141 0.00524071 0.00635042 0.00593944 0.0064503 0.00690284 0.0049805 0.00910828 0.00811325 0.00776791 0.00295504 0.0030101 0.00454326 0.00561985 0.00533994 0.00331085 0.00598613 0.00726736 0.0123862 0.00723455 0.00950102 0.0168317 0.0138509 0.0192513 0.0269114 0.0269698 0.0322671 0.0450062 0.0330478 0.0657999 0.0474315 0.0377354 0.0507046 0.0367526 0.0211398 0.0386454 0.0282056 0.0246476 0.0248095 0.027686 0.0312513 0.0120217 0.00852411 0.00546896 0.00594038 0.00412051 0.00845597 0.00406099 0.00482716 0.00657079 0.00559968 0.00692503 0.0085711 0.00315503 0.00272951 0.00347392 0.00269581 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109 0.0330109
# ForeignPOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0740518 0.0562302 0.0499853 0.00341207 0.00331441 0.00617947 0.0083265 0.0171931 0.00778928 0.00661333 0.00267337 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# AtSeaHake 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000243863 5.4366e-05 2.43656e-05 8.45856e-05 0.000491364 0.000274156 3.88576e-05 0.000277182 0.000480446 0.000323336 0.000149472 0.000380596 0.000271424 0.000155627 0.000858135 0.00140814 0.000936056 0.000258673 0.000482642 0.00162222 0.000199497 0.000130035 0.000475879 0.000376951 0.000273703 0.000410177 0.000105377 0.000141245 0.000232304 0.000349276 0.000347803 0.000372098 0.000193166 1.06963e-05 0.000245963 0.000363848 7.9612e-05 0.00018483 0.00030862 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914 0.00377914
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         1         1         0  #  AKSHLF
         5         1         0         0         0         0  #  AKSLP
         6         1         0         0         0         0  #  NWSLP
         7         1         0         1         0         0  #  NWCBO
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -10             2       -0.0003             0            99             0          1          0          1       1980       2004         -5          0          0  #  LnQ_base_AKSHLF(4)
             0             1           0.4           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_AKSHLF(4)
            -4             4             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_AKSLP(5)
            -4             4             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_NWSLP(6)
            -4             4             0             0            99             0         -5          0          0          0          0          0          0          0  #  LnQ_base_NWCBO(7)
             0             1           0.4           0.1            99             0          3          0          0          0          0          0          0          0  #  Q_extraSD_NWCBO(7)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2            99            99           0.5             6      -5  # LnQ_base_AKSHLF(4)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # LnQ_base_AKSHLF(4)_dev_autocorr
# info on dev vectors created for Q parms are reported with other devs after tag parameter section 
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
 24 1 0 0 # 1 Shoreside
 15 0 0 1 # 2 ForeignPOP
 24 0 0 0 # 3 AtSeaHake
 24 0 0 0 # 4 AKSHLF
 24 0 0 0 # 5 AKSLP
 24 0 0 0 # 6 NWSLP
 24 0 0 0 # 7 NWCBO
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
 11 0 0 0 # 1 Shoreside
 11 0 0 0 # 2 ForeignPOP
 11 0 0 0 # 3 AtSeaHake
 11 0 0 0 # 4 AKSHLF
 11 0 0 0 # 5 AKSLP
 11 0 0 0 # 6 NWSLP
 11 0 0 0 # 7 NWCBO
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            20            45            36            32            99             0          2          0          0          0          0          0          1          2  #  SizeSel_P1_Shoreside(1)
            -6             4            -2             0            99             0          3          0          0          0          0          0          1          2  #  SizeSel_P2_Shoreside(1)
            -1             9             4             4            99             0          2          0          0          0          0          0          1          2  #  SizeSel_P3_Shoreside(1)
            -1             9           0.6           5.5            99             0          3          0          0          0          0          0          1          2  #  SizeSel_P4_Shoreside(1)
            -5             9            -5            -5            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P5_Shoreside(1)
            -5             9             9             5            99             0          3          0          0          0          0          0          1          2  #  SizeSel_P6_Shoreside(1)
            15            70            27            35            99             0          2          0          0          0          0          0          2          2  #  Retain_P1_Shoreside(1)
           0.1            10             2             1            99             0          2          0          0          0          0          0          2          2  #  Retain_P2_Shoreside(1)
           -10            10            10            10            99             0         -3          0          0          0          0          0          3          2  #  Retain_P3_Shoreside(1)
             0             0             0             0            99             0         -3          0          0          0          0          0          0          0  #  Retain_P4_Shoreside(1)
            20            45            36            32            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P1_AtSeaHake(3)
            -6             4            -5             0            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P2_AtSeaHake(3)
            -1             9             4             4            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P3_AtSeaHake(3)
            -1             9           0.6           5.5            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P4_AtSeaHake(3)
          -999             9          -999            -2            99             0         -2          0          0          0          0          0          0          0  #  SizeSel_P5_AtSeaHake(3)
            -5             9             9             5            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P6_AtSeaHake(3)
            10            45            21            23            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P1_AKSHLF(4)
            -6             4            -6            -1            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P2_AKSHLF(4)
            -1             9             4             4            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_AKSHLF(4)
            -1             9             4             6            99             0          4          0          0          0          0          0          4          2  #  SizeSel_P4_AKSHLF(4)
          -999             9          -999            -4            99             0         -2          0          0          0          0          0          0          0  #  SizeSel_P5_AKSHLF(4)
          -999             9          -999            -1            99             0         -3          0          0          0          0          0          0          0  #  SizeSel_P6_AKSHLF(4)
            10            45            23            28            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P1_AKSLP(5)
            -6             4            -6            -1            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P2_AKSLP(5)
            -1             9             2             4            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P3_AKSLP(5)
            -1             9             2             4            99             0          3          0          0          0          0          0          0          0  #  SizeSel_P4_AKSLP(5)
          -999             9          -999            -4            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_AKSLP(5)
          -999             9          -999            -2            99             0         -3          0          0          0          0          0          0          0  #  SizeSel_P6_AKSLP(5)
            10            45            25            28            99             0          2          0          0          0          0          0          0          0  #  SizeSel_P1_NWSLP(6)
            -6             4            -6             1            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_NWSLP(6)
            -1             9             3             4            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P3_NWSLP(6)
            -1             9           0.1             4            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P4_NWSLP(6)
          -999             9          -999            -4            99             0         -5          0          0          0          0          0          0          0  #  SizeSel_P5_NWSLP(6)
          -999             9          -999             1            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P6_NWSLP(6)
             8            45       24.4731            20            99             0         -2          0          0          0          0          0          0          0  #  SizeSel_P1_NWCBO(7)
            -6             4            -6            -1            99             0         -3          0          0          0          0          0          0          0  #  SizeSel_P2_NWCBO(7)
            -1             9       4.13751             2            99             0         -3          0          0          0          0          0          0          0  #  SizeSel_P3_NWCBO(7)
            -1             9             3             4            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P4_NWCBO(7)
          -999             9          -999            -3            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P5_NWCBO(7)
            -5             9     -0.841911             5            99             0         -3          0          0          0          0          0          0          0  #  SizeSel_P6_NWCBO(7)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_Shoreside(1)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_Shoreside(1)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_ForeignPOP(2)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_ForeignPOP(2)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_AtSeaHake(3)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_AtSeaHake(3)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_AKSHLF(4)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_AKSHLF(4)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_AKSLP(5)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_AKSLP(5)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_NWSLP(6)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_NWSLP(6)
             0             1           0.1           0.1            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P1_NWCBO(7)
             0           100           100           100            99             0         -3          0          0          0          0        0.5          0          0  #  AgeSel_P2_NWCBO(7)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            20            45            36            32            99             0      2  # SizeSel_P1_Shoreside(1)_BLK1repl_2011
            -6             4            -5             0            99             0      3  # SizeSel_P2_Shoreside(1)_BLK1repl_2011
            -1             9             4             4            99             0      2  # SizeSel_P3_Shoreside(1)_BLK1repl_2011
            -1             9            -1           5.5            99             0      3  # SizeSel_P4_Shoreside(1)_BLK1repl_2011
            -5             9             9             5            99             0      3  # SizeSel_P6_Shoreside(1)_BLK1repl_2011
            15            70            27            35            99             0      2  # Retain_P1_Shoreside(1)_BLK2repl_2011
           0.1            10             2             1            99             0      2  # Retain_P2_Shoreside(1)_BLK2repl_2011
             0             1          0.44          0.44            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2002
             0             1           0.4           0.4            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2003
             0             1          0.82          0.82            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2004
             0             1          0.76          0.76            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2005
             0             1          0.52          0.52            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2006
             0             1          0.51          0.51            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2007
             0             1          0.46          0.46            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2008
             0             1          0.45          0.45            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2009
             0             1          0.51          0.51            99             0      3  # Retain_P3_Shoreside(1)_BLK3repl_2010
            -1             9             5             5            99             0      4  # SizeSel_P4_AKSHLF(4)_BLK4repl_1995
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
#      3     1     1     0     0     0     0     1     1  1980  2004     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     3     1     2     2     0     0     0     0     0     0
#      5     2     4     1     2     2     0     0     0     0     0     0
#      5     3     5     1     2     2     0     0     0     0     0     0
#      5     4     6     1     2     2     0     0     0     0     0     0
#      5     6     7     1     2     2     0     0     0     0     0     0
#      5     7     8     2     2     2     0     0     0     0     0     0
#      5     8     9     2     2     2     0     0     0     0     0     0
#      5     9    10     3     2     2     0     0     0     0     0     0
#      5    20    19     4     2     2     0     0     0     0     0     0
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
      4      1  0.133114
      5      1  0.333243
      4      3  0.120528
      5      3  0.167389
      4      4  0.297514
      5      4  0.170828
      4      5  0.572078
      5      5   0.19336
      4      6  0.485021
      5      6  0.157214
      4      7  0.281543
      5      7  0.143452
 -9999   1    0  # terminator
#
2 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 4 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 4 1 1 0.5 1
 5 1 1 0.5 1
 4 3 1 0.5 1
 5 3 1 0.5 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 #_CPUE/survey:_1
#  0 0 #_CPUE/survey:_2
#  0 0 #_CPUE/survey:_3
#  1 1 #_CPUE/survey:_4
#  1 1 #_CPUE/survey:_5
#  1 1 #_CPUE/survey:_6
#  1 1 #_CPUE/survey:_7
#  1 1 #_discard:_1
#  0 0 #_discard:_2
#  0 0 #_discard:_3
#  0 0 #_discard:_4
#  0 0 #_discard:_5
#  0 0 #_discard:_6
#  0 0 #_discard:_7
#  0.5 0.5 #_lencomp:_1
#  0 0 #_lencomp:_2
#  0.5 0.5 #_lencomp:_3
#  1 1 #_lencomp:_4
#  1 1 #_lencomp:_5
#  1 1 #_lencomp:_6
#  1 1 #_lencomp:_7
#  0.5 0.5 #_agecomp:_1
#  0 0 #_agecomp:_2
#  0.5 0.5 #_agecomp:_3
#  1 1 #_agecomp:_4
#  1 1 #_agecomp:_5
#  1 1 #_agecomp:_6
#  1 1 #_agecomp:_7
#  1 1 #_init_equ_catch
#  1 1 #_recruitments
#  1 1 #_parameter-priors
#  1 1 #_parameter-dev-vectors
#  1 1 #_crashPenLambda
#  0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

