# Reproducibility Protocol for Dietary and Microbial Composition Profiles (FigureS2 A & B)

This figure characterizes the taxonomic composition of diet (Panel A) and gut microbiota (Panel B) for three wild herbivore species (Siberian ibex, Marco Polo sheep, and Blue sheep) at the individual sample level.

## 1. Data Preparation and Taxonomic Profiling
- **Dietary Analysis (A):** Plant compositions were identified using DNA metabarcoding of the trnL region. Sequences were assigned to plant taxa using the NCBI database].
- **Microbial Analysis (B):** Microbial communities were profiled via 16S rRNA gene sequencing (V3-V4 region). Taxonomic assignment was performed using the SILVA database.
- **Normalization:** Raw reads were converted to **Relative Abundance** (ranging from 0 to 1.0). To simplify visualization, only the top 20 and 35 most abundant taxa are displayed individually, while the remaining taxa are grouped into the "others" category.

## 2. Initial Visualization (ImageGP)
Base plots were generated using the **ImageGP platform** (http://www.bic.ac.cn/ImageGP/):
- **Tool:** Stacked Bar Plot module.
- **Input:** A matrix of relative abundances with samples as columns and taxonomic groups as rows.
- **Parameters:** 
  - Samples were ordered by species group.
  - A consistent color palette was initially applied to distinguish different taxonomic ranks Family and Genus level.

## 3. Composite Figure Assembly (Adobe Illustrator)
To meet publication standards and enhance interpretability, the raw charts from ImageGP were refined in **Adobe Illustrator (AI)**:
- **Layout Alignment:** Six individual charts (3 species × 2 data types) were precisely aligned to ensure consistent Y-axis (Abundance 0.00 to 1.00) and X-axis (Individual sample IDs) scaling.
- **Species Identification:** Graphical silhouettes (icons) representing the Siberian ibex, Marco Polo sheep, and Blue sheep were added above each column to intuitively identify the host species.
- **Legend Standardization:** Legends were cleaned and unified. Taxonomic names were italicized where appropriate.
- **Color Refinement:** Following reviewer suggestions, specific colors were adjusted to ensure that the same taxonomic groups (where applicable) maintain visual consistency across different panels.

## 4. Software Summary
- **ImageGP:** For high-throughput generation of individual stacked bar charts.
- **Adobe Illustrator:** For final multi-panel integration, iconography, and aesthetic polishing.