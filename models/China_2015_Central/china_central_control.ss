#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C China rockfish control file for central model (40-10 to OR/WA border)
#_data_and_control_files: china_central_data.ss // china_central_control.ss
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
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1899 1899
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0 #_Age(post-settlement)_for_L1;linear growth below this
30 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
2 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.01 0.15 0.07 -2.94 0.53 3 -3 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 -10 45 2 2 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 20 50 34 34 10 0 6 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.1 0.1 0.8 0 6 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.25 0.1 0.1 0.8 0 -6 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.25 0.1 0.1 0.8 0 6 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 0 1 1.17e-05 1.17e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
 2 4 3.177 3 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
 1 100 28.5 28.5 0.8 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -9 9 -1 0 0.8 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 3 0.196 1 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 3 0.0571 0 0.8 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 -1 0.15 0 0.053 0.8 0 -3 0 0 0 0 0 0 0 # NatM_p_1_Mal_GP_1
 -1 45 0 2 10 0 -2 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 -1 50 0 33.13 10 0 -4 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 -1 0.3 0 0.2461 0.8 0 -4 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 -1 0.25 0 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 -1 0.25 0 0.1 0.8 0 -3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 0 1 1.17e-05 1.17e-05 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Mal
 2 4 3.177 3 0.8 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Mal
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 0 0 0 0 0 -4 0 0 0 0 0 0 0 # RecrDist_timing_1
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
             3            12             6             6            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1         0.773         0.773         0.147             2         -3          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.5           0.5           0.8             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0             1             0         -4          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1971 # first year of main recr_devs; early devs can preceed this era
2001 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 -4 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 900 #_last_early_yr_nobias_adj_in_MPD
 1820 #_first_yr_fullbias_adj_in_MPD
 2001 #_last_yr_fullbias_adj_in_MPD
 2015 #_first_recent_yr_nobias_adj_in_MPD
 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.3 # F ballpark
-2001 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2026 2035
# F rates by fleet
# Yr:  1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# 1_CA_NorthOf4010_Comm_Dead 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.38599e-06 5.38607e-06 0 1.61585e-05 4.8477e-05 0.00053339 0.000441995 0.000663324 0.000420847 0.00166334 0.00322027 0.00190936 0.000537506 0.000390981 1.08595e-05 0 0 3.25496e-05 4.33876e-05 4.87975e-05 5.42054e-06 5.96115e-05 7.58523e-05 0 0 0 0 0 4.86934e-05 0 5.40839e-06 0 0 0 0 0 1.08051e-05 4.32148e-05 5.40119e-06 0 0 0 0 5.39793e-06 0 5.40031e-06 5.40196e-06 5.40431e-06 1.08169e-05 5.95479e-05 1.08469e-05 5.43399e-06 0 5.45237e-06 0 0 0 0 0 5.4967e-06 0.000126596 0.00139617 0.000398185 0.00159569 0.000472047 0.00056809 0.00265125 0.00217957 0.00114039 0.000835838 0.000355876 0.000352827 0.000250138 0.000275296 5.29362e-05 0.000129439 8.22673e-05 8.80178e-05 0.000240551 0.000152687 2.93858e-05 2.34988e-05 5.28599e-05 4.70351e-05 2.94184e-05 1.17561e-05 1.17254e-05 1.16916e-05 0.000434399 0.000434399 0.000434399 0.000434399 0.000434399 0.000434399 0.000434399 0.000434399 0.000434399 0.000434399
# 2_CA_NorthOf4010_Comm_Live 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.61746e-06 0.0010049 0.000483308 0.00092413 0.00120887 0.00063407 0.00109533 0.00029409 0.000170624 0.000352574 0.000498767 0.000962204 0.000939612 0.000364384 0.000158617 0.00021144 0.000229296 0.000100023 5.29023e-05 3.51777e-05 3.50761e-05 0.00198573 0.00198573 0.00198573 0.00198573 0.00198573 0.00198573 0.00198573 0.00198573 0.00198573 0.00198573
# 3_CA_NorthOf4010_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83364e-05 1.83466e-05 1.83569e-05 1.83759e-05 1.84202e-05 1.84671e-05 1.84893e-05 0 0 0 0 1.84964e-05 1.84949e-05 1.84927e-05 1.84904e-05 3.69759e-05 3.69701e-05 3.69623e-05 3.69524e-05 3.69421e-05 3.69318e-05 5.53825e-05 5.53691e-05 5.53558e-05 3.68937e-05 1.84416e-05 1.84362e-05 1.84308e-05 1.84256e-05 1.84206e-05 1.84161e-05 0 3.68161e-05 1.84041e-05 3.68004e-05 1.83965e-05 1.83928e-05 3.67791e-05 1.83914e-05 1.84013e-05 0 0 0 5.54123e-05 5.55713e-05 7.43242e-05 7.45121e-05 5.60526e-05 0.000149959 1.88044e-05 3.76903e-05 0.000226494 0.000529555 0.000208455 0.000113969 0.000438601 0.000382643 0.00023022 0.00028879 0.000270782 0.000233582 0.000117516 0.000118392 3.99046e-05 0.000202557 0.000512847 0.000642227 0.000566042 0.000697342 0.000169407 0.000338637 0.000295982 0.0013538 0.000423884 0.00140131 0.000573265 0.000339763 0.000787274 0.000554056 0.000170283 0.000127233 0.000126671 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014 0.00640014
# 4_CA_NorthOf4010_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83207e-05 1.83211e-05 1.83213e-05 1.83215e-05 1.83221e-05 1.83274e-05 1.83364e-05 3.66933e-05 3.67138e-05 3.67519e-05 3.68404e-05 3.69341e-05 3.69786e-05 1.84972e-05 1.85001e-05 1.84991e-05 1.84975e-05 3.69928e-05 3.69899e-05 5.54781e-05 7.39618e-05 9.24398e-05 0.00011091 9.24058e-05 9.2381e-05 0.000110826 0.000129261 0.000147687 0.000184564 0.000147615 0.000110681 7.37662e-05 7.37447e-05 3.68617e-05 3.68512e-05 3.68413e-05 7.36644e-05 1.84119e-05 9.20402e-05 3.68081e-05 9.20011e-05 1.83965e-05 3.67855e-05 9.19477e-05 5.51741e-05 3.68025e-05 1.84099e-05 1.84223e-05 1.84443e-05 0.000147766 0.000185238 0.000148648 0.00018628 0.000261579 0.000299917 0.000112826 0.000263832 0.000924849 0.00100237 0.000663267 0.000265927 0.00116325 0.00122446 0.000805771 0.00127068 0.00135391 0.00116791 0.000548406 0.000118392 0.000359141 0.00081023 0.00102569 0.000911548 0.00109016 0.00192297 0.000931737 0.000783098 0.00103594 0.00184032 0.00171673 0.00188964 0.00135885 0.00225093 0.00217032 0.00206705 0.00140484 0.000933053 0.000950047 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218 0.0244218
# 5_OR_SouthernOR_Comm_Dead 1.83208e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83207e-05 1.83211e-05 0 0 0 0 0 1.83466e-05 1.83569e-05 0 0 1.84671e-05 1.84893e-05 1.84972e-05 7.40005e-05 1.84991e-05 7.39902e-05 9.2482e-05 1.84949e-05 1.84927e-05 0.000129433 1.8488e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 1.84206e-05 0 0 0 0 0 0 0 0 0 1.84013e-05 0 0 0.000165998 1.84708e-05 0.000240809 0.000130067 0.000130396 0.000616578 0.000674814 0.000451305 0.000414594 0.000264243 0.00170214 0.00164869 0.00205143 0.00221208 0.00130098 0.00168828 0.00161723 0.0122432 0.0126913 0.0113011 0.0107539 0.0195533 0.0174604 0.00537464 0.00814178 0.00658286 0.00407839 0.00235052 0.00137571 0.00116279 0.00249606 0.00315794 0.00244167 0.0011253 0.00299416 0.00280865 0.00338826 0.00157512 0.00101788 0.00105561 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891 0.0313891
# 6_OR_SouthernOR_Comm_Live 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0107539 0.0187552 0.0310318 0.0200421 0.0329193 0.0367299 0.0177083 0.0127055 0.00736535 0.00892175 0.0105977 0.0136703 0.0146075 0.00938455 0.0143762 0.0161923 0.0118483 0.00791816 0.00517421 0.00532028 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637 0.157637
# 7_OR_SouthernOR_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000294262 0.000496834 0.000239329 0.000700046 0.000756215 0.000978951 0.00544598 0.00169088 0.00290597 0.00265316 0.0025493 0.00268902 0.0019599 0.00186857 0.00243973 0.000720119 0.00197545 0.00245998 0.000994871 0.00145806 0.00173274 0.00187614 0.00132363 0.00164522 0.00213105 0.00157623 0.00360552 0.00174368 0.000662944 0.000670865 0.000549421 0.000487044 0.000550285 0.000739956 0.000803816 0.000551049 0.000254783 0.00042464 0.00065829 0.000787274 0.000532746 0.000383137 0.000254467 0.000253344 0.00735423 0.00735423 0.00735423 0.00735423 0.00735423 0.00735423 0.00735423 0.00735423 0.00735423 0.00735423
# 8_OR_SouthernOR_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000349436 0.00058884 0.000294559 0.000865846 0.000903769 0.00118213 0.00283413 0.000984796 0.00165789 0.0015321 0.00151833 0.000902609 0.00111187 0.00107584 0.00130497 0.000852772 0.00298218 0.0034516 0.00130098 0.00168828 0.0021563 0.00234033 0.00182973 0.0013906 0.00197319 0.00151637 0.00255222 0.00121032 0.000745812 0.000796652 0.00067621 0.000847034 0.00107941 0.00105708 0.00101535 0.000953739 0.00104036 0.00129515 0.00127411 0.000872385 0.00136383 0.0010217 0.000657377 0.000675589 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816 0.0153816
# 9_OR_NorthernOR_Comm 1.83208e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1.83207e-05 1.83211e-05 0 0 0 0 0 1.83466e-05 1.83569e-05 0 0 1.84671e-05 1.84893e-05 1.84972e-05 7.40005e-05 1.84991e-05 7.39902e-05 9.2482e-05 1.84949e-05 1.84927e-05 0.000129433 1.8488e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 1.84206e-05 0 0 0 0 0 0 0 0 0 1.84013e-05 0 0 0.000165998 1.84708e-05 0.000240809 0.000130067 0.000130396 0.000597894 0.000656069 0.0004325 0.000395749 0.000264243 0.00158866 0.0021035 0.00153858 0.00101069 0.00122446 0.00122784 1.92527e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 2.11531e-05 8.47768e-05 0.000127391 6.36961e-05 4.24703e-05 0.000127666 4.26197e-05 6.38562e-05 4.24095e-05 4.22223e-05 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286 0.000898286
# 10_OR_NorthernOR_Rec_PC 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00080922 0.00138009 0.000681167 0.0019896 0.00212109 0.00277061 0.00281561 0.00302871 0.00406091 0.00399842 0.00504236 0.00509598 0.00260063 0.00298217 0.001948 0.00272887 0.00419784 0.00417625 0.00275503 0.00462359 0.00583356 0.00411976 0.00212171 0.00340795 0.00402532 0.00311256 0.00427396 0.00350788 0.0029211 0.00293503 0.00236674 0.00209641 0.00162969 0.00234672 0.00296143 0.00264927 0.00201703 0.00216567 0.00331268 0.00357465 0.00315386 0.00108555 0.000720995 0.000738925 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087 0.035087
# 11_OR_NorthernOR_Rec_PR 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000128739 0.000239216 0.00011046 0.000497401 0.000534884 0.000461769 0.00181533 0.00167229 0.00180692 0.001775 0.00224938 0.00227533 0.0011684 0.00132121 0.000869983 0.000549564 0.000588837 0.000934412 0.000593096 0.00124703 0.00190602 0.00141194 0.000992725 0.000509234 0.000927402 0.000937758 0.000911508 0.000800042 0.00118087 0.00125787 0.00107771 0.000910561 0.00107941 0.00141649 0.00173455 0.00188628 0.00161362 0.00154994 0.00203858 0.00263843 0.00268504 0.00112813 0.000742201 0.000760038 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021 0.0265021
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         6         1         0         1         1         1  #  6_OR_SouthernOR_Comm_Live
         7         1         0         0         1         1  #  7_OR_SouthernOR_Rec_PC
        10         1         0         0         1         1  #  10_OR_NorthernOR_Rec_PC
        12         1         0         1         1         1  #  12_OR_SouthernOR_Rec_PC_ORBS
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15       -9.3808             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_6_OR_SouthernOR_Comm_Live(6)
             0             2           0.5             1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_6_OR_SouthernOR_Comm_Live(6)
           -15            15             0             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_7_OR_SouthernOR_Rec_PC(7)
           -15            15      -9.24689             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_10_OR_NorthernOR_Rec_PC(10)
           -15            15       -9.8118             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_12_OR_SouthernOR_Rec_PC_ORBS(12)
             0             2           0.5             1            99             0          2          0          0          0          0          0          0          0  #  Q_extraSD_12_OR_SouthernOR_Rec_PC_ORBS(12)
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
            19            45            28            30            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_1_CA_NorthOf4010_Comm_Dead(1)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_1_CA_NorthOf4010_Comm_Dead(1)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_1_CA_NorthOf4010_Comm_Dead(1)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_1_CA_NorthOf4010_Comm_Dead(1)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_1_CA_NorthOf4010_Comm_Dead(1)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_1_CA_NorthOf4010_Comm_Dead(1)
            19            45            28            30            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_2_CA_NorthOf4010_Comm_Live(2)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_2_CA_NorthOf4010_Comm_Live(2)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_2_CA_NorthOf4010_Comm_Live(2)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_2_CA_NorthOf4010_Comm_Live(2)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_2_CA_NorthOf4010_Comm_Live(2)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_2_CA_NorthOf4010_Comm_Live(2)
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_3_CA_NorthOf4010_Rec_PC(3)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_3_CA_NorthOf4010_Rec_PC(3)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_3_CA_NorthOf4010_Rec_PC(3)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_3_CA_NorthOf4010_Rec_PC(3)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_3_CA_NorthOf4010_Rec_PC(3)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_3_CA_NorthOf4010_Rec_PC(3)
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_4_CA_NorthOf4010_Rec_PR(4)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_4_CA_NorthOf4010_Rec_PR(4)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_4_CA_NorthOf4010_Rec_PR(4)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_4_CA_NorthOf4010_Rec_PR(4)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_4_CA_NorthOf4010_Rec_PR(4)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_4_CA_NorthOf4010_Rec_PR(4)
            19            45          39.9            30            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_5_OR_SouthernOR_Comm_Dead(5)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_5_OR_SouthernOR_Comm_Dead(5)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_5_OR_SouthernOR_Comm_Dead(5)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_5_OR_SouthernOR_Comm_Dead(5)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_5_OR_SouthernOR_Comm_Dead(5)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_5_OR_SouthernOR_Comm_Dead(5)
            19            45          39.9            30            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_6_OR_SouthernOR_Comm_Live(6)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_6_OR_SouthernOR_Comm_Live(6)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_6_OR_SouthernOR_Comm_Live(6)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_6_OR_SouthernOR_Comm_Live(6)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_6_OR_SouthernOR_Comm_Live(6)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_6_OR_SouthernOR_Comm_Live(6)
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_7_OR_SouthernOR_Rec_PC(7)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_7_OR_SouthernOR_Rec_PC(7)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_7_OR_SouthernOR_Rec_PC(7)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_7_OR_SouthernOR_Rec_PC(7)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_7_OR_SouthernOR_Rec_PC(7)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_7_OR_SouthernOR_Rec_PC(7)
            19            45          39.9            30            50             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_8_OR_SouthernOR_Rec_PR(8)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_8_OR_SouthernOR_Rec_PR(8)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_8_OR_SouthernOR_Rec_PR(8)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_8_OR_SouthernOR_Rec_PR(8)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_8_OR_SouthernOR_Rec_PR(8)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_8_OR_SouthernOR_Rec_PR(8)
            19            45          39.9            30            50             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_10_OR_NorthernOR_Rec_PC(10)
            -9             5            -4            -4            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P2_10_OR_NorthernOR_Rec_PC(10)
             0             9             3             4            50             0          5          0          0          0          0          0          0          0  #  SizeSel_P3_10_OR_NorthernOR_Rec_PC(10)
             0             9             8             8            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P4_10_OR_NorthernOR_Rec_PC(10)
            -9             9            -8            -5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P5_10_OR_NorthernOR_Rec_PC(10)
            -9             9             8             5            50             0         -9          0          0          0          0          0          0          0  #  SizeSel_P6_10_OR_NorthernOR_Rec_PC(10)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
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
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
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

