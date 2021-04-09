# ss-test-models

Stock Synthesis models and scripts used for testing

## Repository structure

All SS models are in the "models" subfolder. All testing scripts and specifications files used by the SS development team are in the "jenkins" subfolder.

## Can I open a pull request to add my own models to this repository?

It is always helpful to have more examples of Stock Synthesis models! Please open a pull request in the [user-examples repository](https://github.com/nmfs-stock-synthesis/user-examples) to share your own models publicly.

## Why are these models not in the user-examples repository?

This repository houses models used for testing Stock Synthesis. These are often based on stock assessment models, but may not be the final model version or may have been altered for testing purposes. In addition, the data in the model files should not be used as data sources, as the data may have been altered for testing purposes.

## How is Stock Synthesis tested?

Stock Synthesis is tested by running this set of models and seeing if the same results for key model quantities remains the same relative to a "reference run" (typically the last release of Stock Synthesis). If there are changes, the Stock Synthesis Development Team investigates if these changes are expected or not based on the revisions. If they are expected, then the output files for the reference run are updated. If not, then fixes are made so that the model has the same results. Note that sometimes different model results occur because the model results are not stable; in this case, the model is revised to be more stable or may be excluded from the test set.

## What features do these models have?

Most of these models have at least 1 unique feature.

| Model | Features | Approx. Run Times |
| ----- | -------- | ----------------- |
| BigSkate_2019 | Uses F method 3 (hybrid), Cessation growth model, Catchability time blocks, catchability priors,  discard data | 0 hours, 5 minutes, 43 seconds |
| BlackRf_2015_WA | Uses F method 1 (Pope's approximation), Mirrored selectivity, input variance adjustments | 0 hours, 20 minutes, 7 seconds |
| BlueDeaconRF_2017 | Mirrored selectivity, selectivity time blocks, input variance adjustment, ageing error| 0 hours, 14 minutes, 36 seconds |
| Bocaccio_2015 | Mirrored selectivity, Selectivity time blocks, input variance adjustment  | 0 hours, 29 minutes, 56 seconds |
| CanaryRf_2015 | spatial model with deviations in recruitment allocation, no movement | 0 hours, 46 minutes, 32 seconds |
| China_2015_Central | Mirrored selectivity, input variance adjustment | 0 hours, 24 minutes, 9 seconds |
| Darkblotched_2015   |  Maturity option 6 (read length-maturity) | 0 hours, 29 minutes, 12 seconds |
| Empirical_Wtatage_Age_Selex | Empirical Weight at age model, with empirical (as random walk) age selectivity | 0 hours, 1 minutes, 18 seconds |
| growth_morphs | Uses growth morphs | 0 hours, 4 minutes, 38 seconds |
| growth_timevary | Time-varying growth using time blocks | 0 hours, 0 minutes, 54 seconds |
| Hake_2018 | Empirical weight at age model, Dirichlet Multinomial comps weighting, time varying selectivity using annual deviations | 0 hours, 1 minutes, 5 seconds |
| Hake_2019_semi-parametric_selex | Empirical Weight at age model, with semiparametric (2DAR) selectivity | 0 hours, 1 minutes, 7 seconds |
| KelpGreenling2015 | Maturity option 6 (read length-maturity), Mirrored selectivity, input variance adjustment | 0 hours, 4 minutes, 59 seconds |
| Petrale2015 | Catchability annual parameter deviations, Selectivity time blocks, Likelihood emphasis factors (lamdas), Discard data, Mean body size data | 0 hours, 56 minutes, 21 seconds |
| POP_2017 | Retention selectivity parameters Selectivity time blocks, Logistic selectivity, Likelihood emphasis factors (lamdas)| 0 hours, 31 minutes, 23 seconds |
| Sablefish2015 | cubic spline selectivity with male offset | 1 hours, 16 minutes, 4 seconds |
| seasonal_with_size_comp | uses seasons | 0 hours, 34 minutes, 59 seconds |
| Simple | Uses sd reporting and mean size-at-age data | 0 hours, 1 minutes, 43 seconds |
| Simple_NoCPUE | No index of abundance | 0 hours, 1 minutes, 35 seconds |
| Simple_with_Discard | Uses discards | 0 hours, 2 minutes, 7 seconds |
| Spinydogfish_2011 | Stock Recruitment option 7 (survival 3 parameter)  | 0 hours, 26 minutes, 35 seconds |
| tagging_mirrored_sel | Time varying growth using annual deviations, Tagging data and movement parameters, selectivity, environmental variable data | 0 hours, 2 minutes, 49 seconds |
| three_area | Spatial model with movement | 0 hours, 4 minutes, 32 seconds |
| three_area_nomove | Spatial model with no movement | 0 hours, 3 minutes, 32 seconds |
| vermillion_snapper | Uses F method 2 (estimated parameters) | 0 hours, 3 minutes, 42 seconds |
| Widow_2015 | Catchability parameter deviations, Time blocks on selectivity | 0 hours, 35 minutes, 47 seconds |
| YelloweyeRF_2017 | spatial age-structured production model, no movement | 0 hours, 44 minutes, 0 seconds |
| YellowtailRF_2017 | Selectivity time blocks, Dummy observations in indices of abundance (to get expected values), Discard data | 0 hours, 26 minutes, 22 seconds |

# Code of conduct

This project and everyone participating in it is governed by the [NMFS Fisheries Toolbox Code of Conduct](https://github.com/nmfs-fish-tools/Resources/blob/master/CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [fisheries.toolbox@noaa.gov](mailto:fisheries.toolbox@noaa.gov). Note that the maintainers of SS do not have access to this email account, so unacceptable behavior of the maintainers can also be reported here.

The NFMS Fisheries Toolbox Code of Conduct is adapted from the [Contributor Covenant][homepage], version 1.4,
available at https://www.contributor-covenant.org/version/1/4/code-of-conduct.html

[homepage]: https://www.contributor-covenant.org

For answers to common questions about this code of conduct, see
https://www.contributor-covenant.org/faq

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”
