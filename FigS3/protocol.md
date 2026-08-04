# Reproducibility Protocol for LEfSe Biomarker Discovery (Figure A & B)

This figure identifies the taxonomic biomarkers that characterize the differences between host species (Panel A) and between seasons within each species (Panel B) using the LEfSe algorithm.

## 1. Statistical Framework (LEfSe Algorithm)
Differential taxonomic features were identified using **LEfSe (Linear Discriminant Analysis Effect Size)**. The analysis was performed following a three-step statistical approach:
- **Step 1: Kruskal-Wallis Test.** A non-parametric factorial Kruskal-Wallis rank-sum test was used to detect features with significant differential abundance across groups (Alpha < 0.05).
- **Step 2: Wilcoxon Test.** (Optional/Where applicable) Pairwise Wilcoxon tests were used to ensure consistency across subclasses.
- **Step 3: LDA Effect Size.** **Linear Discriminant Analysis (LDA)** was used to estimate the effect size of each differentially abundant feature. 
  - **Threshold:** A logarithmic **LDA score > 4.0** was set as the cut-off for identifying significant biomarkers.

## 2. Visualization of Cladograms (ImageGP)
The taxonomic hierarchy of these biomarkers was visualized using the **Cladogram module** on the **ImageGP platform** (http://www.bic.ac.cn/ImageGP/):
- **Cladogram Structure:** The concentric rings represent taxonomic levels from Phylum (innermost) to Genus/Species (outermost). Each node (circle) represents a specific taxon.
- **Color Coding:** 
  - **Panel A:** Taxa are colored based on the species they are significantly enriched in (e.g., Red for Siberian ibex, Green for Marco Polo sheep, Blue for Blue sheep).
  - **Panel B:** Taxa are colored by season (e.g., Red for Cold season, Blue for Warm season) within each specific host species.
- **Legend:** Yellow nodes indicate taxa that are not significantly different (non-biomarkers).

## 3. Multi-Panel Integration and Refinement (Adobe Illustrator)
Individual cladograms and LDA bar plots (if applicable) were exported from ImageGP and organized in **Adobe Illustrator (AI)**:
- **Alignment:** Panels (A) and (B) were arranged to contrast inter-species differences (A) with intra-species seasonal shifts (B).
- **Text Refinement:** 
  - The taxonomic labels were checked for clarity.
  - Titles for "Cold season", "Warm season", and host species names were added.
- **Color Synchronization:** The colors for species (Siberian ibex, Marco Polo sheep, Blue sheep) and seasons (Cold vs. Warm) were unified with all other figures in the manuscript to maintain visual coherence.

## 4. Software Summary
- **LEfSe:** For biomarker discovery (KW test and LDA score calculation).
- **ImageGP:** For high-quality cladogram generation.
- **Adobe Illustrator:** For layout assembly, labeling, and aesthetic consistency.