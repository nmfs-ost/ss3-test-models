#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: Canary_data.SS // Canary_control.SS
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
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
2 #_N_breakpoints
 6 14 # age(real) at M breakpoints
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Length_Maturity by growth pattern
 6.8e-06 1.39e-05 2.85e-05 5.83e-05 0.000119295 0.000244164 0.000499664 0.00102224 0.00209011 0.00426839 0.00869559 0.0176272 0.0353807 0.0696495 0.132205 0.235559 0.381109 0.545888 0.692066 0.796225 0.859413 0.894075 0.912046 0.92109 0.925574 0.92778 0.928862 0.929391 0.92965 0.929776
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.04 0.08 0.0521 -2.9551 0.5323 3 -50 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 0 0.9 0.45 0.4 50 0 3 0 0 0 0 0.5 0 0 # NatM_p_2_Fem_GP_1
 2 15 3.8 4 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 50 70 60 60 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.02 0.21 0.14 0.14 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.02 0.21 0.14 0.15 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 -3 3 -1.3 -1.3 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 0 1 1.18e-05 1.55e-05 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 2 4 3.094 3.03 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 40 41 40.5 40.5 50 6 -50 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.25 -0.25 50 6 -50 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 3 0.2619 1 50 6 -50 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -1 1 0.0217 0 50 6 -50 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # NatM_p_1_Mal_GP_1
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # NatM_p_2_Mal_GP_1
 -3 3 0 0 50 6 -50 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -3 3 -0.12 0 50 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -3 3 0.24 0 50 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -3 3 0.04 0 50 0 2 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -3 3 -1.3 0 50 0 2 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
 0 1 1.064e-05 1.55e-05 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_1_Mal
 2 4 3.123 3.03 50 6 -50 0 0 0 0 0.5 0 0 # Wtlen_2_Mal
 0 999 1 1 50 6 -50 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 -7 7 0 1 50 0 -1 0 0 0 0 0 0 0 # RecrDist_Area_1
 -7 7 0 1 50 0 1 0 1 1933 2014 -5 0 0 # RecrDist_Area_2
 -7 7 0 1 50 0 1 0 1 1933 2014 -5 0 0 # RecrDist_Area_3
 0 999 1 1 50 6 -50 0 0 0 0 0.5 0 0 # RecrDist_timing_1
 1 1 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
 0.000001 0.999999 0.5 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
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
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             7            11           8.5           8.5            50             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.21          0.99         0.773           0.4            50             6         -6          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.4            50             6        -50          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            50             6        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            50             6        -50          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1960 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1933 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1965.76 #_last_early_yr_nobias_adj_in_MPD
 1978 #_first_yr_fullbias_adj_in_MPD
 2012 #_last_yr_fullbias_adj_in_MPD
 2014 #_first_recent_yr_nobias_adj_in_MPD
 0.8025 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0
#
#Fishing Mortality info 
0.2 # F ballpark
-1999 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2016 2035
# F rates by fleet
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00442155 0.007029 0.00724988 0.00470045 0.00494396 0.00420329 0.00386956 0.00469936 0.00476923 0.00537343 0.00734944 0.00639778 0.00631521 0.00696437 0.007404 0.00892241 0.00600145 0.00605736 0.0056557 0.00636498 0.00410827 0.0049562 0.00509783 0.00652282 0.00532809 0.00447821 0.00152035 0.00468486 0.0190986 0.0436499 0.0401677 0.0164737 0.0175003 0.0145192 0.014001 0.0149165 0.0101071 0.0100431 0.00712056 0.00753308 0.007486 0.00860548 0.0111343 0.0082072 0.00652521 0.00519686 0.00529774 0.00697545 0.00467814 0.00622127 0.00460996 0.00619151 0.00584471 0.0148356 0.0163546 0.0249179 0.0312026 0.0245514 0.0312088 0.0345146 0.0382155 0.0376738 0.0543208 0.0267662 0.0381121 0.0477854 0.0719845 0.0471558 0.0374663 0.0313125 0.0165418 0.020852 0.022511 0.0181877 0.0326715 0.014807 0.0229012 0.00920869 0.012271 0.0125892 0.0208341 0.0168911 0.0153784 0.0100629 0.00185383 0.00132243 0.00194919 0.000775639 0.000330655 0.000949183 0.000663699 0.0011315 0.000414352 0.000228329 4.77534e-05 3.37516e-05 5.16695e-05 0.000136826 0.000175251 0.00588729 0.00588729
# 2_OR_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.44423e-05 3.33465e-05 1.36115e-06 2.65437e-05 9.66509e-05 0.000188577 0 0.000269038 0.00618347 0.00954495 0.0180001 0.0633824 0.114131 0.183923 0.121297 0.0784983 0.0568517 0.0495435 0.0520896 0.048223 0.050234 0.0530214 0.0678689 0.0693137 0.104081 0.111383 0.0782828 0.0866656 0.104648 0.0969136 0.115063 0.0676953 0.103232 0.0856236 0.0967848 0.01413 0.0885178 0.0279136 0.059803 0.079488 0.0755666 0.0945851 0.059951 0.0426745 0.0260039 0.0638832 0.192752 0.149753 0.347367 0.270186 0.566495 0.669025 0.326965 0.28327 0.272104 0.401048 0.388456 0.522247 0.375083 0.688762 0.699908 0.9 0.53962 0.423527 0.519941 0.420357 0.510623 0.285875 0.0146742 0.0096538 0.00802526 0.00266036 0.00158897 0.0029239 0.00186213 0.0011787 0.00108928 0.000920856 0.000416347 0.000457612 0.000747745 0.000852183 0.0010391 0.0464501 0.0464501
# 3_WA_TWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.718e-06 0 2.0386e-05 0.000157657 0.000203206 0.000181478 0.000267824 0.000280774 0.000621451 0.000232592 0.00452098 0.0146382 0.0061177 0.0642414 0.0331991 0.017534 0.0285742 0.0350137 0.033981 0.0286921 0.0275503 0.0120192 0.0172353 0.0162957 0.0155946 0.0129213 0.0163661 0.0183311 0.0166195 0.0197631 0.0276153 0.0223607 0.016561 0.03693 0.0509993 0.0265471 0.0469676 0.0466323 0.0433661 0.0499437 0.0140965 0.0317427 0.0495499 0.0695328 0.0540561 0.0458504 0.133667 0.0701072 0.0760572 0.0538662 0.0457119 0.0684579 0.0652578 0.111636 0.0995741 0.115136 0.113935 0.144072 0.135815 0.12363 0.107317 0.0382296 0.0193996 0.0194967 0.0226738 0.0241532 0.0237744 0.0161655 0.00168176 0.00134142 0.0026113 0.00120062 0.000918734 0.00203591 0.00133258 0.000895525 0.000838273 0.000666875 0.000681472 0.00035334 0.000502778 0.000432372 0.000156756 0.0281203 0.0281203
# 4_CA_NTWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000195432 0.000321348 0.000367075 0.000190679 0.000210691 0.00020122 0.000182471 0.000202014 0.000259637 0.000355708 0.000422621 0.000450277 0.000394845 0.000381908 0.000493835 0.000487278 0.00059563 0.000284056 0.000367402 0.0005368 0.000556097 0.00041132 0.000408195 0.000382599 0.000264792 0.000351708 0.00023224 0.000303342 0.00126633 0.0031275 0.00334518 0.000723445 0.00136296 0.000528562 0.000406227 0.000348465 0.000253958 0.000144886 0.00029658 7.10053e-05 0.000111052 0.000137014 0.000172353 0.000122229 0.000202942 8.566e-05 0.000110037 0.000149264 0.000103599 0.000131422 9.74327e-05 0.000141332 0.00010132 0.000479873 0.000304048 0.000539712 0.00105125 0.000509004 0.0013151 0.000961031 0.00135714 0.00164165 0.00409286 0.00369324 0.00278926 0.00510651 0.00137292 0.00218884 0.00200342 0.00375295 0.00183836 0.00156214 0.00173641 0.00742001 0.00723702 0.00565256 0.00448 0.00382164 0.00333128 0.00409172 0.00454099 0.00374299 0.00292685 0.0013821 0.000761573 0.000603553 2.99726e-05 3.17077e-05 0.000119767 5.24674e-05 9.88232e-05 0.000137647 5.66039e-05 6.69258e-05 0.000116798 0.000282815 0.000117006 0.000170671 0.000185975 0.0115467 0.0115467
# 5_OR_NTWL 0.00013127 0.000131287 0.000131303 3.37937e-05 8.16512e-06 8.39189e-06 4.76294e-06 7.93815e-06 1.11133e-05 1.45153e-05 1.76905e-05 2.08657e-05 2.42678e-05 2.74432e-05 3.06187e-05 3.37944e-05 3.7197e-05 4.03731e-05 4.35494e-05 4.69527e-05 5.01295e-05 5.33066e-05 5.67108e-05 5.98884e-05 6.30664e-05 6.62447e-05 6.96502e-05 7.28293e-05 7.60086e-05 7.94153e-05 8.25954e-05 8.5776e-05 8.9184e-05 9.23657e-05 9.55479e-05 9.80498e-05 0.000163653 0.000280354 0.000255669 0.000205304 6.54163e-05 0.000107667 0.000116079 0.000104272 0.000249221 0.000296993 0.000293215 0.000167101 0.000369961 0.000496197 0.000691767 0.00172353 0.000453719 0.000300856 0.000393823 0.000207856 0.00035053 0.00023775 0.00022392 0.000174567 0.000167831 8.8486e-05 0.000104425 0.000131297 8.48772e-05 0.000189198 3.89261e-05 8.10642e-05 5.47766e-05 0.000156075 0.000145415 0.000133586 0.000300469 0.000622629 0.000651731 0.00118539 0.00119777 0.00175454 0.00128182 0.001457 0.00241383 0.00258284 0.00291836 0.00179289 0.00207603 0.00223188 0.00535495 0.00989431 0.00790217 0.00810934 0.0144554 0.0218763 0.0186012 0.0208472 0.0219135 0.0216359 0.0380361 0.00320389 0.0121142 0.0120294 0.0408419 0.0491856 0.0495328 0.054733 0.0831091 0.130186 0.134519 0.0941215 0.0266678 0.00953829 0.000384942 0.000172043 0.000561499 0.000153426 0.00024306 0.000329346 0.000124288 0.000151868 0.000219569 0.000562656 0.000236267 0.00030982 0.000317521 0.0217619 0.0217619
# 6_WA_NTWL 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000293572 0.000255932 0.000274777 0.000320903 0.000341904 0.000461947 0.000456061 0.000152915 3.81636e-05 0.000133652 3.5603e-05 2.98268e-05 1.44841e-05 0.000146772 0.000119633 0.000166285 0.000278185 0.000166516 9.10001e-05 0.000188292 0.0117716 0.0117716
# 7_CA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00010134 0.000203012 0.000233441 0.000312091 0.000391262 0.000470263 0.000549277 0.000627722 0.00070726 0.000839217 0.000825532 0.000722661 0.00103996 0.00096165 0.000511097 0.000487811 0.000400528 0.00053823 0.000944183 0.000765662 0.00153586 0.00199565 0.00243609 0.00288687 0.00252799 0.00216341 0.00272379 0.00329903 0.00368558 0.00345597 0.00588189 0.00475576 0.00370821 0.00260295 0.00317782 0.00338481 0.00310051 0.00472939 0.00513648 0.00541535 0.00577652 0.00633067 0.00798801 0.00700233 0.00931528 0.0109912 0.0117288 0.0115774 0.0129605 0.0126058 0.0123249 0.0140013 0.0127908 0.0115831 0.019607 0.00801798 0.00779509 0.011697 0.0174267 0.0141842 0.0125528 0.00784706 0.0068221 0.00689957 0.00691337 0.00585625 0.00390155 0.00765446 0.00522722 0.00895051 0.00243215 0.00522003 0.00569024 0.00260166 0.000535322 0.00157793 0.00087389 0.000199234 0.000582143 0.000466268 0.000134902 0.00159838 0.00132215 0.00174305 0.000314266 0.000361427 0.000334579 0.0538875 0.0538875
# 8_OR_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00282707 0.00651097 0.00542863 0.000896775 0.00441894 0.0138526 0.00315644 0.00746112 0.013858 0.00701388 0.010285 0.0105556 0.0134487 0.0205355 0.0256571 0.0267541 0.0129324 0.0265761 0.0289817 0.0225179 0.00959952 0.00493383 0.003017 0.00258192 0.000761771 0.00120053 0.000625357 0.000465322 0.00035944 0.000413082 0.000463269 0.000437693 0.000481082 0.000432077 0.00035855 0.0287279 0.0287279
# 9_WA_REC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.32243e-05 0 0 0 0 0 0 0 0.000298998 0.000135255 0.000352904 0.000517321 0.000425254 0.00035071 0.000229494 0.000268155 0.000466775 0.000746993 0.000364679 0.000613808 0.00105864 0.000913179 0.00104276 0.000987966 0.00110744 0.00220833 0.00213784 0.00121104 0.000989664 0.000915638 0.000930381 0.00145006 0.000839991 0.000577617 0.000493184 0.000235887 0.000215512 9.0672e-05 0.000124562 6.00683e-05 6.1181e-05 5.49405e-05 6.42601e-05 7.24779e-05 0.000104428 8.05501e-05 9.53124e-05 0.000126941 0.00634291 0.00634291
# 10_CA_AHSOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.17507e-05 2.09815e-05 0 1.09806e-05 5.76728e-07 1.05318e-05 7.61492e-05 1.51979e-06 1.56464e-06 9.54479e-07 0 6.52374e-07 0 4.96055e-06 8.65237e-06 2.01308e-06 6.79278e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.42478e-07 0 6.32482e-07 0 0 0 9.21777e-07 2.0551e-05 2.0551e-05
# 11_OR_ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000264384 5.46959e-05 0.000427928 0.000411219 0.000332316 6.60728e-05 1.01479e-05 0.000123757 8.8149e-05 0.000393833 7.40416e-05 0.000244453 0.000407885 0.000205272 0.000282811 0.000259743 1.58064e-05 3.77575e-05 4.58512e-05 5.38489e-05 8.98938e-06 0.000216732 0.000126484 1.20393e-05 0.000123062 0.000394978 0.00106091 7.42384e-05 0.000809098 0.000125184 0.000107355 0.000208131 0.000139718 1.5003e-05 1.05741e-05 8.30144e-06 1.79124e-05 2.68304e-05 3.13377e-05 0.00125555 0.00125555
# 12_WA_ASHOP 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.68224e-05 1.9854e-05 5.55453e-05 1.05785e-05 0.000874341 0.000851926 6.89941e-05 9.37882e-05 0.000136412 0.000225709 8.58685e-05 3.96325e-05 7.59511e-05 6.07231e-05 8.74e-05 2.7781e-05 0.000157642 1.02751e-05 3.65325e-05 0.000110218 0.000195615 0.000278788 9.39639e-05 0.000118086 0.00011849 2.69907e-05 3.06864e-05 3.8775e-05 2.92216e-05 3.27365e-05 0.000149583 9.90288e-05 5.00069e-05 4.34916e-05 1.35167e-05 2.00171e-05 1.25217e-05 0.00184524 0.00184524
# 13_CA_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00305 0.00752156 0.00224222 0.000149665 0 0 7.62098e-05 0.002855 0.00811246 0.00222071 0.00217308 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 14_OR_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000212721 0.0399889 0.000320723 0 0 0.00126889 0.0356973 0.00506138 0.00385397 0.0024014 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 15_WA_FOR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.119641 0.061248 0.0331561 0.00530106 0.0086801 0.0162413 0.0337483 0.0521078 0.0331123 0.0129099 0.0106404 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 16_CA_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.95149e-06 4.5145e-06 3.80403e-05 7.28957e-06 1.38303e-05 3.43042e-06 4.33068e-06 9.21154e-07 6.09621e-07 9.08212e-07 4.20734e-06 4.77452e-06 0.000151011 0.000151011
# 17_OR_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.79319e-05 2.90702e-05 1.54629e-05 7.87355e-05 1.16551e-05 5.52804e-05 2.33469e-06 9.21826e-06 9.786e-06 1.45332e-05 5.09526e-06 0.000108152 0.00194084 0.00194084
# 18_WA_NWFSC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.70045e-05 3.8186e-05 4.36828e-06 0.000224357 1.8304e-05 1.14318e-05 5.11879e-06 4.97813e-05 3.18506e-05 5.53403e-05 4.85045e-06 4.08905e-05 0.00241591 0.00241591
# 19_CA_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3.10933e-05 0 0 3.01274e-05 0 0 0.000161732 0 0 4.17234e-05 0 0 3.55308e-05 0 0 4.90422e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 20_OR_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.89269e-05 0 0 0.000168015 0 0 0.000349635 0 0 0.000461058 0 0 0.000181706 0 0 5.29933e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 21_WA_Tri_early 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000192411 0 0 1.89281e-05 0 0 0.000448251 0 0 0.000650274 0 0 0.000309088 0 0 4.26388e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# 22_CA_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.30028e-05 0 0 7.23836e-06 0 0 2.04601e-06 0 0 5.9824e-06 0 0 0 0 0 0 0 0 0 0 0 0
# 23_OR_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000219892 0 0 3.68922e-05 0 0 0.00010354 0 0 4.18513e-05 0 0 0 0 0 0 0 0 0 0 0 0
# 24_WA_Tri_late 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.34031e-06 0 0 6.421e-06 0 0 2.48403e-05 0 0 1.57277e-05 0 0 0 0 0 0 0 0 0 0 0 0
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
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
           -15            15      -2.87966             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_16_CA_NWFSC(16)
           -15            15     -0.784279             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_17_OR_NWFSC(17)
           -15            15      -1.38449             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_18_WA_NWFSC(18)
           -15            15      -1.21264             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_19_CA_Tri_early(19)
           -15            15      0.242685             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_20_OR_Tri_early(20)
           -15            15     -0.942094             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_21_WA_Tri_early(21)
           -15            15      -2.96036             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_22_CA_Tri_late(22)
           -15            15      -0.18567             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_23_OR_Tri_late(23)
           -15            15      -2.60696             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_24_WA_Tri_late(24)
           -15            15      -9.93219             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_25_CA_prerec(25)
             0             3           0.4           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_25_CA_prerec(25)
           -15            15      -9.90724             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_26_OR_prerec(26)
             0             3           0.4           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_26_OR_prerec(26)
           -15            15      -10.5656             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_27_WA_prerec(27)
             0             3           0.4           0.1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_27_WA_prerec(27)
           -15            15     -0.808308             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_28_coastwide_NWFSC(28)
           -15            15     0.0620492             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_29_coastwide_Tri_early(29)
           -15            15      -1.68979             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_30_coastwide_Tri_late(30)
           -15            15       -8.2359             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_31_coastwide_prerec(31)
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
          13.1            65            40            50            50             0          4          0          0          0          0          0          2          2  #  SizeSel_P1_1_CA_TWL(1)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_1_CA_TWL(1)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          2          2  #  SizeSel_P3_1_CA_TWL(1)
             0             9         0.001           2.6            50             0          5          0          0          0          0          0          2          2  #  SizeSel_P4_1_CA_TWL(1)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_1_CA_TWL(1)
            -5             5            -1             5            50             0          5          0          0          0          0          0          2          2  #  SizeSel_P6_1_CA_TWL(1)
        13.001            65            40            50            50             0          4          0          0          0          0          0          1          2  #  SizeSel_P1_4_CA_NTWL(4)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_4_CA_NTWL(4)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          1          2  #  SizeSel_P3_4_CA_NTWL(4)
             0             9             9           2.6            50             0          5          0          0          0          0          0          1          2  #  SizeSel_P4_4_CA_NTWL(4)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_4_CA_NTWL(4)
            -5             5             5             5            50             0          5          0          0          0          0          0          1          2  #  SizeSel_P6_4_CA_NTWL(4)
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_7_CA_REC(7)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_7_CA_REC(7)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_7_CA_REC(7)
             0             9           2.5           2.6            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_7_CA_REC(7)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_7_CA_REC(7)
            -5             5            -1             5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_7_CA_REC(7)
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_10_CA_AHSOP(10)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_10_CA_AHSOP(10)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_10_CA_AHSOP(10)
             0             9         0.001           2.6            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_10_CA_AHSOP(10)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_10_CA_AHSOP(10)
            -5             5             5             5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_10_CA_AHSOP(10)
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_16_CA_NWFSC(16)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_16_CA_NWFSC(16)
             0             9          8.99           4.2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_16_CA_NWFSC(16)
             0             9             9           2.6            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_16_CA_NWFSC(16)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_16_CA_NWFSC(16)
            -5             5             5             5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_16_CA_NWFSC(16)
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_19_CA_Tri_early(19)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_19_CA_Tri_early(19)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_19_CA_Tri_early(19)
             0             9          0.01           2.6            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_19_CA_Tri_early(19)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_19_CA_Tri_early(19)
            -5             5            -1             5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_19_CA_Tri_early(19)
        13.001            65            40            50            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_22_CA_Tri_late(22)
            -9             4            -4            -4            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_22_CA_Tri_late(22)
             0             9           4.3           4.2            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_22_CA_Tri_late(22)
             0             9   9.99201e-16           2.6            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_22_CA_Tri_late(22)
            -9             5            -9            -9            50             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_22_CA_Tri_late(22)
            -5             5          4.99             5            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P6_22_CA_Tri_late(22)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        13.001            65            40            50            50             0      4  # SizeSel_P1_1_CA_TWL(1)_BLK2repl_2000
        13.001            65            40            50            50             0      4  # SizeSel_P1_1_CA_TWL(1)_BLK2repl_2011
             0             9           4.3           4.2            50             0      5  # SizeSel_P3_1_CA_TWL(1)_BLK2repl_2000
             0             9           4.3           4.2            50             0      5  # SizeSel_P3_1_CA_TWL(1)_BLK2repl_2011
             0             9         0.001           2.6            50             0      5  # SizeSel_P4_1_CA_TWL(1)_BLK2repl_2000
             0             9         0.001           2.6            50             0      5  # SizeSel_P4_1_CA_TWL(1)_BLK2repl_2011
            -5             5            -1             5            50             0      5  # SizeSel_P6_1_CA_TWL(1)_BLK2repl_2000
            -5             5            -1             5            50             0      5  # SizeSel_P6_1_CA_TWL(1)_BLK2repl_2011
        13.001            65            40            50            50             0      4  # SizeSel_P1_4_CA_NTWL(4)_BLK1repl_2000
             0             9           4.3           4.2            50             0      5  # SizeSel_P3_4_CA_NTWL(4)_BLK1repl_2000
             0             9             9           2.6            50             0      5  # SizeSel_P4_4_CA_NTWL(4)_BLK1repl_2000
            -5             5             5             5            50             0      5  # SizeSel_P6_4_CA_NTWL(4)_BLK1repl_2000
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
#      1    25     1     0     0     2     0     1     1  1933  2014     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      1    26     3     0     0     2     0     2     1  1933  2014     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     5     2     2     2     0     0     0     0     0     0
#      5     3     7     2     2     2     0     0     0     0     0     0
#      5     4     9     2     2     2     0     0     0     0     0     0
#      5     6    11     2     2     2     0     0     0     0     0     0
#      5     7    13     1     2     2     0     0     0     0     0     0
#      5     9    14     1     2     2     0     0     0     0     0     0
#      5    10    15     1     2     2     0     0     0     0     0     0
#      5    12    16     1     2     2     0     0     0     0     0     0
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
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
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
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

