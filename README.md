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

*Model table will be added here, highlighting these features*

## Disclaimer

“The United States Department of Commerce (DOC) GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. DOC has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any claims against the Department of Commerce stemming from the use of its GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.”
