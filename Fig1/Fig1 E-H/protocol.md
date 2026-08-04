# Reproducibility Protocol for Diversity Analysis (Figure E)

This figure illustrates the dietary and gut microbial alpha-diversity (Shannon index) across different seasons and species. The final visualization is a composite figure generated via ImageGP and refined in Adobe Illustrator.

## 1. Data Preparation
- **Input Table:** A metadata file containing columns for `SampleID`, `Season` (Summer/Winter), `Species` (CS, OS, PS), and calculated alpha-diversity indices (e.g., `Shannon`).
- The source data used for this analysis is provided in `diversity_data.csv`.

## 2. Base Plot Generation (ImageGP)
- **Tool:** [ImageGP](https://www.bic.ac.cn/ImageGP/) (Bar plot with jitter points module).
- **Procedure:**
  1. Data for **Summer** and **Winter** were uploaded separately to the "Grouped Bar Plot" module.
  2. **Intra-seasonal Analysis:** Within each season, the diversity differences among the three species were calculated. 
  3. **Letter Labeling:** Significant differences (P < 0.05) between species within the same season were determined using One-way ANOVA followed by Tukey's HSD post-hoc test (or Kruskal-Wallis test). These were labeled with letters (a, b, ab) directly in the ImageGP interface.
  4. The resulting plots were exported in **PDF** format.


## 3. Statistical Analysis Workflow (R Environment)

### A. Two-Way ANOVA
To evaluate the effects of species, season, and their interaction, a **Two-way ANOVA (Type II)** was performed using the `car` package in R:
- **Model:** `aov(diversity ~ species * season)`
- **Results:** 
  - The `season` effect was found to be highly significant (P < 0.001).
  - The `species` effect and the interaction (`species:season`) were evaluated to determine further post-hoc testing strategies.

### B. Simple Effects Analysis (Post-hoc Comparisons)
Since we aimed to compare the seasonal differences *within each species*, we used **Estimated Marginal Means (EMMs)** via the `emmeans` package:
1. **Calculation of EMMs:** Estimated means and 95% Confidence Intervals (CIs) were calculated for each species in each season using:
   `emm_results <- emmeans(model, ~ season | species)`
2. **Pairwise Comparisons:** Seasonal differences (Summer vs. Winter) within each species were tested using:
   `pairs(emm_results)`
3. **P-value Significance:** 
   - Differences with **P < 0.05** were marked with `*` in the figure.
   - Differences with **P >= 0.05** were marked as `ns` (non-significant).
   - *Example from results:* Species P showed a significant seasonal difference (P = 0.0004), while Species C (P = 0.0916) and O (P = 0.3782) did not.

### C. Intra-seasonal Comparisons (Letter Labeling)
For comparisons between the three species within the same season:
- One-way ANOVA followed by **Tukey’s HSD post-hoc test** was used to assign letter labels (a, b, ab). Groups sharing the same letter are not significantly different at the alpha level of 0.05.


## 4. Final Assembly (Adobe Illustrator)
- **Base Plot:** Bar plots with jittered points were generated using **ImageGP**.
The final panel was assembled in **Adobe Illustrator (AI)**:
1. **Merging:** The Summer and Winter bar plots were aligned side-by-side.
2. **Annotation:** The cross-seasonal significance bars (horizontal lines with `*` or `ns`) were manually added based on the results from Step 3.
3. **Refinement:** Colors, axis labels, and legend positions were standardized for publication quality.

## 5. References
- **ImageGP:** Chen, T., Liu, Y. X., & Huang, L. (2022). ImageGP: An easy-to-use data visualization web server for scientific publications. *iMeta*, 1(1), e5.