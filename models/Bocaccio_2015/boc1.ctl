#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: boc1.dat // boc1.ctl
#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
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
3 #_Nblock_Patterns
 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 2003 2014
 1995 2014
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
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0.5 #_Age(post-settlement)_for_L1;linear growth below this
25 #_Growth_Age_for_L2 (999 to use as Linf)
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
 0.05 0.4 0.167 -2.05066 0.516638 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
 1 45 17.6556 17.7256 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 60 80 67.1193 67.8153 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.25 0.25 0.219878 99 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.05 0.25 0.123703 0.116225 99 0 6 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.05 0.25 0.051 0.0741631 99 0 6 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
 -3 3 7.355e-06 7.36e-06 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem
 -3 4 3.11359 3.11359 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem
 30 60 37.7 37.7 99 0 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem
 -3 3 -0.33397 -0.33397 99 0 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem
 -3 300 254.9 254.9 99 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem
 -3 30 20 20 99 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem
 -0.5 0.5 0 0 99 0 -2 0 0 0 0 0.5 0 0 # NatM_p_1_Mal_GP_1
 -1 1 0 0 99 0 -2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -1 1 -0.0494969 -0.0767574 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -1 1 0.0826601 0.0575865 99 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -1 1 -0.0755577 -0.067776 99 0 6 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -1 1 -0.00203877 0.0729374 99 0 6 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
 -3 3 7.355e-06 7.36e-06 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal
 -3 4 3.11359 3.11359 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal
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
             6            15       8.56447           8.6            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.21          0.99         0.773         0.773         0.147             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             1            99             0         -4          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1964 # first year of main recr_devs; early devs can preceed this era
2013 # last year of main recr_devs; forecast devs start in following year
4 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1954 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1970.78 #_last_early_yr_nobias_adj_in_MPD
 1971.86 #_first_yr_fullbias_adj_in_MPD
 2013.85 #_last_yr_fullbias_adj_in_MPD
 2014.97 #_first_recent_yr_nobias_adj_in_MPD
 0.9197 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
1 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# Specified recr devs to read
1964 2
#
# all recruitment deviations
#  1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F
#  0.132244 0.0460042 0.028163 0.306111 0.333724 0.64811 0.631015 0.398174 0.661265 0.556298 0.558979 1.75255 0.502164 0.33971 0.849639 0.963372 0.787747 -0.0339364 1.13072 1.38766 1.25259 0.845266 -1.0008 1.94062 1.67844 0.369377 -0.126187 -0.855409 -1.41247 -1.1576 1.19301 0.132001 -0.47984 -0.542097 1.05874 -0.383652 -0.230815 -0.248921 -0.178642 -0.517685 -0.763376 -0.862848 -1.18688 -0.824494 -1.90324 1.43543 -0.742204 -1.06739 -1.43662 0.053663 -0.994332 -0.53717 -0.939793 -1.15867 -1.33353 -0.556944 0.712763 0.327477 0.142513 2.06111 -0.402235 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 1
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0.0001 0.05 0.0123077 0.007 99 0 1 # InitF_seas_1_flt_2HL
#2024 2035
# F rates by fleet
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# TrawlSouth 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00344318 0.0054215 0.0061881 0.00424948 0.00437409 0.00363875 0.00318376 0.00355118 0.00238482 0.00192639 0.00539008 0.00724468 0.00984065 0.00782658 0.00891797 0.00300855 0.00454634 0.00589544 0.00715473 0.00594728 0.00709951 0.0060667 0.00503993 0.00328119 0.00298161 0.00211379 0.000511314 0.000486574 0.000189797 0.00362011 0.00742347 0.000372711 0.00549962 0.00633514 0.0207114 0.0536357 0.0956255 0.128599 0.12924 0.152351 0.187397 0.225331 0.270942 0.231783 0.182132 0.118494 0.088738 0.091762 0.061196 0.058215 0.138445 0.19463 0.0827837 0.0468371 0.0576001 0.0404399 0.0673144 0.206409 0.335968 0.207856 0.216094 0.157966 0.14345 0.240898 0.182426 0.104729 0.176857 0.222501 0.27701 0.160245 0.197053 0.130619 0.133782 0.185128 0.231718 0.144278 0.123602 0.162676 0.212485 0.139043 0.159951 0.110659 0.0373942 0.0179968 0.0123225 0.00440619 0.00843624 0.00161336 0.00349962 0.00549346 0.00328023 0.00102194 0.00141194 0.00360139 0.00230773 0.00141325 0.00201923 0.00234566 0.000580718 0.00339723 0.00264896 0.000660534 0.000537527 0.000469833 0.00043083 0.000406447 0.00038975 0.000377367 0.000367612
# HL 0.00595924 0.00559866 0.00524268 0.00489222 0.00460464 0.00432075 0.00403951 0.00375994 0.00415202 0.00454472 0.00493875 0.00533471 0.00573208 0.00612609 0.00652237 0.00692031 0.0073203 0.0082477 0.00918229 0.010125 0.0110766 0.0120377 0.0130086 0.0139899 0.0149186 0.0237631 0.0255118 0.0170003 0.0177791 0.0150046 0.0135672 0.0160464 0.0149823 0.0175628 0.0233012 0.0185795 0.0181199 0.0166183 0.0208497 0.0219927 0.016419 0.0097926 0.0120118 0.0139941 0.0179746 0.015536 0.0112348 0.00758313 0.00899685 0.00703182 0.00268424 0.00260247 0.00309496 0.00478617 0.00469506 0.00768107 0.00585729 0.00691496 0.0129734 0.0106624 0.00763895 0.00311467 0.00419257 0.0062182 0.0167142 0.0168867 0.0148382 0.00948414 0.00716209 0.00589756 0.00440118 0.00480329 0.00353214 0.00367023 0.00548461 0.00471977 0.0028531 0.00242971 0.00240952 0.00230655 0.00336254 0.00431083 0.00542511 0.00615583 0.00937171 0.00859621 0.0121046 0.018693 0.0175955 0.0148192 0.0208162 0.0180292 0.0461634 0.0231684 0.0551645 0.0620363 0.106313 0.0982124 0.162358 0.0899395 0.159139 0.177556 0.105313 0.0394472 0.0552314 0.0360628 0.0269184 0.0135527 0.00447113 0.00408663 4.41871e-05 0 0.000388917 0.000308752 0.00203788 0.00216196 0.000746388 0.000516999 0.000346265 0.000507928 0.000676533 0.000644887 0.000798538 0.00102336 0.000736428 0.000185971 0.000162694 0.000153509 0.000149465 0.000146944 0.000144708 0.00014251 0.000140391
# Setnet 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000675804 0.000572598 0.00226354 0.00268003 0.00657694 0.0125135 0.0168223 0.00786303 0.0103019 0.00854415 0.0186009 0.016145 0.0225048 0.0259063 0.0612274 0.0975969 0.241264 0.364954 0.279455 0.092486 0.307148 0.363231 0.18997 0.243341 0.207164 0.163851 0.202125 0.0678116 0.0274589 0.0327184 0.00618982 0.000613059 0.000699153 4.12332e-06 0 5.29675e-05 4.70797e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000114379 0.000230005 0.000346459 0.000463762 0.000580163 0.000694135 0.000808286 0.000923606 0.000924931 0.00159529 0.00128549 0.00113402 0.000809734 0.00074513 0.000393463 0.000373712 0.000307683 0.0004168 0.000727955 0.002195 0.00602605 0.0078736 0.00939984 0.00834786 0.00967861 0.0114518 0.0289255 0.0568146 0.0737259 0.0463644 0.0281602 0.0166339 0.0160991 0.0160654 0.0136181 0.0118607 0.0137109 0.0166306 0.025845 0.029762 0.0311005 0.0294582 0.0383361 0.0344232 0.0469368 0.0608694 0.0888394 0.094884 0.0795597 0.0757024 0.0746164 0.0937399 0.0476433 0.0522605 0.0904835 0.0288737 0.0312928 0.0686693 0.0774566 0.0164442 0.0226845 0.0454304 0.0386213 0.0416049 0.0499197 0.0460224 0.12024 0.0193352 0.0429898 0.0525742 0.0270686 0.0667358 0.0354856 0.0217962 0.0243175 0.00440483 0.0257181 0.0814647 0.0221743 0.034275 0.0219855 0.0251315 0.0256691 0.0414603 0.0326584 0.0261014 0.013079 0.024897 0.0227069 0.00788016 0.00852075 0.00893004 0.00908695 0.00910145 0.00905607 0.00899211 0.00892713
# RecCentral 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.62794e-05 0.000193642 0.000223652 0.000299312 0.000374942 0.000449226 0.000522636 0.000597214 0.000673017 0.000799271 0.000785882 0.000684891 0.0009824 0.000903797 0.000476381 0.000452549 0.000372258 0.000504686 0.000883262 0.000704311 0.00141224 0.00183885 0.00226678 0.00274361 0.00247993 0.0022144 0.00290665 0.00370258 0.0045042 0.00491495 0.00866552 0.00758031 0.00586147 0.00449895 0.00463658 0.00460237 0.00355979 0.00465007 0.00478051 0.0040032 0.00334266 0.00335057 0.00350204 0.00302017 0.00347519 0.00562051 0.00712789 0.00804294 0.00915545 0.00877323 0.00963734 0.0113146 0.0143802 0.0103815 0.0198455 0.0229156 0.00750544 0.0107422 0.0296828 0.0173126 0.00784082 0.0182227 0.0172379 0.0170877 0.0190431 0.0240142 0.0298697 0.00168591 0.0176788 0.0672151 0.0167953 0.0398595 0.0445814 0.0208324 0.00238838 5.1275e-06 0.000623175 0.00298925 0.00322567 0.00240157 0.000953348 0.00230847 0.00179223 0.00105593 0.00114398 0.000778371 0.000729883 0.0012319 0.000999793 0.000310329 0.000310496 0.000309948 0.000305599 0.000299611 0.000293595 0.000288176 0.000283486
# TrawlNorth 6.75885e-06 6.72831e-06 6.69985e-06 5.19231e-06 4.80705e-06 4.79426e-06 4.78232e-06 4.77093e-06 4.76118e-06 4.75407e-06 4.74932e-06 4.7466e-06 5.11069e-06 5.11129e-06 5.11329e-06 5.11653e-06 5.12085e-06 5.1271e-06 5.13607e-06 5.51515e-06 5.52966e-06 5.54621e-06 5.56457e-06 5.58456e-06 1.15938e-05 1.77348e-05 3.36272e-05 1.23334e-05 1.47037e-05 1.90036e-05 1.59025e-05 9.31203e-06 1.66962e-05 4.04146e-05 3.82475e-05 6.55438e-05 5.5577e-05 0.00111902 0.000672886 0.00198934 0.00149895 0.00237444 0.001656 0.00172654 0.000715011 0.00165389 0.00190826 0.00343848 0.00240201 0.00214396 0.00108772 0.00790623 0.0251784 0.0486605 0.0251308 0.0260028 0.0165468 0.015896 0.015803 0.0229547 0.0121753 0.0146683 0.0126168 0.018326 0.0222522 0.031808 0.0355517 0.0306995 0.0287199 0.0209712 0.0160656 0.0194199 0.0103805 0.0131998 0.00912958 0.0131373 0.0143825 0.00736673 0.00800791 0.0104394 0.0112565 0.0194894 0.0187327 0.0247761 0.0325665 0.0319932 0.0379439 0.0199338 0.0378131 0.107618 0.107549 0.164996 0.169659 0.102832 0.086861 0.117853 0.138987 0.14199 0.178999 0.0898936 0.0478713 0.087413 0.0883874 0.0976502 0.0408807 0.0613817 0.0223399 0.0210433 0.00528492 0.00354576 0.00694594 5.87334e-05 0.00061667 7.06089e-05 0.00015239 0.000218752 0.000632187 0.00019366 0.000310471 0.000272837 0.000251883 0.000136538 0.000362554 0.000415783 0.00032988 9.3972e-05 8.52447e-05 7.92785e-05 7.49998e-05 7.18185e-05 6.93667e-05 6.74208e-05 6.58395e-05
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         1         0         1         0         1  #  TrawlSouth
         4         1         0         1         0         1  #  RecSouth
         5         1         0         1         0         1  #  RecCentral
         7         1         0         1         0         1  #  CalCOFI
         8         1         0         0         0         1  #  Triennial
         9         1         0         1         0         1  #  CDFWEarlyOB
        10         1         0         1         0         1  #  NWFSCHook
        11         1         0         1         0         1  #  NWFSCTrawl
        12         1         0         1         0         1  #  Juvenile
        13         1         0         0         0         1  #  Rec2013
        14         1         0         1         0         1  #  PPIndex
        17         1         0         1         0         1  #  RecSouthOB
        18         1         0         1         0         1  #  RecCentralOB
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15       -4.6259             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TrawlSouth(1)
        0.0001             1     0.0932993          0.04            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_TrawlSouth(1)
           -15            15       -10.175             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecSouth(4)
        0.0001             1      0.349981          0.49            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecSouth(4)
           -15            15      -10.0637             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecCentral(5)
        0.0001             1       0.38126          0.66            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_RecCentral(5)
           -15            15      -14.9431             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CalCOFI(7)
        0.0001             1        0.0011          0.16            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_CalCOFI(7)
           -15            15      0.566147             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial(8)
           -15            15      -10.0155             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CDFWEarlyOB(9)
        0.0001             1      0.223476          0.25            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_CDFWEarlyOB(9)
           -15            15      -10.1439             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCHook(10)
        0.0001             1      0.186669          0.22            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCHook(10)
           -15            15    -0.0548766             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCTrawl(11)
        0.0001             1        0.0011          0.02            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCTrawl(11)
           -15            15      -6.84139             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Juvenile(12)
        0.0001             1      0.356233          0.39            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_Juvenile(12)
           -15            15     -0.393072             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Rec2013(13)
           -15            15      -11.1138             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_PPIndex(14)
        0.0001             1      0.399146          0.38            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_PPIndex(14)
           -15            15      -10.0207             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecSouthOB(17)
        0.0001             1      0.260967          0.44            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecSouthOB(17)
           -15            15      -11.5562             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecCentralOB(18)
        0.0001             1      0.249501          0.23            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecCentralOB(18)
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
 24 0 0 0 # 1 TrawlSouth
 24 0 0 0 # 2 HL
 24 0 0 0 # 3 Setnet
 24 0 0 0 # 4 RecSouth
 24 0 0 0 # 5 RecCentral
 24 0 0 0 # 6 TrawlNorth
 0 0 0 0 # 7 CalCOFI
 24 0 0 0 # 8 Triennial
 5 0 0 5 # 9 CDFWEarlyOB
 24 0 0 0 # 10 NWFSCHook
 24 0 0 0 # 11 NWFSCTrawl
 0 0 0 0 # 12 Juvenile
 0 0 0 0 # 13 Rec2013
 0 0 0 0 # 14 PPIndex
 5 0 0 1 # 15 Free1
 5 0 0 4 # 16 MirrorRecS
 5 0 0 4 # 17 RecSouthOB
 5 0 0 5 # 18 RecCentralOB
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
 11 0 0 0 # 1 TrawlSouth
 11 0 0 0 # 2 HL
 11 0 0 0 # 3 Setnet
 11 0 0 0 # 4 RecSouth
 11 0 0 0 # 5 RecCentral
 11 0 0 0 # 6 TrawlNorth
 11 0 0 0 # 7 CalCOFI
 11 0 0 0 # 8 Triennial
 11 0 0 0 # 9 CDFWEarlyOB
 11 0 0 0 # 10 NWFSCHook
 11 0 0 0 # 11 NWFSCTrawl
 11 0 0 0 # 12 Juvenile
 11 0 0 0 # 13 Rec2013
 11 0 0 0 # 14 PPIndex
 11 0 0 0 # 15 Free1
 11 0 0 0 # 16 MirrorRecS
 11 0 0 0 # 17 RecSouthOB
 11 0 0 0 # 18 RecCentralOB
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            16            60       44.3593       43.7321            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P1_TrawlSouth(1)
           -20             1      -12.3642      -11.8577            10             0          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_TrawlSouth(1)
             1            10       4.39009       4.42101            10             0          4          0          0          0          0        0.5          1          2  #  SizeSel_P3_TrawlSouth(1)
            -1             9       4.25705       4.59596            10             0          4          0          0          0          0        0.5          1          2  #  SizeSel_P4_TrawlSouth(1)
           -30             0      -16.4974      -16.2796            10             0          4          0          0          0          0        0.5          0          0  #  SizeSel_P5_TrawlSouth(1)
            -5             5      -1.56612      -1.51897            10             0          4          0          0          0          0        0.5          1          2  #  SizeSel_P6_TrawlSouth(1)
            16            60       53.7472       50.2935            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_HL(2)
           -20             0      -10.9424      -11.1769            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_HL(2)
             1            12       4.88433       4.85455            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_HL(2)
            -1             9       4.12087       4.09085            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_HL(2)
           -15             0      -7.55705      -7.65174            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P5_HL(2)
            -5             5     -0.495033     -0.891802            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_HL(2)
            16            60       49.7496       47.7691            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Setnet(3)
           -20             0      -12.4118      -12.0492            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_Setnet(3)
             1            10       3.68158       3.62227            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_Setnet(3)
            -1             9       4.02836       4.00071            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_Setnet(3)
           -10             3      -6.69588      -6.40904            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P5_Setnet(3)
            -5             5      -1.53115      -1.92151            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_Setnet(3)
            16            60       38.0507       37.8456            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P1_RecSouth(4)
           -20             0      -11.0133      -4.03328            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecSouth(4)
             1            10       4.71643       4.63756            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P3_RecSouth(4)
            -1             9        5.9182       5.56413            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P4_RecSouth(4)
           -10             2      -7.63183       -6.9658            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P5_RecSouth(4)
           -10             9       -3.8421       -3.8711            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P6_RecSouth(4)
            16            60       48.5617         47.65            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P1_RecCentral(5)
           -20             0      -10.9884      -11.3327            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecCentral(5)
             1            10       5.38514       5.55578            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P3_RecCentral(5)
            -1             9       3.63676       3.88992            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P4_RecCentral(5)
           -10             2      -5.37026      -5.46783            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P5_RecCentral(5)
           -10             9    -0.0837852     0.0533028            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P6_RecCentral(5)
            16            60       45.1635       45.9359            10             0          3          0          0          0          0        0.5          1          2  #  SizeSel_P1_TrawlNorth(6)
            -5             5      -1.19244     -0.853133            10             0          4          0          0          0          0        0.5          0          0  #  SizeSel_P2_TrawlNorth(6)
             1            15         1.001        3.8369            10             0          4          0          0          0          0        0.5          1          2  #  SizeSel_P3_TrawlNorth(6)
            -5             5       3.04679        2.9507            10             0          4          0          0          0          0        0.5          1          2  #  SizeSel_P4_TrawlNorth(6)
           -15             0      -8.83196      -9.40927            10             0          4          0          0          0          0        0.5          0          0  #  SizeSel_P5_TrawlNorth(6)
           -10            10       0.16747     0.0689498            10             0          4          0          0          0          0        0.5          1          2  #  SizeSel_P6_TrawlNorth(6)
            16            60       26.5363       28.0443            10             0          2          0          0          0          0        0.5          2          2  #  SizeSel_P1_Triennial(8)
           -20             0      -12.6132       -12.004            10             0          2          0          0          0          0        0.5          0          0  #  SizeSel_P2_Triennial(8)
             1            10         1.001       1.92642            10             0          2          0          0          0          0        0.5          2          2  #  SizeSel_P3_Triennial(8)
           -20             3      -8.21933      -4.99989            10             0          2          0          0          0          0        0.5          2          2  #  SizeSel_P4_Triennial(8)
          -999             1          -999          -999            10             0         -4          0          0          0          0        0.5          0          0  #  SizeSel_P5_Triennial(8)
            -5             5      -1.15194     -0.913258            10             0          2          0          0          0          0        0.5          2          2  #  SizeSel_P6_Triennial(8)
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_CDFWEarlyOB(9)
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_CDFWEarlyOB(9)
            16            60       45.4018       43.8236            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_NWFSCHook(10)
            -5             5      -1.65371      -1.42363            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_NWFSCHook(10)
            -1            10       4.74483       4.66827            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_NWFSCHook(10)
            -1             9       4.45167       4.31619            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_NWFSCHook(10)
           -15            -5      -12.0985      -12.0962            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P5_NWFSCHook(10)
            -5             5      -2.11181      -2.34605            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_NWFSCHook(10)
            13            60        25.068       23.1912            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P1_NWFSCTrawl(11)
           -20             0      -11.7155      -11.5426            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P2_NWFSCTrawl(11)
            -5            15      -1.46617      -4.71677            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P3_NWFSCTrawl(11)
            -1             9       6.27009       6.55647            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P4_NWFSCTrawl(11)
           -15             5      0.555824      0.377822            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P5_NWFSCTrawl(11)
            -5             5      -2.75597      -2.93515            10             0          3          0          0          0          0        0.5          0          0  #  SizeSel_P6_NWFSCTrawl(11)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_Free1(15)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_Free1(15)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_MirrorRecS(16)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_MirrorRecS(16)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecSouthOB(17)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecSouthOB(17)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecCentralOB(18)
            -1            20            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecCentralOB(18)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_TrawlSouth(1)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_TrawlSouth(1)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_HL(2)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_HL(2)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_Setnet(3)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_Setnet(3)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_RecSouth(4)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_RecSouth(4)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_RecCentral(5)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_RecCentral(5)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_TrawlNorth(6)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_TrawlNorth(6)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_CalCOFI(7)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_CalCOFI(7)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_Triennial(8)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_Triennial(8)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_CDFWEarlyOB(9)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_CDFWEarlyOB(9)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_NWFSCHook(10)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_NWFSCHook(10)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_NWFSCTrawl(11)
             0            41            34            34            99             6         -1          0          0          0          0        0.5          0          0  #  AgeSel_P2_NWFSCTrawl(11)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P1_Juvenile(12)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P2_Juvenile(12)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P1_Rec2013(13)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P2_Rec2013(13)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P1_PPIndex(14)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P2_PPIndex(14)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P1_Free1(15)
             0            41            40            40            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P2_Free1(15)
             0            41             0             0            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P1_MirrorRecS(16)
             0            41            40            40            99             0         -1          0          0          0          0        0.5          0          0  #  AgeSel_P2_MirrorRecS(16)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_RecSouthOB(17)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_RecSouthOB(17)
             0            41           0.1           0.1            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P1_RecCentralOB(18)
             0            41            34            34            99             0         -2          0          0          0          0        0.5          0          0  #  AgeSel_P2_RecCentralOB(18)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            16            70       62.5426       57.2955            10             0      2  # SizeSel_P1_TrawlSouth(1)_BLK1repl_2003
             1            10       5.42264       5.78733            10             0      4  # SizeSel_P3_TrawlSouth(1)_BLK1repl_2003
            -1             9       4.13706       4.07747            10             0      4  # SizeSel_P4_TrawlSouth(1)_BLK1repl_2003
            -5             5      0.214865     0.0218787            10             0      4  # SizeSel_P6_TrawlSouth(1)_BLK1repl_2003
            16            60       39.0354       37.5583            10             0      2  # SizeSel_P1_RecSouth(4)_BLK1repl_2003
             1            15       4.86313       4.22662            10             0      4  # SizeSel_P3_RecSouth(4)_BLK1repl_2003
            -5             5             5       4.80844            10             0      4  # SizeSel_P4_RecSouth(4)_BLK1repl_2003
           -10            10       -3.7009      -4.06332            10             0      4  # SizeSel_P6_RecSouth(4)_BLK1repl_2003
            16            60       43.3456       43.4264            10             0      2  # SizeSel_P1_RecCentral(5)_BLK1repl_2003
             1            10       4.85804       4.60145            10             0      4  # SizeSel_P3_RecCentral(5)_BLK1repl_2003
            -1             9       4.53077       4.86781            10             0      4  # SizeSel_P4_RecCentral(5)_BLK1repl_2003
            -5             5      -0.72839      -1.24814            10             0      4  # SizeSel_P6_RecCentral(5)_BLK1repl_2003
            16            60        46.353        44.323            10             0      2  # SizeSel_P1_TrawlNorth(6)_BLK1repl_2003
             1            15       5.06925       4.66351            10             0      4  # SizeSel_P3_TrawlNorth(6)_BLK1repl_2003
            -5             5      0.140671    -0.0248232            10             0      4  # SizeSel_P4_TrawlNorth(6)_BLK1repl_2003
           -10            10       8.08677       8.38712            10             0      4  # SizeSel_P6_TrawlNorth(6)_BLK1repl_2003
            16            60        16.001       22.9248            10             0      2  # SizeSel_P1_Triennial(8)_BLK2repl_1995
             1            15         1.001       1.34611            10             0      4  # SizeSel_P3_Triennial(8)_BLK2repl_1995
           -15             5      -7.85619      -7.36054            10             0      4  # SizeSel_P4_Triennial(8)_BLK2repl_1995
           -10            10      -2.10594      -1.94337            10             0      4  # SizeSel_P6_Triennial(8)_BLK2repl_1995
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
#      5     1     1     1     2     2     0     0     0     0     0     0
#      5     3     2     1     2     2     0     0     0     0     0     0
#      5     4     3     1     2     2     0     0     0     0     0     0
#      5     6     4     1     2     2     0     0     0     0     0     0
#      5    19     5     1     2     2     0     0     0     0     0     0
#      5    21     6     1     2     2     0     0     0     0     0     0
#      5    22     7     1     2     2     0     0     0     0     0     0
#      5    24     8     1     2     2     0     0     0     0     0     0
#      5    25     9     1     2     2     0     0     0     0     0     0
#      5    27    10     1     2     2     0     0     0     0     0     0
#      5    28    11     1     2     2     0     0     0     0     0     0
#      5    30    12     1     2     2     0     0     0     0     0     0
#      5    31    13     1     2     2     0     0     0     0     0     0
#      5    33    14     1     2     2     0     0     0     0     0     0
#      5    34    15     1     2     2     0     0     0     0     0     0
#      5    36    16     1     2     2     0     0     0     0     0     0
#      5    37    17     2     2     2     0     0     0     0     0     0
#      5    39    18     2     2     2     0     0     0     0     0     0
#      5    40    19     2     2     2     0     0     0     0     0     0
#      5    42    20     2     2     2     0     0     0     0     0     0
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
      4      1    0.0827
      5      1    0.2241
      4      2    0.1265
      5      2    0.3322
      4      3    0.0398
      5      3    0.6781
      4      4    0.1332
      4      5    0.1056
      4      6     0.111
      5      6    0.2477
      4      8    0.1372
      4      9    0.0699
      4     10    0.0861
      4     11     0.091
      5     11    0.2214
      4     15    0.2125
      4     16    0.1474
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 54 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 1 1 1 1 1
 1 2 1 1 1
 1 3 1 1 1
 1 4 1 1 1
 1 5 1 1 1
 1 6 1 1 1
 1 7 1 1 1
 1 8 1 1 1
 1 9 1 1 1
 1 10 1 1 1
 1 11 1 1 1
 1 12 1 1 1
 1 13 1 0 1
 1 14 1 1 1
 1 15 1 1 1
 1 16 1 1 1
 1 17 1 1 1
 1 18 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 4 5 1 1 1
 4 6 1 1 1
 4 7 1 1 1
 4 8 1 1 1
 4 9 1 1 1
 4 10 1 1 1
 4 11 1 1 1
 4 12 1 1 1
 4 13 1 1 1
 4 14 1 1 1
 4 15 1 0 1
 4 16 1 1 1
 4 17 1 0 1
 4 18 1 0 1
 5 1 1 1 1
 5 2 1 1 1
 5 3 1 1 1
 5 4 1 1 1
 5 5 1 1 1
 5 6 1 1 1
 5 7 1 1 1
 5 8 1 1 1
 5 9 1 1 1
 5 10 1 1 1
 5 11 1 1 1
 5 12 1 1 1
 5 13 1 1 1
 5 14 1 1 1
 5 15 1 0 1
 5 16 1 1 1
 5 17 1 0 1
 5 18 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 1 1 1 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  1 1 1 1 #_CPUE/survey:_4
#  1 1 1 1 #_CPUE/survey:_5
#  0 0 0 0 #_CPUE/survey:_6
#  1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 #_CPUE/survey:_11
#  1 1 1 1 #_CPUE/survey:_12
#  0 0 0 0 #_CPUE/survey:_13
#  1 1 1 1 #_CPUE/survey:_14
#  0 0 0 0 #_CPUE/survey:_15
#  0 0 0 0 #_CPUE/survey:_16
#  1 1 1 1 #_CPUE/survey:_17
#  1 1 1 1 #_CPUE/survey:_18
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  0 0 0 0 #_lencomp:_7
#  1 1 1 1 #_lencomp:_8
#  1 1 1 1 #_lencomp:_9
#  1 1 1 1 #_lencomp:_10
#  1 1 1 1 #_lencomp:_11
#  0 0 0 0 #_lencomp:_12
#  0 0 0 0 #_lencomp:_13
#  0 0 0 0 #_lencomp:_14
#  0 0 0 0 #_lencomp:_15
#  1 1 1 1 #_lencomp:_16
#  0 0 0 0 #_lencomp:_17
#  0 0 0 0 #_lencomp:_18
#  1 1 1 1 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  1 1 1 1 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  0 0 0 0 #_agecomp:_5
#  1 1 1 1 #_agecomp:_6
#  0 0 0 0 #_agecomp:_7
#  0 0 0 0 #_agecomp:_8
#  0 0 0 0 #_agecomp:_9
#  0 0 0 0 #_agecomp:_10
#  1 1 1 1 #_agecomp:_11
#  0 0 0 0 #_agecomp:_12
#  0 0 0 0 #_agecomp:_13
#  0 0 0 0 #_agecomp:_14
#  0 0 0 0 #_agecomp:_15
#  0 0 0 0 #_agecomp:_16
#  0 0 0 0 #_agecomp:_17
#  0 0 0 0 #_agecomp:_18
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

