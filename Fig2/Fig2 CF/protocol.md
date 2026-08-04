# Reproducibility Protocol for Intra-species Seasonal Functional Differences (Figure2 C & F)

This protocol describes the statistical method used to identify KEGG pathways (Panel C) and CAZy families (Panel F) that significantly differ between Summer and Winter within each of the three wild herbivore species.

## 1. Data Preparation
- **Profiles:** Relative abundance tables for KEGG pathways (Level 3) and CAZy families.
- **Grouping:** Samples were categorized by `Season` (Summer vs. Winter) for each host species (Blue sheep, Siberian ibex, and Marco Polo sheep) separately.

## 2. Statistical Analysis (STAMP Software)
The analysis was performed using **STAMP software (v2.1.3)**:
- **Statistical Test:** **Wilcoxon rank-sum test** (Non-parametric). This test was chosen to account for the non-normal distribution of functional abundance data.
- **Confidence Interval Method:** **Welch's inverted** (or **95% confidence intervals**). The "Difference in mean proportions" plot was used to visualize the effect size.
- **Multiple Testing Correction:** The **Benjamini-Hochberg (FDR)** method was applied to control for false discoveries arising from multiple comparisons.
- **Filtering Criteria:** Only features with an **adjusted P-value < 0.05** were considered significantly enriched in either season.

## 3. Visualization and Interpretation
- **Left Panel (Bar Plot):** Displays the mean proportion (%) of each pathway/enzyme in Summer (orange) vs. Winter (blue).
- **Middle Panel (CI Plot):** Displays the difference in mean proportions between seasons. A positive difference indicates enrichment in Winter, while a negative difference indicates enrichment in Summer (depending on the subtraction order set in STAMP).
- **Right Panel:** Displays the exact P-values for each comparison.

## 4. Post-processing and Color Standardization (Adobe Illustrator)
Following reviewer feedback to ensure visual consistency across the entire manuscript:
1. **SVG Export:** The plots were exported from STAMP in `.svg` format.
2. **Color Unification:** The default STAMP colors were manually updated in **Adobe Illustrator (AI)**. 
   - **Summer** was unified to a specific [Insert Color, e.g., Light Orange] across all figures.
   - **Winter** was unified to a specific [Insert Color, e.g., Sky Blue] across all figures.
3. **Layout Assembly:** The six sub-panels (3 species × 2 functional databases) were aligned and titled to create the final composite Figure C and F.

## 5. Software Summary
- **STAMP v2.1.3:** For statistical testing (Wilcoxon) and effect size calculation.
- **Adobe Illustrator:** For graphic refinement and cross-figure color synchronization.