# ss3-test-models

Stock Synthesis models and scripts used for testing

## Repository structure

All SS3 models are in the "models" subfolder. All testing scripts and specifications files used by the SS3 development team are in the ".github" subfolder.

## Can I open a pull request to add my own models to this repository?

It is always helpful to have more examples of Stock Synthesis models! Please open a pull request in the [ss3-user-examples repository](https://github.com/nmfs-ost/ss3-user-examples) to share your own models publicly.

## Why are these models not in the ss3-user-examples repository?

This repository houses models used for testing Stock Synthesis. These are often based on stock assessment models, but may not be the final model version or may have been altered for testing purposes. In addition, the data in the model files should not be used as data sources, as the data may have been altered for testing purposes.

## How is Stock Synthesis tested?

Regression tests are the primary way that Stock Synthesis is tested. Regression tests are conducted automatically using Github actions. Each time, the set of models in ss3-test-models are run and then key model quantities are checked to determine if they have changed or remained the same relative to a reference run.

## What features do these models have?

Most of these models have at least 1 unique feature. The table below includes some key ones, as well as the approximate time it takes to run the model with estimation.

| Model | Features | Approx. Run Times |
| ----- | -------- | ----------------- |
| BigSkate_2019 | Uses F method 3 (hybrid), Cessation growth model, Catchability time blocks, catchability priors,  Mirrored and DN selectivity, discard data, conditional age at length data, Input var. adjustments | 0 hours, 5 minutes, 43 seconds |
| Empirical_Wtatage_Age_Selex | Empirical Weight at age model, with empirical (as random walk) age selectivity | 0 hours, 1 minutes, 18 seconds |
| growth_morphs | Uses 5 platoons, 1 growth pattern| 0 hours, 4 minutes, 38 seconds |
| growth_timevary | Time-varying growth using time blocks, Fmethod 1 | 0 hours, 0 minutes, 54 seconds |
| Hake_2018 | Empirical weight at age model, Dirichlet Multinomial comps weighting, time varying selectivity using annual deviations | 0 hours, 1 minutes, 5 seconds |
| Hake_2019_semi-parametric_selex | Empirical Weight at age model, with semiparametric (2DAR) selectivity | 0 hours, 1 minutes, 7 seconds |
| KelpGreenling2015 | Maturity option 6 (read length-maturity), Mirrored selectivity, input variance adjustment | 0 hours, 4 minutes, 59 seconds |
| Sablefish2015 | cubic spline selectivity with male offset, DN length selectivity, special recdev survey | 0 hours, 13 minutes, 9 seconds |
| Simple | Uses sd reporting and mean size-at-age data | 0 hours, 1 minutes, 43 seconds |
| Simple_Lorenzen_tv_trend | Lorenzen natural morality, lambdas, extra stddev input (M-at-age), tv trends on selectivity (-1,-2,-3) | 0 hours, 2 minutes, 2 seconds |
| Simple_NoCPUE | No index of abundance | 0 hours, 1 minutes, 35 seconds |
| Simple_with_Discard | Uses discards | 0 hours, 2 minutes, 7 seconds |
| Simple_with_DM_sizefreq | Generalized size-composition data (Sizefreq) with Dirichlet-multinomial | 0 hours, 7 minutes, 42 second |
| Spinydogfish_2011 | Stock Recruitment option 7 (survival 3 parameter), fecundity option 4  | 0 hours, 4 minutes, 48 seconds |
| tagging_mirrored_sel | Time varying growth using annual deviations, Tagging data and movement parameters, selectivity, environmental variable data | 0 hours, 2 minutes, 49 seconds |
| three_area_nomove | Spatial model with areas, no movement | 0 hours, 3 minutes, 32 seconds |
| two_morph_seas_areas  | 2 area model with movement, 2 growth patterns, 2 seasons, uses generalized size comp | 0 hours, 3 minutes, 35 seconds |
| vermillion_snapper | Uses F method 2 (estimated parameters) | 0 hours, 3 minutes, 42 seconds |
| vermillion_snapper_F4 | Uses F method 4 | 0 hours, 2 minutes, 52 seconds |

# Code of conduct

This project and everyone participating in it is governed by the [NMFS Fisheries Toolbox Code of Conduct](https://github.com/nmfs-fish-tools/Resources/blob/master/CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [fisheries.toolbox@noaa.gov](mailto:fisheries.toolbox@noaa.gov). Note that the maintainers of SS do not have access to this email account, so unacceptable behavior of the maintainers can also be reported here.

The NFMS Fisheries Toolbox Code of Conduct is adapted from the [Contributor Covenant][homepage], version 1.4,
available at https://www.contributor-covenant.org/version/1/4/code-of-conduct.html

[homepage]: https://www.contributor-covenant.org

For answers to common questions about this code of conduct, see
https://www.contributor-covenant.org/faq

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”
