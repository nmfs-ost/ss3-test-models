#V3.30.16.00;_2020_09_03;_safe;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.2
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#C  generic forecast file
# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy; 2=calc F_spr,F0.1,F_msy 
2 # MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt) or F0.1; 4=set to F(endyr) 
0.2 # SPR target (e.g. 0.40)
0.2 # Biomass target (e.g. 0.40)
#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF, beg_recr_dist, end_recr_dist, beg_SRparm, end_SRparm (enter actual year, or values of 0 or -integer to be rel. endyr)
 2011 2011 2011 2011 2011 2011 1971 2011 1971 2011
#  2011 2011 2011 2011 2011 2011 1971 2011 1971 2011
1 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
4 # Forecast: -1=none; 0=simple_1yr; 1=F(SPR); 2=F(MSY) 3=F(Btgt) or F0.1; 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
# where none and simple require no input after this line; simple sets forecast F same as end year F
1 # N forecast years 
0 # Fmult (only used for Do_Forecast==5) such that apical_F(f)=Fmult*relF(f)
#_Fcast_years:  beg_selex, end_selex, beg_relF, end_relF, beg_mean recruits, end_recruits  (enter actual year, or values of 0 or -integer to be rel. endyr)
 2011 2011 2011 2011 1971 2011
#  2011 2011 2011 2011 1971 2011
0 # Forecast selectivity (0=fcast selex is mean from year range; 1=fcast selectivity from annual time-vary parms)
2 # Control rule method (1: ramp does catch=f(SSB), buffer on F; 2: ramp does F=f(SSB), buffer on F; 3: ramp does catch=f(SSB), buffer on catch; 4: ramp does F=f(SSB), buffer on catch) 
0.4 # Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40); (Must be > the no F level below) 
0.01 # Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
1 # Buffer:  enter Control rule target as fraction of Flimit (e.g. 0.75), negative value invokes list of [year, scalar] with filling from year to YrMax 
3 #_N forecast loops (1=OFL only; 2=ABC; 3=get F from forecast ABC catch with allocations applied)
3 #_First forecast loop with stochastic recruitment
0 #_Forecast recruitment:  0= spawn_recr; 1=value*spawn_recr_fxn; 2=value*VirginRecr; 3=recent mean from yr range above (need to set phase to -1 in control to get constant recruitment in MCMC)
1 # value is ignored 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2012  #FirstYear for caps and allocations (should be after years with fixed inputs) 
0 # stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output (0/1) 
2011 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2011 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1 # fleet relative F:  1=use first-last alloc year; 2=read seas, fleet, alloc list below
# Note that fleet allocation is used directly as average F if Do_Forecast=4 
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum); NOTE: same units for all fleets
# Conditional input if relative F choice = 2
# enter list of:  season,  fleet, relF; if used, terminate with season=-9999
# 1 2 0.0268068
# 1 3 0.0101759
# 1 4 0.00569053
# 1 5 0.0165064
# 1 6 0.000380208
# 1 7 0.00258544
# 1 8 0.00127055
# 1 9 0.00274385
# 1 10 0.0160288
# 1 11 0.0660029
# 1 12 0.0739673
# 1 13 0.00304899
# 1 14 0.00340857
# 1 15 0.029575
# 1 16 0.00401671
# 2 2 0.021739
# 2 3 0.00969511
# 2 4 0.00637699
# 2 5 0.0141341
# 2 6 0.000367741
# 2 7 0.00533113
# 2 8 0.00157919
# 2 9 0.00274569
# 2 10 0.0149185
# 2 11 0.0525352
# 2 12 0.0666119
# 2 13 0.00280911
# 2 14 0.00577106
# 2 15 0.0279954
# 2 16 0.00424106
# 3 2 0.0188789
# 3 3 0.0104179
# 3 4 0.0059462
# 3 5 0.0137393
# 3 6 0.000375448
# 3 7 0.00544123
# 3 8 0.00114861
# 3 9 0.00314948
# 3 10 0.0174428
# 3 11 0.0635014
# 3 12 0.0725575
# 3 13 0.00300766
# 3 14 0.00541907
# 3 15 0.0272002
# 3 16 0.00403535
# 4 2 0.0124255
# 4 3 0.0107549
# 4 4 0.00583331
# 4 5 0.0152501
# 4 6 0.000424009
# 4 7 0.00427947
# 4 8 0.00170404
# 4 9 0.00300019
# 4 10 0.0177102
# 4 11 0.0629588
# 4 12 0.0765919
# 4 13 0.00299617
# 4 14 0.00288454
# 4 15 0.0279313
# 4 16 0.00393534
# -9999 0 0  # terminator for list of relF
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
2 # basis for input Fcast catch: -1=read basis with each obs; 2=dead catch; 3=retained catch; 99=input apical_F; NOTE: bio vs num based on fleet's catchunits
#enter list of Fcast catches or Fa; terminate with line having year=-9999
#_Yr Seas Fleet Catch(or_F)
-9999 1 1 0 
#
999 # verify end of input 
