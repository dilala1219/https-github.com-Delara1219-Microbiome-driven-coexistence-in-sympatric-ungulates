# Reproducibility Protocol for PLS-DA Metabolomic Profiling (Figure A & B)

This figure illustrates the multivariate differences in metabolic profiles among the three host species during the Cold season (Panel A) and Warm season (Panel B) using Partial Least Squares Discriminant Analysis (PLS-DA).

## 1. Data Preprocessing
To reduce the influence of high-concentration metabolites and account for the wide dynamic range of metabolic data, the raw metabolic intensity matrix underwent the following pre-treatment:
- **Normalization:** Total sum normalization was applied to ensure comparability between samples.
- **Scaling:** **Pareto scaling** was performed to mean-center the data and adjust the importance of low-abundance metabolites without over-inflating background noise.
- **Log Transformation:** Log10 was applied to stabilize the variance.

## 2. Multivariate Statistical Analysis (PLS-DA)
A supervised **PLS-DA model** was constructed to maximize the separation between the three species groups (CS/OS/PS in Cold; CW/OW/PW in Warm):
- **Algorithm:** The analysis was performed using the **Cloudtutu platform** (https://www.cloudtutu.com/), which utilizes the R package `mixOmics` or `ropls` for multivariate modeling.
- **Supervised Learning:** Unlike PCA, PLS-DA incorporates group information to identify the metabolic features that contribute most to the discrimination between species.

## 3. Model Validation and Performance
The reliability of the PLS-DA model was evaluated using two key parameters:
- **$R^2Y$ (Cumulative):** Represents the "goodness of fit," indicating the proportion of variation in the response (groups) explained by the model. (As shown in Figure A: $R^2Y = 0.981$; Figure B: $R^2Y = 0.988$).
- **$Q^2Y$ (Cumulative):** Represents the "predictability" of the model, calculated via cross-validation (typically 7-fold). 
- **Interpretation:** In both seasons, $Q^2Y$ values (> 0.8) indicate high model stability and strong predictive power, confirming that the metabolic differences between species are robust.

## 4. Visualization and Refinement
- **Score Plots:** Samples are plotted based on the first two latent variables (P1 and P2). The percentage of variance explained by each component is indicated on the axes.
- **Confidence Ellipses:** **95% confidence ellipses** were generated for each group to visualize the intra-group variance and inter-group separation.
- **Post-processing (Adobe Illustrator):** The high-resolution vector graphics (PDF/SVG) were exported from Cloudtutu and refined in **Adobe Illustrator**:
  - Legends were unified to match the color schemes (Red, Blue, Green) used for the three species throughout the manuscript.
  - Text fonts and axis labels were standardized for publication quality.

## 5. Software Summary
- **Cloudtutu Platform:** For PLS-DA modeling, scaling, and $Q^2$ calculation.
- **Adobe Illustrator:** For final figure layout, color synchronization, and labeling.