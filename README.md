# [Brain tumour genetic network signatures of survival](URL)
# Article codebase

![cover_image](assets/CoverImage.png)

## Table of Contents
- [What is this repository for?](#what-is-this-repository-for)
- [Code](#code)
- [Usage queries](#usage-queries)
- [Citation](#citation)
- [Funding](#funding)


## What is this repository for?
This is the codebase for the article: [Brain tumour genetic network signatures of survival](URL).

**Tumour heterogeneity is increasingly recognized as a major obstacle to therapeutic success across neuro-oncology.** Gliomas are characterised by *distinct combinations of genetic and epigenetic alterations*, resulting in **complex interactions across multiple molecular pathways.**

Predicting disease evolution and prescribing individually optimal treatment **requires statistical models complex** enough to capture the intricate (epi)genetic structure underpinning oncogenesis. 

Here, we formalize this task as the inference of distinct patterns of connectivity within hierarchical latent representations of genetic networks. Evaluating multi-institutional clinical, genetic, and outcome data from 
- **4023 glioma patients**,
- **over 14 years**,
- **across 12 countries**,

we employ [Bayesian generative stochastic block modelling](https://dx.doi.org/10.1002/9781119483298.ch11) to reveal a hierarchical network structure of tumour genetics spanning molecularly confirmed glioblastoma, IDH- wildtype; oligodendroglioma, IDH-mutant and 1p/19q codeleted; and astrocytoma, IDH-mutant. 

![figure1](assets/Figure1.jpg)
**Data: distributions by geography, tumour (epi)genetics, diagnoses, and demographics.** A) Geographical distribution of all neuro-oncology patient data in the UK referred to our Division of Neuropathology between 2006-2020 for molecular diagnostics, in logarithmic axis per the colour bar. B) Number of mutant samples across the n=4023 glioma patient cohort. C) Distribution of WHO CNS5 diagnoses in cohort. D) Age kernel density estimators for male and female, subdivided to the diagnoses with corresponding colours as in panel C.

![figure5](assets/Figure5.jpg)
**Graph patient genetic mapping enables richer, more informative phenotyping.** Radial graph of nested, degree-corrected, and multivariate binomially weighted stochastic block model revealing the community structure of patients and the genetics of their brain tumour. Hierarchical levels are annotated from level 0 (L0) to level 7 (L7). For visualisation purposes, communities are colour-coded by the second level blocks (L2) of the hierarchical community structure. Around the radial graph are the breakdown of median survival and box and whisker plots for the coefficients and 95% credible intervals of genetic loadings, where the coloured border of the plots depicts the corresponding community. All boxplots where the error-bar does not cross the vertical zero-line are significant, with features left of the vertical zero-line favouring the wildtype, and right of the zero-line favouring mutation.


Our findings illuminate the complex dependence between features across the genetic landscape of brain tumours, and show that **generative network models reveal distinct signatures of survival with better prognostic fidelity than [current gold standard diagnostic categories](https://doi.org/10.1093/neuonc/noab106).**

![figure6](assets/Figure6.jpg)
**Graph patient genetic mapping offers higher fidelity prognosis.** A) Radial graph of a nested, degree-corrected, and binomially weighted stochastic block model revealing the community structure of patients based on tumour genetics. Communities are colour coded by the hazard ratio of the survival model of the second level blocks (L2). B) Pie chart of brain tumour diagnoses colour-coded by the hazard ratio of the survival model with the diagnostic label. In a-b), darker colours convey a poorer prognosis (hazard ratio > 1), and conversely lighter colours a more favourable one (hazard ratio < 1). C) Box and whisker plot illustrating the hazard ratios with 95% confidence interval of the second level blocks of the stochastic block model community structure. D) Box and whisker plot illustrating the hazard ratios with 95% confidence interval of the tumour diagnoses and raw genetics. E) Survival plot of the second level blocks of the stochastic block model community structure illustrates a rich variation in survival, colour-coded by the blocks in both panels A, C) and on the previous figure. F) Survival plot of the tumour diagnoses shows coarser forecasting of patient prognosis, colour-coded by the diagnoses of panels B.


![figure7](assets/Figure7.jpg)
**Network signatures forecast survival better than WHO CNS5 diagnosis or raw genetic and epigenetic features.** A) Model predictive performance evaluated by cross- validated concordance index of Cox’s proportional hazard model shows network signatures outperform both models of diagnosis and the original genetic information in forecasting survival. B-D) Model predictive performance evaluated by pseudo-R<sup>2</sup> and WAIC of Bayesian logistic regression survival models for 12-month (panel B), 24-month (panel C) and 36-month (panel D) survival shows network signatures outperform both models of diagnosis and the original genetic information in forecasting survival, and with more favourable fits by WAIC (lower is better).


## Code
Example code for all model development and post-hoc analysis detailed within the [article](URL) is *open sourced* [here](code/). These are as follows:

### [1_GenerateGraph.ipynb](code/1_GenerateGraph.ipynb)
Illustrates the preliminary data wrangling, node and edge-list curation to pass this to a graph object with a subset of the original data. Also shown are minimum spanning tree visualisations.


### [2_ModelGraph.ipynb](code/2_ModelGraph.ipynb)
Demonstrates fitting the generative, hierarchical stochastic block model of all *patients as nodes*, and *edges depicting the multivariate similarity between genetic/epigenetic tests*. Initial fitting is undertaken with the [stochastic block model](https://dx.doi.org/10.1002/9781119483298.ch11) with further optimisation via [MCMC](https://dx.doi.org/10.1103/PhysRevE.89.012804).

N.B. in this toy example we utilise only the minimum spanning tree, and reduce the number of iterations in MCMC. For a full analysis (as done in the [article](URL)), we recommend using the non-thresholded graph, and MCMC iterations should be increased.

### [3_VisualiseGraph.ipynb](code/3_VisualiseGraph.ipynb)
Shows visualisation of the results, and projection of survival data.


### [4_SurvivalModelling.m](code/4_SurvivalModelling.m)
Shows the Bayesian Regression survival modelling implemented with [BayesReg](https://www.mathworks.com/matlabcentral/fileexchange/60823-flexible-bayesian-penalized-regression-modelling) in MATLAB.



## Usage queries
Via github issue log or email to j.ruffle@ucl.ac.uk.


## Citation
If using these works, please cite the following [article](URL).

James K Ruffle, Robert Gray, Samia Mohinta, Guilherme Pombo, Chaitanya Kaul, Harpreet Hyare, Geraint Rees, Parashkev Nachev. Brain tumour genetic network signatures of survival. Brain. 2023. DOI X


## Funding
The Wellcome Trust; UCLH NIHR Biomedical Research Centre; Medical Research Council; Guarantors of Brain; NHS Topol Digital Fellowship.
![funders](assets/funders.png)