#V3.30.08.02-trans;_2017_09_26;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#C starter comment here
boc1.dat
boc1.ctl
0 # 0=use init values in control file; 1=use ss.par
0 # run display detail (0,1,2)
1 # detailed age-structured reports in REPORT.SSO (0=low,1=high,2=low for data-limited) 
0 # write detailed checkup.sso file (0,1) 
0 # write parm values to ParmTrace.sso (0=no,1=good,active; 2=good,all; 3=every_iter,all_parms; 4=every,active)
1 # write to cumreport.sso (0=no,1=like&timeseries; 2=add survey fits)
1 # Include prior_like for non-estimated parameters (0,1) 
1 # Use Soft Boundaries to aid convergence (0,1) (recommended)
3 # Number of datafiles to produce: 1st is input, 2nd is estimates, 3rd and higher are bootstrap
7 # Turn off estimation for parameters entering after this phase
10 # MCeval burn interval
2 # MCeval thin interval
0.0 # jitter initial parm value by this fraction
1890 # min yr for sdreport outputs (-1 for styr)
2024 # max yr for sdreport outputs (-1 for endyr; -2 for endyr+Nforecastyrs
0 # N individual STD years 
#vector of year values 

0.0001 # final convergence criteria (e.g. 1.0e-04) 
0 # retrospective year relative to end year (e.g. -4)
1 # min age for calc of summary biomass
1 # Depletion basis:  denom is: 0=skip; 1=rel X*B0; 2=rel X*Bmsy; 3=rel X*B_styr
1 # Fraction (X) for Depletion denominator (e.g. 0.4)
1 # SPR_report_basis:  0=skip; 1=(1-SPR)/(1-SPR_tgt); 2=(1-SPR)/(1-SPR_MSY); 3=(1-SPR)/(1-SPR_Btarget); 4=rawSPR
1 # F_report_units: 0=skip; 1=exploitation(Bio); 2=exploitation(Num); 3=sum(Frates); 4=true F for range of ages
#COND 10 15 #_min and max age over which average F will be calculated with F_reporting=4
0 # F_report_basis: 0=raw_F_report; 1=F/Fspr; 2=F/Fmsy ; 3=F/Fbtgt
0 # MCMC output detail (0=default; 1=obj func components; 2=expanded; 3=make output subdir for each MCMC vector)
0 # ALK tolerance (example 0.0001)
3.30 # check value for end of file and for version control
