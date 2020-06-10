#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#C  generic forecast file
# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy 
2 # MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt); 4=set to F(endyr) 
0.5 # SPR target (e.g. 0.40)
0.4 # Biomass target (e.g. 0.40)
#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF, beg_recr_dist, end_recr_dist, beg_SRparm, end_SRparm (enter actual year, or values of 0 or -integer to be rel. endyr)
 2014 2014 2014 2014 2014 2014 1892 2014 1892 2014
1 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
1 # Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
10 # N forecast years 
1 # F scalar (only used for Do_Forecast==5)
#_Fcast_years:  beg_selex, end_selex, beg_relF, end_relF, beg_recruits, end_recruits  (enter actual year, or values of 0 or -integer to be rel. endyr)
 0 0 0 0 -999 0
0 # Forecast selectivity (0=fcast selex is mean from year range; 1=fcast selectivity from annual time-vary parms)
1 # Control rule method (1=catch=f(SSB) west coast; 2=F=f(SSB) ) 
0.4 # Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40); (Must be > the no F level below) 
0.1 # Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
1 # Control rule target as fraction of Flimit (e.g. 0.75) 
3 #_N forecast loops (1=OFL only; 2=ABC; 3=get F from forecast ABC catch with allocations applied)
3 #_First forecast loop with stochastic recruitment
0 #_Forecast loop control #3 (reserved for future bells&whistles) 
0 #_Forecast loop control #4 (reserved for future bells&whistles) 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2025  #FirstYear for caps and allocations (should be after years with fixed inputs) 
0 # stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output (0/1) 
2000 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2015 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1 # fleet relative F:  1=use first-last alloc year; 2=read seas(row) x fleet(col) below
# Note that fleet allocation is used directly as average F if Do_Forecast=4 
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum)
# Conditional input if relative F choice = 2
# enter list of:  season,  fleet, relF; if used, terminate with season=-9999
# 1 1 0.0373435
# 1 2 0.0513506
# 1 4 0.841056
# 1 5 0.0469357
# 1 6 0.0233143
# enter list of: fleet number, max annual catch for fleets with a max; terminate with fleet=-9999
-9999 -1
# enter list of area ID and max annual catch; terminate with area=-9999
-9999 -1
# enter list of fleet number and allocation group assignment, if any; terminate with fleet=-9999
-9999 -1
#_if N allocation groups >0, list year, allocation fraction for each group 
# list sequentially because read values fill to end of N forecast
# terminate with -9999 in year field 
# no allocation groups
-1 # basis for input Fcast catch: -1=read basis with each obs; 2=dead catch; 3=retained catch; 99=input Hrate(F)
#enter list of Fcast catches; terminate with line having year=-9999
#_Yr Seas Fleet Catch(or_F) Basis 
 2015 1 1 29.6894 2
 2015 1 2 10.4458 2
 2015 1 3 0 2
 2015 1 4 286.049 2
 2015 1 5 16.0236 2
 2015 1 6 6.79185 2
 2016 1 1 30.7953 2
 2016 1 2 10.8349 2
 2016 1 3 0 2
 2016 1 4 296.704 2
 2016 1 5 16.6205 2
 2016 1 6 7.04484 2
 2017 1 1 10.124 2
 2017 1 2 3.562 2
 2017 1 3 0 2
 2017 1 4 97.542 2
 2017 1 5 5.464 2
 2017 1 6 2.316 2
 2018 1 1 10.124 2
 2018 1 2 3.562 2
 2018 1 3 0 2
 2018 1 4 97.542 2
 2018 1 5 5.464 2
 2018 1 6 2.316 2
 2019 1 1 10.124 2
 2019 1 2 3.562 2
 2019 1 3 0 2
 2019 1 4 97.542 2
 2019 1 5 5.464 2
 2019 1 6 2.316 2
 2020 1 1 10.124 2
 2020 1 2 3.562 2
 2020 1 3 0 2
 2020 1 4 97.542 2
 2020 1 5 5.464 2
 2020 1 6 2.316 2
 2021 1 1 10.124 2
 2021 1 2 3.562 2
 2021 1 3 0 2
 2021 1 4 97.542 2
 2021 1 5 5.464 2
 2021 1 6 2.316 2
 2022 1 1 10.124 2
 2022 1 2 3.562 2
 2022 1 3 0 2
 2022 1 4 97.542 2
 2022 1 5 5.464 2
 2022 1 6 2.316 2
 2023 1 1 10.124 2
 2023 1 2 3.562 2
 2023 1 3 0 2
 2023 1 4 97.542 2
 2023 1 5 5.464 2
 2023 1 6 2.316 2
 2024 1 1 10.124 2
 2024 1 2 3.562 2
 2024 1 3 0 2
 2024 1 4 97.542 2
 2024 1 5 5.464 2
 2024 1 6 2.316 2
-9999 1 1 0  2 
#
999 # verify end of input 
