#V3.30.18.00;_safe;_compile_date:_Sep 30 2021;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: boc1.dat // boc1.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
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
3 #_Nblock_Patterns
 1 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 2003 2014
 1995 2014
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
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0.5 #_Age(post-settlement)_for_L1;linear growth below this
25 #_Growth_Age_for_L2 (999 to use as Linf)
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
 0.05 0.4 0.167 -2.05066 0.516638 3 2 0 0 0 0 0.5 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 1 45 17.6556 17.7256 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 60 80 67.1193 67.8153 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.25 0.25 0.219878 99 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.05 0.25 0.123703 0.116225 99 0 6 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.05 0.25 0.051 0.0741631 99 0 6 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 7.355e-06 7.36e-06 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Fem_GP_1
 -3 4 3.11359 3.11359 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 30 60 37.7 37.7 99 0 -3 0 0 0 0 0.5 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.33397 -0.33397 99 0 -3 0 0 0 0 0.5 0 0 # Mat_slope_Fem_GP_1
 -3 300 254.9 254.9 99 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 30 20 20 99 0 -3 0 0 0 0 0.5 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Sex: 2  BioPattern: 1  NatMort
 -0.5 0.5 0 0 99 0 -2 0 0 0 0 0.5 0 0 # NatM_uniform_Mal_GP_1
# Sex: 2  BioPattern: 1  Growth
 -1 1 0 0 99 0 -2 0 0 0 0 0.5 0 0 # L_at_Amin_Mal_GP_1
 -1 1 -0.0494969 -0.0767574 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -1 1 0.0826601 0.0575865 99 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -1 1 -0.0755577 -0.067776 99 0 6 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -1 1 -0.00203877 0.0729374 99 0 6 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
# Sex: 2  BioPattern: 1  WtLen
 -3 3 7.355e-06 7.36e-06 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_1_Mal_GP_1
 -3 4 3.11359 3.11359 99 0 -3 0 0 0 0 0.5 0 0 # Wtlen_2_Mal_GP_1
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
             6            15       8.56447           8.6            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
          0.21          0.99         0.773         0.773         0.147             2         -2          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             1            99             0         -4          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          0          0          0 # SR_regime
             0           0.5             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1964 # first year of main recr_devs; early devs can preceed this era
2013 # last year of main recr_devs; forecast devs start in following year
4 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1954 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 5 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1970.78 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1971.86 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2013.85 #_last_yr_fullbias_adj_in_MPD
 2014.97 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.9197 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 1 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# Specified recr devs to read
#_Yr Input_value # Final_value
 1964 2 # 2
#
# all recruitment deviations
#  1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F
#  0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.2 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
2.9 # max F (methods 2-4) or harvest fraction (method 1)
5  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 1
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0.0001 0.05 0.0123077 0.007 99 0 1 # InitF_seas_1_flt_2HL
#
# F rates by fleet x season
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# TrawlSouth 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00344318 0.00542151 0.00618811 0.00424949 0.0043741 0.00363875 0.00318377 0.00355119 0.00238483 0.00192639 0.0053901 0.0072447 0.00984067 0.0078266 0.00891799 0.00300855 0.00454635 0.00589546 0.00715474 0.00594729 0.00709953 0.00606672 0.00503994 0.00328119 0.00298162 0.0021138 0.000511316 0.000486575 0.000189797 0.00362012 0.00742348 0.000372712 0.00549963 0.00633516 0.0207115 0.0536358 0.0956257 0.128599 0.129241 0.152565 0.190429 0.233835 0.285294 0.255833 0.220102 0.163631 0.140935 0.159276 0.112675 0.10529 0.160461 0.204371 0.109753 0.0731729 0.100556 0.0808015 0.153655 0.541254 1.29258 1.89583 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9
# HL 0.00595925 0.00559866 0.00524268 0.00489223 0.00460464 0.00432075 0.00403951 0.00375994 0.00415202 0.00454472 0.00493875 0.00533471 0.00573208 0.00612609 0.00652238 0.00692032 0.0073203 0.0082477 0.00918229 0.010125 0.0110766 0.0120377 0.0130087 0.0139899 0.0149186 0.0237631 0.0255118 0.0170003 0.0177791 0.0150046 0.0135672 0.0160464 0.0149823 0.0175628 0.0233012 0.0185795 0.0181199 0.0166183 0.0208497 0.0219927 0.016419 0.0097926 0.0120118 0.0139941 0.0179746 0.015536 0.0112348 0.00758313 0.00899685 0.00703182 0.00268424 0.00260247 0.00309497 0.00478618 0.00469506 0.00768108 0.00585729 0.00691496 0.0129734 0.0106624 0.00763895 0.00311467 0.00419258 0.00621986 0.0167803 0.0171435 0.0152906 0.0100042 0.00793766 0.0071092 0.00596311 0.00735835 0.00597902 0.00664463 0.00908475 0.00629688 0.00369665 0.00341088 0.00371511 0.00396069 0.00658568 0.0101939 0.0184667 0.043882 0.556776 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 0 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9
# Setnet 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000937681 0.000910662 0.00406895 0.00563039 0.0171484 0.0478528 0.144179 0.635961 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 0 2.9 2.9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00011438 0.000230006 0.00034646 0.000463763 0.000580165 0.000694137 0.000808288 0.000923609 0.000924933 0.0015953 0.00128549 0.00113402 0.000809736 0.000745132 0.000393464 0.000373713 0.000307684 0.000416801 0.000727957 0.00219501 0.00602606 0.00787362 0.00939987 0.00834788 0.00967864 0.0114518 0.0289288 0.057157 0.0754134 0.0480835 0.0299293 0.0188333 0.0201653 0.0230137 0.0217306 0.0204001 0.0250873 0.0242495 0.0281163 0.0363456 0.0437165 0.0458183 0.0671285 0.0686588 0.103176 0.1536 0.343826 0.826729 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9
# RecCentral 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9.62794e-05 0.000193642 0.000223652 0.000299312 0.000374942 0.000449227 0.000522637 0.000597214 0.000673017 0.000799271 0.000785882 0.000684891 0.0009824 0.000903798 0.000476381 0.00045255 0.000372258 0.000504686 0.000883262 0.000704311 0.00141224 0.00183885 0.00226679 0.00274361 0.00247993 0.0022144 0.00290677 0.00370922 0.00455249 0.00503686 0.00903005 0.00820273 0.00681498 0.00583323 0.00677641 0.00743029 0.00619829 0.00782095 0.00627589 0.00480482 0.00443151 0.00499617 0.00580983 0.00561227 0.0072531 0.0137068 0.0250852 0.0604063 0.508819 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9
# TrawlNorth 6.75885e-06 6.72831e-06 6.69984e-06 5.1923e-06 4.80704e-06 4.79426e-06 4.78232e-06 4.77093e-06 4.76118e-06 4.75407e-06 4.74932e-06 4.7466e-06 5.11069e-06 5.11129e-06 5.11329e-06 5.11653e-06 5.12085e-06 5.1271e-06 5.13607e-06 5.51514e-06 5.52966e-06 5.54621e-06 5.56457e-06 5.58456e-06 1.15938e-05 1.77348e-05 3.36272e-05 1.23334e-05 1.47037e-05 1.90036e-05 1.59025e-05 9.31203e-06 1.66962e-05 4.04146e-05 3.82475e-05 6.55438e-05 5.5577e-05 0.00111902 0.000672886 0.00198934 0.00149895 0.00237444 0.001656 0.00172654 0.00071501 0.00165389 0.00190826 0.00343848 0.002402 0.00214396 0.00108772 0.00790623 0.0251784 0.0486605 0.0251308 0.0260027 0.0165468 0.015896 0.015803 0.0229547 0.0121753 0.0146682 0.0126169 0.0183283 0.0222988 0.0323217 0.0367294 0.0322372 0.0317282 0.02516 0.0218751 0.0302756 0.0176856 0.0241397 0.0167268 0.0158488 0.0174777 0.0105418 0.0126107 0.0182212 0.0225825 0.0475467 0.0643443 0.176272 1.97258 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9 2.9
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
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
           -15            15       15.2723             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TrawlSouth(1)
        0.0001             1     0.0932993          0.04            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_TrawlSouth(1)
           -15            15       7.37315             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecSouth(4)
        0.0001             1      0.349981          0.49            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecSouth(4)
           -15            15       8.76858             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecCentral(5)
        0.0001             1       0.38126          0.66            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_RecCentral(5)
           -15            15       -6.5166             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CalCOFI(7)
        0.0001             1        0.0011          0.16            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_CalCOFI(7)
           -15            15       17.4441             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial(8)
           -15            15       9.33548             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CDFWEarlyOB(9)
        0.0001             1      0.223476          0.25            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_CDFWEarlyOB(9)
           -15            15       9.57001             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCHook(10)
        0.0001             1      0.186669          0.22            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCHook(10)
           -15            15        17.989             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCTrawl(11)
        0.0001             1        0.0011          0.02            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCTrawl(11)
           -15            15       7.86382             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Juvenile(12)
        0.0001             1      0.356233          0.39            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_Juvenile(12)
           -15            15       16.8903             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Rec2013(13)
           -15            15      0.470957             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_PPIndex(14)
        0.0001             1      0.399146          0.38            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_PPIndex(14)
           -15            15       8.73724             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecSouthOB(17)
        0.0001             1      0.260967          0.44            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecSouthOB(17)
           -15            15       8.23065             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecCentralOB(18)
        0.0001             1      0.249501          0.23            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecCentralOB(18)
#_no timevary Q parameters
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
# 1   TrawlSouth LenSelex
            16            60       44.3593       43.7321            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_TrawlSouth(1)
           -20             1      -12.3642      -11.8577            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TrawlSouth(1)
             1            10       4.39009       4.42101            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_TrawlSouth(1)
            -1             9       4.25705       4.59596            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_TrawlSouth(1)
           -30             0      -16.4974      -16.2796            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TrawlSouth(1)
            -5             5      -1.56612      -1.51897            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_TrawlSouth(1)
# 2   HL LenSelex
            16            60       53.7472       50.2935            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_HL(2)
           -20             0      -10.9424      -11.1769            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_HL(2)
             1            12       4.88433       4.85455            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_HL(2)
            -1             9       4.12087       4.09085            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_HL(2)
           -15             0      -7.55705      -7.65174            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_HL(2)
            -5             5     -0.495033     -0.891802            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_HL(2)
# 3   Setnet LenSelex
            16            60       49.7496       47.7691            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Setnet(3)
           -20             0      -12.4118      -12.0492            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Setnet(3)
             1            10       3.68158       3.62227            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Setnet(3)
            -1             9       4.02836       4.00071            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Setnet(3)
           -10             3      -6.69588      -6.40904            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Setnet(3)
            -5             5      -1.53115      -1.92151            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Setnet(3)
# 4   RecSouth LenSelex
            16            60       38.0507       37.8456            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_RecSouth(4)
           -20             0      -11.0133      -4.03328            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(4)
             1            10       4.71643       4.63756            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_RecSouth(4)
            -1             9        5.9182       5.56413            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_RecSouth(4)
           -10             2      -7.63183       -6.9658            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(4)
           -10             9       -3.8421       -3.8711            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_RecSouth(4)
# 5   RecCentral LenSelex
            16            60       48.5617         47.65            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_RecCentral(5)
           -20             0      -10.9884      -11.3327            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecCentral(5)
             1            10       5.38514       5.55578            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_RecCentral(5)
            -1             9       3.63676       3.88992            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_RecCentral(5)
           -10             2      -5.37026      -5.46783            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecCentral(5)
           -10             9    -0.0837852     0.0533028            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_RecCentral(5)
# 6   TrawlNorth LenSelex
            16            60       45.1635       45.9359            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_TrawlNorth(6)
            -5             5      -1.19244     -0.853133            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TrawlNorth(6)
             1            15         1.001        3.8369            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_TrawlNorth(6)
            -5             5       3.04679        2.9507            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_TrawlNorth(6)
           -15             0      -8.83196      -9.40927            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TrawlNorth(6)
           -10            10       0.16747     0.0689498            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_TrawlNorth(6)
# 7   CalCOFI LenSelex
# 8   Triennial LenSelex
            16            60       26.5363       28.0443            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_peak_Triennial(8)
           -20             0      -12.6132       -12.004            10             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Triennial(8)
             1            10         1.001       1.92642            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_ascend_se_Triennial(8)
           -20             3      -8.21933      -4.99989            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_descend_se_Triennial(8)
          -999             1          -999          -999            10             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Triennial(8)
            -5             5      -1.15194     -0.913258            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_end_logit_Triennial(8)
# 9   CDFWEarlyOB LenSelex
            -1            10            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_CDFWEarlyOB(9)
            -1            10            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_CDFWEarlyOB(9)
# 10   NWFSCHook LenSelex
            16            60       45.4018       43.8236            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSCHook(10)
            -5             5      -1.65371      -1.42363            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSCHook(10)
            -1            10       4.74483       4.66827            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSCHook(10)
            -1             9       4.45167       4.31619            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSCHook(10)
           -15            -5      -12.0985      -12.0962            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSCHook(10)
            -5             5      -2.11181      -2.34605            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSCHook(10)
# 11   NWFSCTrawl LenSelex
            13            60        25.068       23.1912            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSCTrawl(11)
           -20             0      -11.7155      -11.5426            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSCTrawl(11)
            -5            15      -1.46617      -4.71677            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSCTrawl(11)
            -1             9       6.27009       6.55647            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSCTrawl(11)
           -15             5      0.555824      0.377822            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSCTrawl(11)
            -5             5      -2.75597      -2.93515            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSCTrawl(11)
# 12   Juvenile LenSelex
# 13   Rec2013 LenSelex
# 14   PPIndex LenSelex
# 15   Free1 LenSelex
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_Free1(15)
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_Free1(15)
# 16   MirrorRecS LenSelex
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_MirrorRecS(16)
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_MirrorRecS(16)
# 17   RecSouthOB LenSelex
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecSouthOB(17)
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecSouthOB(17)
# 18   RecCentralOB LenSelex
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecCentralOB(18)
            -1            20            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecCentralOB(18)
# 1   TrawlSouth AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_TrawlSouth(1)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_TrawlSouth(1)
# 2   HL AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_HL(2)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_HL(2)
# 3   Setnet AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Setnet(3)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Setnet(3)
# 4   RecSouth AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_RecSouth(4)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_RecSouth(4)
# 5   RecCentral AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_RecCentral(5)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_RecCentral(5)
# 6   TrawlNorth AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_TrawlNorth(6)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_TrawlNorth(6)
# 7   CalCOFI AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_CalCOFI(7)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_CalCOFI(7)
# 8   Triennial AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Triennial(8)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Triennial(8)
# 9   CDFWEarlyOB AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_CDFWEarlyOB(9)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_CDFWEarlyOB(9)
# 10   NWFSCHook AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWFSCHook(10)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWFSCHook(10)
# 11   NWFSCTrawl AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_NWFSCTrawl(11)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_NWFSCTrawl(11)
# 12   Juvenile AgeSelex
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Juvenile(12)
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Juvenile(12)
# 13   Rec2013 AgeSelex
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Rec2013(13)
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Rec2013(13)
# 14   PPIndex AgeSelex
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_PPIndex(14)
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_PPIndex(14)
# 15   Free1 AgeSelex
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_Free1(15)
             0            41            21            40            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_Free1(15)
# 16   MirrorRecS AgeSelex
             0            41             0             0            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_MirrorRecS(16)
             0            41            21            40            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_MirrorRecS(16)
# 17   RecSouthOB AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_RecSouthOB(17)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_RecSouthOB(17)
# 18   RecCentralOB AgeSelex
             0            41             0           0.1            99             0        -99          0          0          0          0        0.5          0          0  #  minage@sel=1_RecCentralOB(18)
             0            41            21            34            99             0        -99          0          0          0          0        0.5          0          0  #  maxage@sel=1_RecCentralOB(18)
#_No_Dirichlet parameters
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            16            70       62.5426       57.2955            10             0      2  # Size_DblN_peak_TrawlSouth(1)_BLK1repl_2003
             1            10       5.42264       5.78733            10             0      4  # Size_DblN_ascend_se_TrawlSouth(1)_BLK1repl_2003
            -1             9       4.13706       4.07747            10             0      4  # Size_DblN_descend_se_TrawlSouth(1)_BLK1repl_2003
            -5             5      0.214865     0.0218787            10             0      4  # Size_DblN_end_logit_TrawlSouth(1)_BLK1repl_2003
            16            60       39.0354       37.5583            10             0      2  # Size_DblN_peak_RecSouth(4)_BLK1repl_2003
             1            15       4.86313       4.22662            10             0      4  # Size_DblN_ascend_se_RecSouth(4)_BLK1repl_2003
            -5             5             5       4.80844            10             0      4  # Size_DblN_descend_se_RecSouth(4)_BLK1repl_2003
           -10            10       -3.7009      -4.06332            10             0      4  # Size_DblN_end_logit_RecSouth(4)_BLK1repl_2003
            16            60       43.3456       43.4264            10             0      2  # Size_DblN_peak_RecCentral(5)_BLK1repl_2003
             1            10       4.85804       4.60145            10             0      4  # Size_DblN_ascend_se_RecCentral(5)_BLK1repl_2003
            -1             9       4.53077       4.86781            10             0      4  # Size_DblN_descend_se_RecCentral(5)_BLK1repl_2003
            -5             5      -0.72839      -1.24814            10             0      4  # Size_DblN_end_logit_RecCentral(5)_BLK1repl_2003
            16            60        46.353        44.323            10             0      2  # Size_DblN_peak_TrawlNorth(6)_BLK1repl_2003
             1            15       5.06925       4.66351            10             0      4  # Size_DblN_ascend_se_TrawlNorth(6)_BLK1repl_2003
            -5             5      0.140671    -0.0248232            10             0      4  # Size_DblN_descend_se_TrawlNorth(6)_BLK1repl_2003
           -10            10       8.08677       8.38712            10             0      4  # Size_DblN_end_logit_TrawlNorth(6)_BLK1repl_2003
            16            60        16.001       22.9248            10             0      2  # Size_DblN_peak_Triennial(8)_BLK2repl_1995
             1            15         1.001       1.34611            10             0      4  # Size_DblN_ascend_se_Triennial(8)_BLK2repl_1995
           -15             5      -7.85619      -7.36054            10             0      4  # Size_DblN_descend_se_Triennial(8)_BLK2repl_1995
           -10            10      -2.10594      -1.94337            10             0      4  # Size_DblN_end_logit_Triennial(8)_BLK2repl_1995
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
#      5     1     1     1     2     0     0     0     0     0     0     0
#      5     3     2     1     2     0     0     0     0     0     0     0
#      5     4     3     1     2     0     0     0     0     0     0     0
#      5     6     4     1     2     0     0     0     0     0     0     0
#      5    19     5     1     2     0     0     0     0     0     0     0
#      5    21     6     1     2     0     0     0     0     0     0     0
#      5    22     7     1     2     0     0     0     0     0     0     0
#      5    24     8     1     2     0     0     0     0     0     0     0
#      5    25     9     1     2     0     0     0     0     0     0     0
#      5    27    10     1     2     0     0     0     0     0     0     0
#      5    28    11     1     2     0     0     0     0     0     0     0
#      5    30    12     1     2     0     0     0     0     0     0     0
#      5    31    13     1     2     0     0     0     0     0     0     0
#      5    33    14     1     2     0     0     0     0     0     0     0
#      5    34    15     1     2     0     0     0     0     0     0     0
#      5    36    16     1     2     0     0     0     0     0     0     0
#      5    37    17     2     2     0     0     0     0     0     0     0
#      5    39    18     2     2     0     0     0     0     0     0     0
#      5    40    19     2     2     0     0     0     0     0     0     0
#      5    42    20     2     2     0     0     0     0     0     0     0
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
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
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
#  1 1 1 1 #_init_equ_catch13
#  1 1 1 1 #_init_equ_catch14
#  1 1 1 1 #_init_equ_catch15
#  1 1 1 1 #_init_equ_catch16
#  1 1 1 1 #_init_equ_catch17
#  1 1 1 1 #_init_equ_catch18
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

