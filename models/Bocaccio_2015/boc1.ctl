#V3.30.19.00;_safe;_compile_date:_Apr  4 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#_data_and_control_files: boc1.dat // boc1.ctl
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
 0.05 0.4 0.178828 -2.05066 0.516638 3 2 0 0 0 0 0.5 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 1 45 18.3957 17.7256 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amin_Fem_GP_1
 60 80 67.3189 67.8153 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.25 0.225911 0.219878 99 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Fem_GP_1
 0.05 0.25 0.117556 0.116225 99 0 6 0 0 0 0 0.5 0 0 # CV_young_Fem_GP_1
 0.05 0.25 0.0777446 0.0741631 99 0 6 0 0 0 0 0.5 0 0 # CV_old_Fem_GP_1
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
 -1 1 -0.0837913 -0.0767574 99 0 2 0 0 0 0 0.5 0 0 # L_at_Amax_Mal_GP_1
 -1 1 0.0838019 0.0575865 99 0 2 0 0 0 0 0.5 0 0 # VonBert_K_Mal_GP_1
 -1 1 -0.0744291 -0.067776 99 0 6 0 0 0 0 0.5 0 0 # CV_young_Mal_GP_1
 -1 1 0.00339234 0.0729374 99 0 6 0 0 0 0 0.5 0 0 # CV_old_Mal_GP_1
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
             6            15       8.76627           8.6            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
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
 2014.97 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
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
 1964 2 # 0.564433
#
# all recruitment deviations
#  1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964R 1965R 1966R 1967R 1968R 1969R 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014F 2015F 2016F 2017F 2018F 2019F 2020F 2021F 2022F 2023F 2024F
#  0.0468571 -0.1117 -0.10892 0.153868 0.438936 0.554555 0.555388 0.494329 0.637099 0.586546 0.564433 2.11994 0.417988 0.459186 0.672771 0.858345 0.909962 0.0844304 1.20676 1.57805 1.34144 0.605486 -0.974232 2.12856 1.78434 0.281572 -0.102348 -0.860074 -1.68948 -1.31721 1.39054 0.0826847 -0.63038 -0.416076 1.02681 -0.339344 -0.448697 -0.078775 -0.340408 -0.738918 -0.603789 -1.01969 -1.07464 -0.794374 -1.62112 1.16356 -0.64886 -1.06086 -1.23218 -0.0468604 -0.978609 -0.532788 -1.01547 -1.06971 -1.26333 -0.515154 0.50089 0.456376 -0.00483156 1.78407 -0.410517 0 0 0 0 0 0 0 0 0 0
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
 0.0001 0.05 0.00586508 0.007 99 0 1 # InitF_seas_1_flt_2HL
#
# F rates by fleet x season
# Yr:  1892 1893 1894 1895 1896 1897 1898 1899 1900 1901 1902 1903 1904 1905 1906 1907 1908 1909 1910 1911 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# TrawlSouth 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00291072 0.004586 0.00524037 0.00360255 0.00371032 0.00308739 0.00270114 0.00301232 0.00202279 0.001634 0.00457325 0.00614893 0.00835252 0.00664264 0.00756969 0.00255496 0.00386307 0.00500842 0.00607376 0.00504568 0.00602197 0.00514619 0.00427506 0.00278234 0.00252716 0.00179076 0.0004329 0.00041159 0.000160438 0.00306043 0.00628464 0.000315928 0.00466622 0.00537503 0.0175647 0.0454328 0.0808157 0.108301 0.108515 0.127764 0.158677 0.195755 0.242901 0.215063 0.169805 0.110295 0.0835345 0.0852389 0.0554295 0.0518233 0.118593 0.151758 0.0605307 0.0330519 0.0408722 0.0302653 0.0522538 0.156382 0.240345 0.143432 0.147384 0.108187 0.0965958 0.160883 0.123781 0.0696192 0.108887 0.121157 0.131129 0.0685759 0.0955488 0.0676012 0.0647289 0.077025 0.0981127 0.0644277 0.049636 0.0558176 0.0650308 0.0405012 0.0456345 0.0297235 0.00968767 0.0047128 0.0033756 0.00172257 0.00394246 0.000562866 0.00139581 0.00237468 0.00150468 0.00049679 0.00072598 0.00195285 0.00131182 0.000835101 0.00123405 0.00149692 0.000390128 0.00241488 0.00204773 0.000557824 0.000484179 0.000439992 0.000412309 0.000393681 0.000380134 0.000369645 0.000361161
# HL 0.00640583 0.00604737 0.00568749 0.00532684 0.00502873 0.00473017 0.00443118 0.00413152 0.00456905 0.00500761 0.00544789 0.00589047 0.00633467 0.00677517 0.00721816 0.0076629 0.00810981 0.00914117 0.0101809 0.0112299 0.012289 0.0133586 0.0144393 0.0155313 0.0165658 0.026393 0.0283403 0.0188827 0.0197405 0.0166537 0.0150531 0.0177999 0.0166173 0.0194776 0.025844 0.0206095 0.0200986 0.0184281 0.0231121 0.024369 0.0181862 0.0108432 0.0132972 0.0154889 0.019893 0.0171933 0.012431 0.00838806 0.00994919 0.00777513 0.00296776 0.0028773 0.00342137 0.00528831 0.00518348 0.00847355 0.00645857 0.00762459 0.0143092 0.0117659 0.00842958 0.00343273 0.00460548 0.00680388 0.0182532 0.0185429 0.0165232 0.0106742 0.00797581 0.00636199 0.00465613 0.00507407 0.00372078 0.00384956 0.00567678 0.00446445 0.00243366 0.00202036 0.00204033 0.00202648 0.00306992 0.00402672 0.00503098 0.00546829 0.00787613 0.00700795 0.00988 0.0147099 0.0129387 0.0106204 0.0147852 0.0123501 0.0293877 0.013345 0.0279102 0.0292286 0.0489817 0.0409741 0.0568302 0.0313934 0.0557588 0.0557718 0.0288511 0.0100406 0.0142085 0.00932652 0.00710508 0.00375557 0.00129365 0.00130848 1.72464e-05 0 0.000198102 0.000166704 0.00115549 0.0012939 0.000470813 0.000343057 0.000239651 0.000361375 0.000490335 0.000485243 0.000628493 0.000844116 0.000668078 0.000185456 0.000171785 0.000166505 0.000163493 0.0001608 0.000158132 0.000155587 0.00015326
# Setnet 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000563354 0.000486529 0.00201334 0.00252106 0.00632005 0.0117609 0.0149595 0.00654942 0.00830342 0.00702235 0.0151255 0.0122033 0.0166445 0.0189873 0.0426546 0.0620208 0.137643 0.185807 0.141461 0.0471055 0.140852 0.136126 0.0764158 0.0998595 0.0747805 0.0508428 0.0585676 0.020323 0.00825678 0.00992284 0.00194532 0.000199062 0.000244153 1.86261e-06 0 3.00302e-05 2.70716e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000119938 0.0002411 0.000363083 0.00048599 0.00060792 0.00072703 0.000846169 0.000966631 0.000967999 0.00166963 0.00134519 0.00118629 0.000846831 0.000779144 0.000411345 0.000390624 0.000321568 0.000435549 0.000760575 0.0022928 0.00629386 0.00822209 0.0098145 0.00870938 0.0100759 0.0118762 0.0298623 0.0586311 0.0769989 0.0495057 0.0307812 0.0182153 0.017143 0.0169498 0.0142824 0.0122538 0.0140241 0.0168159 0.0242949 0.0250844 0.0250666 0.0240332 0.0330064 0.0311417 0.0431455 0.0553911 0.0781227 0.0795666 0.0652433 0.062267 0.0607953 0.0741631 0.0365403 0.0392233 0.0657586 0.0197558 0.0197768 0.04194 0.0480539 0.00980755 0.0127526 0.0241826 0.0206217 0.0212326 0.0234572 0.0193326 0.0462522 0.00699459 0.0150438 0.0175409 0.00887829 0.0223103 0.0141335 0.0106109 0.0124131 0.00246006 0.0149151 0.0503996 0.0145235 0.0235575 0.0156982 0.0183789 0.0192906 0.0342749 0.0289074 0.0230775 0.0129645 0.0261933 0.024449 0.00847138 0.00898985 0.00926609 0.00934165 0.00931866 0.00925936 0.00919206 0.00912807
# RecCentral 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.55503e-05 0.000172056 0.000198721 0.000265993 0.000333316 0.000399384 0.000464532 0.000530637 0.000597842 0.000709906 0.000697942 0.000608142 0.000872099 0.000802107 0.000422639 0.000401295 0.000329895 0.000447026 0.000782493 0.000624271 0.00125256 0.00163135 0.00201072 0.00243171 0.00219413 0.00195358 0.00255591 0.00324908 0.00397032 0.00439619 0.00790862 0.00704517 0.00547034 0.00421516 0.00439021 0.00435332 0.00332895 0.00428046 0.00416582 0.00322084 0.00256883 0.00253017 0.00264932 0.00232961 0.0027344 0.00438182 0.00532096 0.00574316 0.00641011 0.00613006 0.00659708 0.00753357 0.00957576 0.00690061 0.0126267 0.0132395 0.00380176 0.00479856 0.0131419 0.0079183 0.00348044 0.00717418 0.00638265 0.00648586 0.00680472 0.0074431 0.00812063 0.000425219 0.0043635 0.0159158 0.00389679 0.00942682 0.0113555 0.00687596 0.000962212 2.42045e-06 0.000293282 0.00148634 0.00170202 0.00133713 0.000552809 0.00137849 0.00109951 0.000697367 0.000864015 0.000622858 0.00062745 0.001209 0.000996735 0.000303478 0.000298484 0.000296071 0.000292051 0.000287055 0.000282007 0.000277372 0.000273292
# TrawlNorth 5.44158e-06 5.44286e-06 5.44295e-06 4.2329e-06 3.92954e-06 3.92801e-06 3.92593e-06 3.92331e-06 3.92114e-06 3.9204e-06 3.92099e-06 3.92277e-06 4.22756e-06 4.23155e-06 4.23638e-06 4.24194e-06 4.24812e-06 4.25566e-06 4.2653e-06 4.58236e-06 4.59661e-06 4.61252e-06 4.62992e-06 4.64866e-06 9.65513e-06 1.47742e-05 2.80253e-05 1.02844e-05 1.22676e-05 1.58621e-05 1.32765e-05 7.77447e-06 1.39384e-05 3.37362e-05 3.19272e-05 5.47165e-05 4.63963e-05 0.000934084 0.000561631 0.00166039 0.00125137 0.00198259 0.0013825 0.00144084 0.000596468 0.00137935 0.00159127 0.00286688 0.00200233 0.00178683 0.000906298 0.00658477 0.0209544 0.0404565 0.0208864 0.021619 0.0137679 0.0132334 0.0131559 0.0190962 0.0101121 0.0121484 0.01041 0.0150674 0.0182301 0.0262708 0.0299396 0.0262115 0.0247308 0.0178431 0.0137942 0.017041 0.00900284 0.0112745 0.00769358 0.00975585 0.0100442 0.00523208 0.00555258 0.00719278 0.00796417 0.0140939 0.013102 0.0162203 0.020531 0.0202096 0.0245672 0.01177 0.0212629 0.0642113 0.0640143 0.0896014 0.0805407 0.0421594 0.0291393 0.042158 0.0537314 0.0486421 0.045529 0.0256268 0.0143193 0.0223799 0.0189842 0.0194959 0.00830679 0.0123294 0.00450064 0.00434322 0.00113429 0.000748184 0.00220352 3.02682e-05 0.000318745 3.76951e-05 8.51193e-05 0.000127637 0.000383546 0.000121128 0.000199321 0.000184428 0.000192085 0.000117202 0.000342767 0.000467479 0.000401027 0.000112065 9.9257e-05 9.11698e-05 8.57388e-05 8.18482e-05 7.8897e-05 7.6571e-05 7.46879e-05
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
           -15            15          -5.5             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_TrawlSouth(1)
        0.0001             1     0.0415306          0.04            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_TrawlSouth(1)
           -15            15      -10.7716             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecSouth(4)
        0.0001             1      0.326069          0.49            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecSouth(4)
           -15            15      -11.0167             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecCentral(5)
        0.0001             1      0.400221          0.66            99             0          5          0          0          0          0          0          0          0  #  Q_extraSD_RecCentral(5)
           -15            15      -15.3644             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CalCOFI(7)
        0.0001             1      0.140655          0.16            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_CalCOFI(7)
           -15            15     -0.427766             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Triennial(8)
           -15            15      -11.1964             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_CDFWEarlyOB(9)
        0.0001             1      0.260033          0.25            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_CDFWEarlyOB(9)
           -15            15      -10.6537             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCHook(10)
        0.0001             1      0.229595          0.22            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCHook(10)
           -15            15     -0.683504             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_NWFSCTrawl(11)
        0.0001             1     0.0148083          0.02            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_NWFSCTrawl(11)
           -15            15      -7.17632             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Juvenile(12)
        0.0001             1      0.335885          0.39            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_Juvenile(12)
           -15            15     -0.415465             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Rec2013(13)
           -15            15       -11.495             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_PPIndex(14)
        0.0001             1       0.38558          0.38            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_PPIndex(14)
           -15            15       -10.299             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecSouthOB(17)
        0.0001             1      0.272471          0.44            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecSouthOB(17)
           -15            15      -12.0604             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_RecCentralOB(18)
        0.0001             1      0.256457          0.23            99             0          4          0          0          0          0          0          0          0  #  Q_extraSD_RecCentralOB(18)
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
            16            60        43.624       43.7321            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_TrawlSouth(1)
           -20             1      -11.8483      -11.8577            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TrawlSouth(1)
             1            10       4.43353       4.42101            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_TrawlSouth(1)
            -1             9       4.45255       4.59596            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_TrawlSouth(1)
           -30             0      -16.2129      -16.2796            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TrawlSouth(1)
            -5             5      -1.38216      -1.51897            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_TrawlSouth(1)
# 2   HL LenSelex
            16            60       50.1567       50.2935            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_HL(2)
           -20             0      -11.2739      -11.1769            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_HL(2)
             1            12       4.85007       4.85455            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_HL(2)
            -1             9       3.99974       4.09085            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_HL(2)
           -15             0      -7.76451      -7.65174            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_HL(2)
            -5             5     -0.616469     -0.891802            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_HL(2)
# 3   Setnet LenSelex
            16            60       47.6625       47.7691            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Setnet(3)
           -20             0      -12.1322      -12.0492            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Setnet(3)
             1            10        3.6191       3.62227            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Setnet(3)
            -1             9       3.88931       4.00071            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Setnet(3)
           -10             3      -6.35714      -6.40904            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Setnet(3)
            -5             5      -1.77066      -1.92151            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Setnet(3)
# 4   RecSouth LenSelex
            16            60         37.88       37.8456            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_RecSouth(4)
           -20             0      -10.8781      -4.03328            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(4)
             1            10       4.65074       4.63756            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_RecSouth(4)
            -1             9       5.59877       5.56413            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_RecSouth(4)
           -10             2      -6.97935       -6.9658            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(4)
           -10             9      -3.51943       -3.8711            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_RecSouth(4)
# 5   RecCentral LenSelex
            16            60       47.0344         47.65            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_RecCentral(5)
           -20             0      -11.2439      -11.3327            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecCentral(5)
             1            10        5.5302       5.55578            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_RecCentral(5)
            -1             9       3.70267       3.88992            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_RecCentral(5)
           -10             2      -5.68415      -5.46783            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecCentral(5)
           -10             9      0.335226     0.0533028            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_RecCentral(5)
# 6   TrawlNorth LenSelex
            16            60       45.2137       45.9359            10             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_peak_TrawlNorth(6)
            -5             5     -0.218399     -0.853133            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_TrawlNorth(6)
             1            15       3.73492        3.8369            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_TrawlNorth(6)
            -5             5     -0.342737        2.9507            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_descend_se_TrawlNorth(6)
           -15             0      -8.94573      -9.40927            10             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_TrawlNorth(6)
           -10            10      0.424105     0.0689498            10             0          4          0          0          0          0        0.5          1          2  #  Size_DblN_end_logit_TrawlNorth(6)
# 7   CalCOFI LenSelex
# 8   Triennial LenSelex
            16            60       27.6173       28.0443            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_peak_Triennial(8)
           -20             0      -12.3121       -12.004            10             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Triennial(8)
             1            10       1.83738       1.92642            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_ascend_se_Triennial(8)
           -20             3          -8.5      -4.99989            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_descend_se_Triennial(8)
          -999             1          -999          -999            10             0         -4          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Triennial(8)
            -5             5     -0.912976     -0.913258            10             0          2          0          0          0          0        0.5          2          2  #  Size_DblN_end_logit_Triennial(8)
# 9   CDFWEarlyOB LenSelex
            -1            10            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P1_CDFWEarlyOB(9)
            -1            10            -1            -1            99             0        -99          0          0          0          0        0.5          0          0  #  SizeSel_P2_CDFWEarlyOB(9)
# 10   NWFSCHook LenSelex
            16            60       44.8509       43.8236            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSCHook(10)
            -5             5      -1.49468      -1.42363            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSCHook(10)
            -1            10       4.74163       4.66827            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSCHook(10)
            -1             9       4.30025       4.31619            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSCHook(10)
           -15            -5      -12.0615      -12.0962            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSCHook(10)
            -5             5      -1.97057      -2.34605            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSCHook(10)
# 11   NWFSCTrawl LenSelex
            13            60       21.4224       23.1912            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_NWFSCTrawl(11)
           -20             0      -11.2752      -11.5426            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_NWFSCTrawl(11)
            -5            15      -3.97683      -4.71677            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_NWFSCTrawl(11)
            -1             9        6.7332       6.55647            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_NWFSCTrawl(11)
           -15             5      0.564804      0.377822            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_NWFSCTrawl(11)
            -5             5      -2.34562      -2.93515            10             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_NWFSCTrawl(11)
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
            16            70       60.1546       57.2955            10             0      2  # Size_DblN_peak_TrawlSouth(1)_BLK1repl_2003
             1            10       5.58766       5.78733            10             0      4  # Size_DblN_ascend_se_TrawlSouth(1)_BLK1repl_2003
            -1             9       4.14871       4.07747            10             0      4  # Size_DblN_descend_se_TrawlSouth(1)_BLK1repl_2003
            -5             5      0.412923     0.0218787            10             0      4  # Size_DblN_end_logit_TrawlSouth(1)_BLK1repl_2003
            16            60        38.218       37.5583            10             0      2  # Size_DblN_peak_RecSouth(4)_BLK1repl_2003
             1            15       4.30669       4.22662            10             0      4  # Size_DblN_ascend_se_RecSouth(4)_BLK1repl_2003
            -5             5       4.77467       4.80844            10             0      4  # Size_DblN_descend_se_RecSouth(4)_BLK1repl_2003
           -10            10      -3.82531      -4.06332            10             0      4  # Size_DblN_end_logit_RecSouth(4)_BLK1repl_2003
            16            60        44.228       43.4264            10             0      2  # Size_DblN_peak_RecCentral(5)_BLK1repl_2003
             1            10       4.66323       4.60145            10             0      4  # Size_DblN_ascend_se_RecCentral(5)_BLK1repl_2003
            -1             9       4.33913       4.86781            10             0      4  # Size_DblN_descend_se_RecCentral(5)_BLK1repl_2003
            -5             5     -0.834046      -1.24814            10             0      4  # Size_DblN_end_logit_RecCentral(5)_BLK1repl_2003
            16            60       59.9698        44.323            10             0      2  # Size_DblN_peak_TrawlNorth(6)_BLK1repl_2003
             1            15       5.98069       4.66351            10             0      4  # Size_DblN_ascend_se_TrawlNorth(6)_BLK1repl_2003
            -5             5      0.151607    -0.0248232            10             0      4  # Size_DblN_descend_se_TrawlNorth(6)_BLK1repl_2003
           -10            10       7.53419       8.38712            10             0      4  # Size_DblN_end_logit_TrawlNorth(6)_BLK1repl_2003
            16            60       22.9306       22.9248            10             0      2  # Size_DblN_peak_Triennial(8)_BLK2repl_1995
             1            15       1.21473       1.34611            10             0      4  # Size_DblN_ascend_se_Triennial(8)_BLK2repl_1995
           -15             5      -7.55518      -7.36054            10             0      4  # Size_DblN_descend_se_Triennial(8)_BLK2repl_1995
           -10            10      -1.90939      -1.94337            10             0      4  # Size_DblN_end_logit_Triennial(8)_BLK2repl_1995
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

