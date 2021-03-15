#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: Example_2_data.SS // Example_2_control.SS
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
2 #_Nblock_Patterns
 1 1 #_blocks_per_pattern 
# begin and end years of blocks
 1993 2009
 1915 1915
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
1 #_N_breakpoints
 4 # age(real) at M breakpoints
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1 #_Age(post-settlement)_for_L1;linear growth below this
70 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 0.01 0.15 0.0473093 0.0517 0.0226 6 6 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 10 35 18.3928 30 99 0 2 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 40 120 62.3795 66 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.2 0.0487287 0.05 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.2 0.128209 0.19 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.05 0.2 0.0714979 0.1 99 0 3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 -3 3 9.7659e-06 2.0873e-05 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem
 -3 4 3.17125 2.96956 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem
 38 39 38.78 40 99 0 -50 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -0.437 -0.4 99 0 -50 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 300000 137900 137900 1 6 -6 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 39000 36500 36500 1 6 -6 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 0.01 0.15 0.0466663 0.0517 0.0226 6 6 0 0 0 0 0 0 0 # NatM_p_1_Mal_GP_1
 -1 1 0 0 99 0 -50 0 0 0 0 0 0 0 # L_at_Amin_Mal_GP_1
 40 120 64.7383 66 99 0 2 0 0 0 0 0 0 0 # L_at_Amax_Mal_GP_1
 0.01 0.2 0.0483601 0.05 99 0 2 0 0 0 0 0 0 0 # VonBert_K_Mal_GP_1
 0.05 0.2 0.130033 0.14 99 0 3 0 0 0 0 0 0 0 # CV_young_Mal_GP_1
 0.05 0.2 0.0611675 0.4 99 0 3 0 0 0 0 0 0 0 # CV_old_Mal_GP_1
 -3 3 1.70424e-05 2.0873e-05 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Mal
 -3 4 3.02815 2.96956 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Mal
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 0 99 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 -0.0994204 0 99 0 1 0 0 1916 2008 0.3 0 0 # RecrDist_Area_2
 -4 4 -1.3062 0 99 0 1 0 0 1916 2008 0.3 0 0 # RecrDist_Area_3
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_timing_1
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
             3            15       5.42509             5            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1      0.416781          0.73         0.189             2          7          0          0          0          0          0          0          0 # SR_BH_steep
             0             5         0.001             1            99             0        -50          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
            -1             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1916 # first year of main recr_devs; early devs can preceed this era
1916 # last year of main recr_devs; forecast devs start in following year
-8 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -8 #_recdev_early_phase
 -8 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 -1965 #_last_early_yr_nobias_adj_in_MPD
 -1970 #_first_yr_fullbias_adj_in_MPD
 -1990 #_last_yr_fullbias_adj_in_MPD
 -1995 #_first_recent_yr_nobias_adj_in_MPD
 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  1916R 1917F 1918F 1919F 1920F 1921F 1922F 1923F 1924F 1925F 1926F 1927F 1928F 1929F 1930F 1931F 1932F 1933F 1934F 1935F 1936F 1937F 1938F 1939F 1940F 1941F 1942F 1943F 1944F 1945F 1946F 1947F 1948F 1949F 1950F 1951F 1952F 1953F 1954F 1955F 1956F 1957F 1958F 1959F 1960F 1961F 1962F 1963F 1964F 1965F 1966F 1967F 1968F 1969F 1970F 1971F 1972F 1973F 1974F 1975F 1976F 1977F 1978F 1979F 1980F 1981F 1982F 1983F 1984F 1985F 1986F 1987F 1988F 1989F 1990F 1991F 1992F 1993F 1994F 1995F 1996F 1997F 1998F 1999F 2000F 2001F 2002F 2003F 2004F 2005F 2006F 2007F 2008F 2009F 2010F 2011F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0 0 0
#
#Fishing Mortality info 
0.09 # F ballpark
-1999 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2011 2029
# F rates by fleet
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fish1 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000197836 0.000320247 0.000478515 0.000639964 0.000802545 0.000965102 0.00112868 0.00129105 0.00154539 0.00151888 0.00133165 0.00190079 0.00173829 0.00189003 0.00203881 0.00219258 0.00235907 0.00254811 0.00146473 0.00296543 0.00386453 0.00473007 0.00533613 0.00478844 0.00421992 0.00568818 0.00734751 0.00834211 0.00767436 0.01121 0.00959972 0.00702046 0.00566053 0.00709101 0.00745085 0.0067571 0.0102715 0.0116138 0.0121377 0.0143196 0.0152137 0.0178605 0.0162163 0.0214608 0.027985 0.031142 0.0328362 0.0374079 0.0353837 0.0345974 0.0434628 0.0439494 0.0250219 0.0504736 0.0274813 0.0532744 0.0967701 0.0658294 0.0520496 0.0573609 0.0560029 0.0437781 0.0324313 0.022599 0.0109763 0.0218022 0.0166263 0.0216825 0.0267821 0.00957362 0.0182693 0.0110231 0.0117746 0.00442333 0.00633196 0.0009722 0.00139485 0.00610227 0.0114976 0.0029434 0.00575369 0.00583332 0.00590156
# Fish2 0.000600796 0.000989133 0.00116233 0.000591362 0.000651929 0.000630368 0.000564889 0.0006063 0.000774025 0.00106015 0.00133872 0.00162919 0.00152119 0.00156172 0.00186793 0.00155575 0.00225428 0.00123687 0.00160908 0.00222887 0.00226014 0.00170557 0.00178864 0.00181292 0.0012915 0.00151546 0.000956824 0.0016755 0.00709632 0.0168331 0.0168806 0.00484061 0.0069581 0.00297598 0.00242736 0.00516025 0.00433095 0.00362507 0.00364598 0.00217371 0.00325893 0.0041601 0.00427011 0.00330099 0.00288468 0.00171514 0.00177951 0.00357475 0.0024909 0.00312087 0.00300906 0.00265767 0.00261724 0.00887824 0.00973778 0.0166849 0.0234214 0.0188827 0.0223193 0.0248911 0.0250766 0.0261191 0.0735056 0.0518876 0.0237254 0.100213 0.101016 0.0464854 0.041581 0.0100742 0.0296764 0.0509167 0.0651958 0.0551116 0.093045 0.183065 0.161216 0.0861459 0.0938252 0.0898584 0.138163 0.134048 0.0460775 0.0485119 0.00823361 0.00850707 0.00200526 0.00126419 0.00227667 0.00301399 0.00128823 0.0043662 0.000625864 0.00861082 0.00873 0.00883213
# Fish3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00184407 0.0019393 0.00200384 0.00210339 0.00217205 0.00227215 0.00234457 0.00244752 0.00252218 0.00262482 0.00269739 0.00280056 0.00287584 0.00298189 0.00305593 0.00316699 0.00416854 0.00520706 0.00237824 0.00412973 0.00200917 0.00630326 0.00652422 0.00810901 0.0130348 0.0109126 0.0128629 0.0212671 0.0252953 0.0189628 0.0120521 0.0128815 0.0144918 0.00475573 0.00897949 0.0108398 0.0102885 0.0189966 0.0200017 0.0178008 0.0149962 0.00823853 0.0166462 0.0226811 0.02261 0.0126906 0.00632574 0.00403458 0.00378506 0.00451367 0.00514926 0.0033488 0.00362171 0.0046503 0.00637506 0.00646329 0.0065389
# Fish4 0 0 0 0 0 0 0 0 0 0 0 0 3.7594e-05 6.57921e-05 6.26632e-05 4.70004e-05 1.88011e-05 2.50687e-05 2.82033e-05 2.50705e-05 6.26786e-05 8.14882e-05 7.20925e-05 5.32905e-05 0.000326037 0.000683646 0.000997894 0.00364665 0.00600662 0.00927446 0.00582149 0.00366094 0.00251567 0.00256247 0.00310416 0.00200951 0.0020576 0.00164761 0.00207524 0.00218213 0.0013461 0.00386812 0.00298826 0.00329445 0.0041949 0.00384316 0.00450235 0.00291597 0.00293809 0.00249146 0.00348004 0.00299599 0.00245456 0.00420912 0.00362398 0.00162017 0.00297643 0.00373228 0.00246167 0.00281802 0.00541597 0.00584805 0.0103636 0.0229679 0.0260485 0.0402227 0.047223 0.0777986 0.0274941 0.0459731 0.0344151 0.0400804 0.0627807 0.10166 0.0400256 0.0932798 0.121899 0.151246 0.0973716 0.153664 0.109331 0.147294 0.0595747 0.0916732 0.00581261 0.00975291 0.00290932 0.00151709 0.00216691 0.00204011 0.00258176 0.00261488 0.00326706 0.0125514 0.0127252 0.012874
# Fish5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00114537 0.00114834 0.00115129 0.00230848 0.00231669 0.00232487 0.00233303 0.00234115 0.00352386 0.00354689 0.0035699 0.00359286 0.00361575 0.00363856 0.00366128 0.00491183 0.00495299 0.00500125 0.00505459 0.0051189 0.00519009 0.00563579 0.0116963 0.00615189 0.00493338 0.00350513 0.00518519 0.00524397 0.0104895 0.0195911 0.0145353 0.0155127 0.0185826 0.015364 0.0282248 0.0207338 0.0396906 0.0378415 0.0457816 0.028558 0.0288236 0.0329214 0.0364193 0.0486303 0.0368548 0.0388924 0.049454 0.0159221 0.0111147 0.0155486 0.0215994 0.0070199 0.0101048 0.0112178 0.0181783 0.0184299 0.0186455
# Fish6 0 0 0 0 0 0 0 0 0 0.00114036 0.00114149 0.00114261 0.00114371 0.0011448 0.00114586 0.00114691 0.00114793 0.00114894 0.00114992 0.00115088 0.00115182 0.00115274 0.00115364 0.00115451 0.00115537 0.0011562 0.00115701 0.00115781 0.00115858 0.00115934 0.00116008 0.00116081 0.00116153 0.00116223 0.00116292 0.0011636 0.00116427 0.00116494 0.0011656 0.00233253 0.00233861 0.00234466 0.00235069 0.0023591 0.00236749 0.00237585 0.00238419 0.00478497 0.00481655 0.00484811 0.00487963 0.00491107 0.00494242 0.00497364 0.00638101 0.00808809 0.00931472 0.0118626 0.0134506 0.0093934 0.0137669 0.02424 0.0333397 0.0410094 0.0523 0.01512 0.019868 0.027202 0.0220476 0.0446492 0.026375 0.0454991 0.0485152 0.0783544 0.0565276 0.0461663 0.0813874 0.0780266 0.0560504 0.0543663 0.0532452 0.061762 0.0194845 0.118583 0.0314121 0.0896792 0.015561 0.00576969 0.0065363 0.00585038 0.00431395 0.00477824 0.0195867 0.0219454 0.0222491 0.0225094
#
#_Q_setup for every fleet, even if no survey
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         1         3         0         0         0         1  #  Fish1
         3         3         0         0         0         1  #  Fish3
         5         3         0         0         0         1  #  Fish5
         7         1         0         0         0         1  #  Surv7
         8         3         0         0         0         1  #  Surv8
         9         1         0         0         0         1  #  Surv9
        10         1         0         0         0         1  #  Surv10
        11         1         0         0         0         1  #  Surv11
        12         1         0         0         1         0  #  Surv12
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -5.01388             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Fish1(1)
            -6             6     0.0562983             0            99             0          1          0          0          0          0          0          0          0  #  Q_power_Fish1(1)
           -15            15      -3.32145             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Fish3(3)
            -6             6    -0.0779975             0            99             0          1          0          0          0          0          0          0          0  #  Q_power_Fish3(3)
           -15            15      -1.90175             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Fish5(5)
            -6             6     -0.273985             0            99             0          8          0          0          0          0          0          0          0  #  Q_power_Fish5(5)
           -15            15      -13.1793             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Surv7(7)
           -15            15      -6.13119             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Surv8(8)
            -6             6      0.546073             0            99             0          1          0          0          0          0          0          0          0  #  Q_power_Surv8(8)
           -15            15      -8.97839             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Surv9(9)
           -15            15      -1.04372             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Surv10(10)
           -15            15      -10.5316             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Surv11(11)
           -10             2      0.354623             0            99             0          1          0          1       1980       2004         -5          0          0  #  LnQ_base_Surv12(12)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
        0.0001             2             2            99           0.5             0      -5  # LnQ_base_Surv12(12)_dev_se
         -0.99          0.99             0             0           0.5             0      -6  # LnQ_base_Surv12(12)_dev_autocorr
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
 1 0 0 0 # 1 Fish1
 1 0 0 0 # 2 Fish2
 1 0 0 0 # 3 Fish3
 1 0 0 0 # 4 Fish4
 1 0 0 0 # 5 Fish5
 1 0 0 0 # 6 Fish6
 1 0 0 0 # 7 Surv7
 5 0 0 1 # 8 Surv8
 1 0 0 0 # 9 Surv9
 24 0 0 0 # 10 Surv10
 1 0 0 0 # 11 Surv11
 24 0 0 0 # 12 Surv12
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
 10 0 0 0 # 1 Fish1
 10 0 0 0 # 2 Fish2
 10 0 0 0 # 3 Fish3
 10 0 0 0 # 4 Fish4
 10 0 0 0 # 5 Fish5
 10 0 0 0 # 6 Fish6
 10 0 0 0 # 7 Surv7
 10 0 0 0 # 8 Surv8
 10 0 0 0 # 9 Surv9
 10 0 0 0 # 10 Surv10
 10 0 0 0 # 11 Surv11
 10 0 0 0 # 12 Surv12
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            10            70       33.8368            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Fish1(1)
         0.001            50       13.6972            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Fish1(1)
            10            70       36.1493            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Fish2(2)
         0.001            50       11.9393            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Fish2(2)
            10            70       32.0362            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Fish3(3)
         0.001            50        8.0207            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Fish3(3)
            10            70        38.864            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Fish4(4)
         0.001            50        12.189            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Fish4(4)
            10            70        42.643            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Fish5(5)
         0.001            50       12.0148            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Fish5(5)
            10            70       43.8625            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Fish6(6)
         0.001            50       10.4657            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Fish6(6)
            10            70       22.7269       22.1792             5             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Surv7(7)
         0.001            50        4.1127        3.6938             5             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Surv7(7)
            -2             0            -1             5            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P1_Surv8(8)
            -2             0            -1             6            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_Surv8(8)
            10            70       57.9893            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Surv9(9)
         0.001            60       9.82862            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Surv9(9)
            20            70       52.1931            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Surv10(10)
            -4             4            -4             0            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_Surv10(10)
             0             8       6.34643             4            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P3_Surv10(10)
             0            12       3.16916             4            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P4_Surv10(10)
         -1000          -998          -999             0            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P5_Surv10(10)
         -1000          -998          -999             0            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P6_Surv10(10)
            10            70       47.0017            30            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P1_Surv11(11)
         0.001            60       5.31815            15            99             0          5          0          0          0          0          0          0          0  #  SizeSel_P2_Surv11(11)
            20            87            87            30            99             0         -4          0          0          0          0          0          0          0  #  SizeSel_P1_Surv12(12)
            -4             4            -4             0            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P2_Surv12(12)
             0             8       6.67011             4            99             0          4          0          0          0          0          0          0          0  #  SizeSel_P3_Surv12(12)
             0            12            12             4            99             0         -5          0          0          0          0          0          0          0  #  SizeSel_P4_Surv12(12)
           -10            10       -3.0933      -2.88182             2             0          4          0          0          0          0          0          0          0  #  SizeSel_P5_Surv12(12)
           -10            10            10             0            99             0        -50          0          0          0          0          0          0          0  #  SizeSel_P6_Surv12(12)
#_no timevary selex parameters
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
#      3    13     1     0     0     0     0     1     1  1980  2004     5      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0
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
      1      1      0.16
      4      1      3.24
      4      2      2.25
      1      3       0.1
      4      3      0.54
      4      4      2.16
      4      5      5.49
      4      6      1.57
      4      7      1.44
      1      8      0.02
      4      8      1.52
      1      9      0.54
      4      9      0.62
      5      9       0.9
      1     10      0.42
      4     10      2.79
      1     11      0.36
      4     11      0.73
      5     11      0.74
      1     12      0.41
      4     12      2.08
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  1 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  0 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  0 #_CPUE/survey:_6
#  1 #_CPUE/survey:_7
#  1 #_CPUE/survey:_8
#  1 #_CPUE/survey:_9
#  1 #_CPUE/survey:_10
#  1 #_CPUE/survey:_11
#  1 #_CPUE/survey:_12
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  1 #_lencomp:_5
#  1 #_lencomp:_6
#  1 #_lencomp:_7
#  1 #_lencomp:_8
#  1 #_lencomp:_9
#  1 #_lencomp:_10
#  1 #_lencomp:_11
#  1 #_lencomp:_12
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_agecomp:_4
#  1 #_agecomp:_5
#  1 #_agecomp:_6
#  0 #_agecomp:_7
#  0 #_agecomp:_8
#  1 #_agecomp:_9
#  0 #_agecomp:_10
#  1 #_agecomp:_11
#  0 #_agecomp:_12
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

