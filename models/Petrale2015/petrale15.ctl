#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C 2015 Assessent of Petrale (Fish600 people) run with SS3.24O
#_data_and_control_files: petrale15.dat // petrale15.ctl
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
4 #_Nblock_Patterns
 5 3 3 1 #_blocks_per_pattern 
# begin and end years of blocks
 1973 1982 1983 1992 1993 2002 2003 2010 2011 2014
 2003 2009 2010 2010 2011 2014
 2003 2008 2009 2010 2011 2014
 1875 1875
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
17 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.005 0.5 0.145 -1.888 0.3333 3 6 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 10 45 15.8 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 35 80 54.4 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.04 0.5 0.13 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.01 1 0.19 3 0.8 0 3 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.01 1 0.03 0 1 0 4 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 -3 3 2.08296e-06 2.08296e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 1 5 3.4737 3.4737 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 10 50 33.1 33.1 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.743 -0.743 0.8 6 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 3 1 1 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 1 6 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 0.005 0.6 0.15 -1.58 0.3326 3 6 0 0 0 0 0.5 0 0 # NatM_p_1_Mal_GP_1
 10 45 16.6 17.18 10 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 35 80 43.2 58.7 10 0 3 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 0.04 0.5 0.2 0.13 0.8 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 0.01 1 0.14 3 0.8 0 3 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 0.01 1 0.05 0 1 0 4 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 -3 3 3.05e-06 3.05e-06 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal
 -3 5 3.36054 3.36054 0.8 6 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal
 0 1 1 0.2 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_GP_1
 0 1 1 1 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_Area_1
 -4 4 0 1 9.8 6 -3 0 0 0 0 0.5 0 0 # RecrDist_timing_1
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
             5            20          9.64             9            10             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1           0.9           0.8          0.09             6          5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2           0.4           0.9             5             6        -99          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0           0.2             6         -2          0          0          0          0          0          0          0 # SR_regime
             0             0             0             0             0             0        -99          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1959 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1845 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1944 #_last_early_yr_nobias_adj_in_MPD
 1964 #_first_yr_fullbias_adj_in_MPD
 2011 #_last_yr_fullbias_adj_in_MPD
 2014 #_first_recent_yr_nobias_adj_in_MPD
 0.8 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -4 #min rec_dev
 4 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1845E 1846E 1847E 1848E 1849E 1850E 1851E 1852E 1853E 1854E 1855E 1856E 1857E 1858E 1859E 1860E 1861E 1862E 1863E 1864E 1865E 1866E 1867E 1868E 1869E 1870E 1871E 1872E 1873E 1874E 1875E 1876E 1877E 1878E 1879E 1880E 1881E 1882E 1883E 1884E 1885E 1886E 1887E 1888E 1889E 1890E 1891E 1892E 1893E 1894E 1895E 1896E 1897E 1898E 1899E 1900E 1901E 1902E 1903E 1904E 1905E 1906E 1907E 1908E 1909E 1910E 1911E 1912E 1913E 1914E 1915E 1916E 1917E 1918E 1919E 1920E 1921E 1922E 1923E 1924E 1925E 1926E 1927E 1928E 1929E 1930E 1931E 1932E 1933E 1934E 1935E 1936E 1937E 1938E 1939E 1940E 1941E 1942E 1943E 1944E 1945E 1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959R 1960R 1961R 1962R 1963R 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013F 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
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
#2026 2035
# F rates by fleet
# Yr:  1876 1877 1878 1879 1880 1881 1882 1883 1884 1885 1886 1887 1888 1889 1890 1891 1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# WinterN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5.4946e-05 0.000166553 0.000284323 0.000412777 0.000486219 0.000625944 0.000914897 0.00124862 0.00148812 0.00167812 0.00201754 0.00246631 0.00293818 0.00337982 0.00400391 0.00483797 0.00608019 0.00805674 0.023285 0.0245157 0.03394 0.013735 0.00937685 0.0264148 0.0834989 0.170932 0.307345 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 7.88433e+08 8.44577e+10 8.97709e-63 9.69952e-39 1.786e-12 3.70602e-11 2.00083e-10 5.58368e-10 1.08949e-09 1.73413e-09 2.46799e-09 3.35233e-09
# SummerN 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.29054e-06 6.80414e-06 5.30882e-06 5.18756e-06 5.06574e-06 4.94332e-06 4.82025e-06 4.66145e-06 4.53685e-06 4.41151e-06 4.28539e-06 4.15847e-06 4.03071e-06 3.8663e-06 3.73668e-06 3.60617e-06 3.47474e-06 3.34238e-06 3.20906e-06 3.03816e-06 2.90253e-06 2.77098e-06 2.63872e-06 2.49666e-06 2.34617e-06 2.15665e-06 2.01029e-06 1.86714e-06 1.72565e-06 1.58509e-06 1.44226e-06 1.33769e-06 1.92675e-08 5.9958e-05 4.80731e-05 0.00322292 0.0100292 0.0165329 0.0235655 0.027994 0.0342143 0.0484256 0.057483 0.0798243 0.0965888 0.107042 0.188201 0.206286 0.161543 0.156954 0.231419 0.186857 0.287518 0.289639 0.524195 0.526339 0.55025 0.336957 0.488874 0.607091 0.695816 1.62185 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 1.85879e+08 7.2861e+10 8.97709e-63 9.69952e-39 1.786e-12 3.70602e-11 2.00083e-10 5.58368e-10 1.08949e-09 1.73413e-09 2.46799e-09 3.35233e-09
# WinterS 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00203338 0.00117754 0.00126075 0.0046586 0.00536677 0.00338739 0.00272385 0.00182577 0.00124336 0.00693585 0.00500409 0.00117454 0.00376773 0.00482959 0.00602566 0.0046127 0.0108967 0.0221963 0.061857 0.0557702 0.0346898 0.0623958 0.111825 0.192671 0.155946 0.18292 0.269794 0.646905 1.89874 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 1.25316e+06 -1.51382e+07 8.97709e-63 9.69952e-39 1.786e-12 3.70602e-11 2.00083e-10 5.58368e-10 1.08949e-09 1.73413e-09 2.46799e-09 3.35233e-09
# SummerS 2.78887e-05 2.78894e-05 2.78901e-05 2.78908e-05 0.000322189 0.000616748 0.000911795 0.00120754 0.00150416 0.00180184 0.00210072 0.00240092 0.00270256 0.00300574 0.00331055 0.00361705 0.00392532 0.00423569 0.00454765 0.00486152 0.00517736 0.00549521 0.00581507 0.00613699 0.00646099 0.0067871 0.00711534 0.00744575 0.00777834 0.00811314 0.00845018 0.00878947 0.00913105 0.00947494 0.00982116 0.0101697 0.0105207 0.0108741 0.0112299 0.0115882 0.0117973 0.0161529 0.013075 0.0103078 0.00711809 0.00905606 0.0131085 0.0132265 0.0165635 0.0165197 0.0163915 0.0199857 0.019754 0.0226746 0.0213322 0.0173121 0.0171041 0.0130358 0.0304742 0.0273242 0.0155891 0.0276014 0.0346279 0.0423575 0.0261501 0.0153109 0.0106554 0.0186315 0.0259948 0.0268394 0.073969 0.0803083 0.150593 0.190211 0.227703 0.176929 0.182233 0.223466 0.281841 0.343595 0.320848 0.596562 1.29349 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 6.90733e+06 7.6466e+10 8.97709e-63 9.69952e-39 1.786e-12 3.70602e-11 2.00083e-10 5.58368e-10 1.08949e-09 1.73413e-09 2.46799e-09 3.35233e-09
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         3         0         0         1         0  #  WinterN
         3         3         0         0         1         0  #  WinterS
         5         1         0         1         0         1  #  TriEarly
         6         1         0         1         0         1  #  TriLate
         7         1         0         0         0         1  #  NWFSC
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -20             5            -9             0            99             0          1          0          1       1987       2009         -5          0          0  #  LnQ_base_WinterN(1)
            -5             5          0.38             0            99             0          3          0          0          0          0          0          0          0  #  Q_power_WinterN(1)
           -20             5             0            -1            99             0         -1          0          1       1987       2009         -5          0          0  #  LnQ_base_WinterS(3)
            -5             5          0.16             0            99             0          3          0          0          0          0          0          0          0  #  Q_power_WinterS(3)
           -15            15       11.6573             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TriEarly(5)
         0.001             2          0.28          0.22            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_TriEarly(5)
           -15            15       11.8281             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TriLate(6)
         0.001             2          0.15          0.16            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_TriLate(6)
           -15            15       14.2224             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSC(7)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001            2              2            99           0.5             6      -5  # LnQ_base_WinterN(1)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # LnQ_base_WinterN(1)_dev_autocorr
        0.0001            2              2            99           0.5             6      -5  # LnQ_base_WinterS(3)_dev_se
         -0.99          0.99             0             0           0.5             6      -6  # LnQ_base_WinterS(3)_dev_autocorr
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
 24 1 3 0 # 1 WinterN
 24 1 3 0 # 2 SummerN
 24 1 3 0 # 3 WinterS
 24 1 3 0 # 4 SummerS
 24 0 3 0 # 5 TriEarly
 24 0 3 0 # 6 TriLate
 24 0 3 0 # 7 NWFSC
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
 10 0 0 0 # 1 WinterN
 10 0 0 0 # 2 SummerN
 10 0 0 0 # 3 WinterS
 10 0 0 0 # 4 SummerS
 10 0 0 0 # 5 TriEarly
 10 0 0 0 # 6 TriLate
 10 0 0 0 # 7 NWFSC
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            15            75          46.6          43.1             5             0          1          0          0          0          0        0.5          1          1  #  SizeSel_P1_WinterN(1)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_WinterN(1)
            -4            12           3.9          3.42             5             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P3_WinterN(1)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_WinterN(1)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_WinterN(1)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_WinterN(1)
            10            40         26.19            15             9             0          1          0          0          0          0          0          2          1  #  Retain_P1_WinterN(1)
           0.1            10         1.701             3             9             0          2          0          0          0          0          0          2          1  #  Retain_P2_WinterN(1)
           -10            10       5.19749            10             9             0          4          0          0          0          0          0          2          1  #  Retain_P3_WinterN(1)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_P4_WinterN(1)
           -15            15          -8.8             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_WinterN(1)
           -15            15          -1.1             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_WinterN(1)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_WinterN(1)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_WinterN(1)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_WinterN(1)
            15            75          53.8          43.1             5             0          1          0          0          0          0        0.5          1          1  #  SizeSel_P1_SummerN(2)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_SummerN(2)
            -4            12           5.3          3.42             5             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P3_SummerN(2)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_SummerN(2)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_SummerN(2)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_SummerN(2)
            10            40        30.679            15             9             0          1          0          0          0          0          0          3          1  #  Retain_P1_SummerN(2)
           0.1            10        1.1278             3             9             0          2          0          0          0          0          0          3          1  #  Retain_P2_SummerN(2)
         0.001             1        0.9999             1             9             0          4          0          0          0          0          0          3          1  #  Retain_P3_SummerN(2)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_P4_SummerN(2)
           -20            15         -13.7             0            -5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_SummerN(2)
           -15            15          -1.9             0            -5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_SummerN(2)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_SummerN(2)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_SummerN(2)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_SummerN(2)
            15            75        40.422          43.1             5             0          1          0          0          0          0        0.5          1          1  #  SizeSel_P1_WinterS(3)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_WinterS(3)
            -4            12        4.5999          3.42             5             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P3_WinterS(3)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_WinterS(3)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_WinterS(3)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_WinterS(3)
            10            40        28.816            15             9             0          1          0          0          0          0          0          2          1  #  Retain_P1_WinterS(3)
           0.1            10        1.1443             3             9             0          2          0          0          0          0          0          2          1  #  Retain_P2_WinterS(3)
         0.001             1         0.986             1             9             0          4          0          0          0          0          0          2          1  #  Retain_P3_WinterS(3)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_P4_WinterS(3)
           -15            15       -14.995             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_WinterS(3)
           -15            15       -2.4591             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_WinterS(3)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_WinterS(3)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_WinterS(3)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_WinterS(3)
            15            75       43.0793          43.1             5             0          1          0          0          0          0        0.5          1          1  #  SizeSel_P1_SummerS(4)
            -5             3             3           0.7             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_SummerS(4)
            -4            12        4.7717          3.42             5             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P3_SummerS(4)
            -2            15            14          0.21             5             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P4_SummerS(4)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_SummerS(4)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_SummerS(4)
            10            40        29.055            15             9             0          1          0          0          0          0          0          3          1  #  Retain_P1_SummerS(4)
           0.1            10         0.976             3             9             0          2          0          0          0          0          0          3          1  #  Retain_P2_SummerS(4)
         0.001             1        0.9995             1             9             0          4          0          0          0          0          0          3          1  #  Retain_P3_SummerS(4)
           -10            10             0             0             9             0         -2          0          0          0          0          0          0          0  #  Retain_P4_SummerS(4)
           -15            15       -11.004             0             5             0          3          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_SummerS(4)
           -15            15         -1.44             0             5             0          4          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_SummerS(4)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_SummerS(4)
           -15            15             0             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_SummerS(4)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_SummerS(4)
            15            61       35.8319          43.1             5             0          1          0          0          0          0        0.5          0          0  #  SizeSel_P1_TriEarly(5)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  SizeSel_P2_TriEarly(5)
            -4            12        4.2596          3.42             5             0          1          0          0          0          0        0.5          0          0  #  SizeSel_P3_TriEarly(5)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  SizeSel_P4_TriEarly(5)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_TriEarly(5)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_TriEarly(5)
           -15            15       -3.7323             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_TriEarly(5)
           -15            15       -0.5322             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_TriEarly(5)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_TriEarly(5)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_TriEarly(5)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_TriEarly(5)
            15            61       36.9845          43.1             5             0          1          0          0          0          0        0.5          0          0  #  SizeSel_P1_TriLate(6)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  SizeSel_P2_TriLate(6)
            -4            12        4.6735          3.42             5             0          1          0          0          0          0        0.5          0          0  #  SizeSel_P3_TriLate(6)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  SizeSel_P4_TriLate(6)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_TriLate(6)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_TriLate(6)
           -15            15       -4.0542             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_TriLate(6)
           -15            15       -0.1367             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_TriLate(6)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_TriLate(6)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_TriLate(6)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_TriLate(6)
            15            61       43.5877          43.1             5             0          1          0          0          0          0        0.5          0          0  #  SizeSel_P1_NWFSC(7)
            -5             3             3           0.7             5             0         -2          0          0          0          0        0.5          0          0  #  SizeSel_P2_NWFSC(7)
            -4            12        5.2029          3.42             5             0          1          0          0          0          0        0.5          0          0  #  SizeSel_P3_NWFSC(7)
            -2            15            14          0.21             5             0         -2          0          0          0          0        0.5          0          0  #  SizeSel_P4_NWFSC(7)
           -15             5          -999          -8.9             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_NWFSC(7)
            -5             5          -999          0.15             5             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P6_NWFSC(7)
           -15            15       -5.8784             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Peak_NWFSC(7)
           -15            15       -0.4792             0             5             0          2          0          0          0          0        0.5          0          0  #  SzSel_Male_Ascend_NWFSC(7)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Descend_NWFSC(7)
           -15            15             0             0             5             0         -3          0          0          0          0        0.5          0          0  #  SzSel_Male_Final_NWFSC(7)
           -15            15             1             0             5             0         -4          0          0          0          0        0.5          0          0  #  SzSel_Male_Scale_NWFSC(7)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterN(1)_BLK1add_1973
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterN(1)_BLK1add_1983
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterN(1)_BLK1add_1993
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterN(1)_BLK1add_2003
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterN(1)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_P1_WinterN(1)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_P1_WinterN(1)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_P1_WinterN(1)_BLK2add_2011
            -3             2             0             0            99             0      4  # Retain_P2_WinterN(1)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_P2_WinterN(1)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_P2_WinterN(1)_BLK2add_2011
            -3             2             0             0            99             0      4  # Retain_P3_WinterN(1)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_P3_WinterN(1)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_P3_WinterN(1)_BLK2add_2011
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerN(2)_BLK1add_1973
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerN(2)_BLK1add_1983
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerN(2)_BLK1add_1993
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerN(2)_BLK1add_2003
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerN(2)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_P1_SummerN(2)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_P1_SummerN(2)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_P1_SummerN(2)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_P2_SummerN(2)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_P2_SummerN(2)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_P2_SummerN(2)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_P3_SummerN(2)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_P3_SummerN(2)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_P3_SummerN(2)_BLK3add_2011
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterS(3)_BLK1add_1973
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterS(3)_BLK1add_1983
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterS(3)_BLK1add_1993
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterS(3)_BLK1add_2003
            -3             2             0             0            99             0      4  # SizeSel_P1_WinterS(3)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_P1_WinterS(3)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_P1_WinterS(3)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_P1_WinterS(3)_BLK2add_2011
            -3             2             0             0            99             0      4  # Retain_P2_WinterS(3)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_P2_WinterS(3)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_P2_WinterS(3)_BLK2add_2011
            -3             4             0             0            99             0      4  # Retain_P3_WinterS(3)_BLK2add_2003
            -3             2             0             0            99             0      4  # Retain_P3_WinterS(3)_BLK2add_2010
            -3             2             0             0            99             0      4  # Retain_P3_WinterS(3)_BLK2add_2011
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerS(4)_BLK1add_1973
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerS(4)_BLK1add_1983
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerS(4)_BLK1add_1993
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerS(4)_BLK1add_2003
            -3             2             0             0            99             0      4  # SizeSel_P1_SummerS(4)_BLK1add_2011
            -3             2             0             0            99             0      4  # Retain_P1_SummerS(4)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_P1_SummerS(4)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_P1_SummerS(4)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_P2_SummerS(4)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_P2_SummerS(4)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_P2_SummerS(4)_BLK3add_2011
            -3             2             0             0            99             0      4  # Retain_P3_SummerS(4)_BLK3add_2003
            -3             2             0             0            99             0      4  # Retain_P3_SummerS(4)_BLK3add_2009
            -3             2             0             0            99             0      4  # Retain_P3_SummerS(4)_BLK3add_2011
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
#      3     1     1     0     0     0     0     1     1  1987  2009     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      3     3     3     0     0     0     0     2     1  1987  2009     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
#      5     1     5     1     1     2     0     0     0     0     0     0
#      5     7    10     2     1     2     0     0     0     0     0     0
#      5     8    13     2     1     2     0     0     0     0     0     0
#      5     9    16     2     1     2     0     0     0     0     0     0
#      5    16    19     1     1     2     0     0     0     0     0     0
#      5    22    24     3     1     2     0     0     0     0     0     0
#      5    23    27     3     1     2     0     0     0     0     0     0
#      5    24    30     3     1     2     0     0     0     0     0     0
#      5    31    33     1     1     2     0     0     0     0     0     0
#      5    37    38     2     1     2     0     0     0     0     0     0
#      5    38    41     2     1     2     0     0     0     0     0     0
#      5    39    44     2     1     2     0     0     0     0     0     0
#      5    46    47     1     1     2     0     0     0     0     0     0
#      5    52    52     3     1     2     0     0     0     0     0     0
#      5    53    55     3     1     2     0     0     0     0     0     0
#      5    54    58     3     1     2     0     0     0     0     0     0
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
      2      1      0.02
      4      1      2.38
      5      1      6.26
      2      2      0.02
      4      2      1.89
      5      2      2.21
      2      3      0.02
      4      3      1.25
      5      3      1.83
      2      4      0.02
      4      4      1.34
      5      4       1.6
      4      5      1.59
      4      6      1.19
      4      7      0.59
      5      7      0.22
 -9999   1    0  # terminator
#
15 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 10 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 1 1 1 1 1
 1 3 1 1 1
 5 1 1 0.5 1
 5 2 1 0.5 1
 5 3 1 0.5 1
 5 4 1 0.5 1
 4 1 1 0.5 1
 4 2 1 0.5 1
 4 3 1 0.5 1
 4 4 1 0.5 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_1
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_CPUE/survey:_2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_3
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_discard:_4
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_5
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_6
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_discard:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:2
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:3
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_meanbodywt:7
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_1
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_2
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_3
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_lencomp:_4
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_5
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_lencomp:_7
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_1
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_2
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_3
#  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 #_agecomp:_4
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_agecomp:_5
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 #_agecomp:_6
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_agecomp:_7
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_init_equ_catch
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

