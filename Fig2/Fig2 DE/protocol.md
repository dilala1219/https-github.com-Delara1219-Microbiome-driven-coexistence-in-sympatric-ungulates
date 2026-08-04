# Reproducibility Protocol for CAZy Functional Analysis (Figure 2 DE)

This figure compares the abundance of Carbohydrate-Active EnZymes (CAZy) families among three wild herbivore species across two seasons. The analysis highlights the divergent strategies for complex polysaccharide degradation.

## 1. Bioinformatic Annotation
- **Database:** Sequences were aligned against the **CAZy database** (Carbohydrate-Active EnZymes Database).
- **Tools:** Annotation was performed using DIAMOND.
- **Classification:** Results were categorized into major classes: Glycoside Hydrolases (GHs), GlycosylTransferases (GTs), Polysaccharide Lyases (PLs), Carbohydrate Esterases (CEs), Auxiliary Activities (AAs), and Carbohydrate-Binding Modules (CBMs).

## 2. Data Transformation
- **Normalization:** Relative abundance of pathways was calculated.
- **Scaling:** To handle the high dynamic range of enzyme family abundances, data were **$\log_{10}(x+1)$ transformed** prior to statistical analysis and visualization.

## 3. Statistical Workflow (GenesCloud DiffStat)
The differential abundance analysis was conducted on the **GenesCloud platform** (https://www.genescloud.cn/chart/DiffStat):
- **Global Test:** The **Kruskal-Wallis H test** (non-parametric ANOVA) was applied to identify CAZy families with significant variation across the three species.
- **Post-hoc Test:** For families showing overall significance (P < 0.05), **Dunn’s test** was employed for pairwise comparisons.
- **Multiple Testing Correction:** Adjusted P-values were calculated using the **Benjamini-Hochberg (FDR)** method. 
- **Visualization:** The box plots display the distribution of transformed abundances. In the right panel, the exact P-value (global) and `*` (significant pairwise difference via Dunn's test) are provided.

## 4. Aesthetic Consistency and AI Refinement
Based on peer-review feedback regarding color consistency across all functional figures:
1. **Manual Color Mapping:** The base plots for Summer and Winter CAZy profiles were exported from GenesCloud and imported into **Adobe Illustrator (AI)**.
2. **Color Unification:** The fill colors for the box plots were manually synchronized with the KEGG and microbial composition figures to ensure that each species is represented by a consistent color throughout the manuscript.
3. **Typography:** Axis titles and legend labels were refined for publication-quality clarity.

## 5. Software Summary
- **GenesCloud DiffStat:** For KW/Dunn's statistical testing and initial plotting.
- **Adobe Illustrator:** For final aesthetic integration and color standardization.