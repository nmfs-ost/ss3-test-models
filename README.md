# ss-test-models

Stock Synthesis models and scripts used for testing

## Repository structure

All SS models are in the "models" subfolder. All testing scripts and specifications files are in the "jenkins" subfolder.

## Why are these models not in the user-examples repository?

This repository houses models used for testing Stock Synthesis. These are often based on stock assessment models, but may not be the final model version or may have been altered for testing purposes. In addition, the data in the model files should not be used as data sources, as the data may have been altered for testing purposes.

## How is Stock Synthesis tested?

Stock Synthesis is tested by running this set of models and seeing if the same results for key model quantities remains the same relative to a "reference run" (typically the last release of Stock Synthesis). If there are changes, the Stock Synthesis Development Team investigates if these changes are expected or not based on the revisions. If they are expected, then the output files for the reference run are updated. If not, then fixes are made so that the model has the same results. Note that sometimes different model results occur because the model results are not stable; in this case, the model is revised to be more stable or may be excluded from the test set.

## What features do these models have?

Most of these models have at least 1 unique feature.

| Model | Features |
| ----- | -------- |
| BigSkate_2019 | Uses F method 3 (hybrid), Cessation growth model, Catchability time blocks, catchability priors,  discard data |
| BlackRf_2015_WA | Uses F method 1 (Pope's approximation), Mirrored selectivity, input variance adjustments |
| BlueDeaconRF_2017 | Mirrored selectivity, selectivity time blocks, input variance adjustment, ageing error|
| Bocaccio_2015 | Mirrored selectivity, Selectivity time blocks, input variance adjustment  |
| CanaryRf_2015 | spatial model with deviations in recruitment allocation, no movement |
| China_2015_Central | Mirrored selectivity, input variance adjustment |
| Darkblotched_2015   |  Maturity option 6 (read length-maturity) |
| Empirical_Wtatage_Age_Selex | Empirical Weight at age model, with empirical (as random walk) age selectivity |
| growth_morphs | Uses growth morphs |
| growth_timevary | Time-varying growth using time blocks |
| Hake_2018 | Empirical weight at age model, Dirichlet Multinomial comps weighting, time varying selectivity using annual deviations |
| Hake_2019_semi-parametric_selex | Empirical Weight at age model, with semiparametric (2DAR) selectivity |
| KelpGreenling2015 | Maturity option 6 (read length-maturity), Mirrored selectivity, input variance adjustment |
| Petrale2015 | Catchability annual parameter deviations, Selectivity time blocks, Likelihood emphasis factors (lamdas), Discard data, Mean body size data |
| POP_2017 | Retention selectivity parameters Selectivity time blocks, Logistic selectivity, Likelihood emphasis factors (lamdas)|
| Sablefish2015 | cubic spline selectivity with male offset |
| seasonal_with_size_comp | uses seasons |
| Simple | Uses sd reporting and mean size-at-age data |
| Simple_NoCPUE | No index of abundance |
| Simple_with_Discard | Uses discards |
| Spinydogfish_2011 | Stock Recruitment option 7 (survival 3 parameter)  |
| tagging_mirrored_sel | Time varying growth using annual deviations, Tagging data and movement parameters, selectivity, environmental variable data |
| three_area | Spatial model with movement |
| three_area_double_normal_selex | Spatial model |
| three_area_nomove | Spatial model with no movement |
| vermillion_snapper | Uses F method 2 (estimated parameters) |
| Widow_2015 | Catchability parameter deviations, Time blocks on selectivity |
| YelloweyeRF_2017 | spatial age-structured production model, no movement |
| YellowtailRF_2017 | Selectivity time blocks, Dummy observations in indices of abundance (to get expected values), Discard data|

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”
