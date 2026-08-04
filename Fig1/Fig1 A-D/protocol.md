# Reproducibility Protocol for Figure 1 (Venn Diagram)

This figure was generated using a combination of online bioinformatic tools and manual graphic refinement.

### 1. Online Tool
- **Platform:** [ImageGP](https://www.bic.ac.cn/ImageGP/) (Venn Diagram module)
- **Reference:** Chen, T., Liu, Y. X., & Huang, L. (2022). ImageGP: An easy-to-use data visualization web server for scientific publications. *iMeta*, 1(1), e5.

### 2. Input Data Preparation
- The raw ASV table was processed into a long-format table where:
  - Column 1 (`TAX`): ASV IDs.
  - Column 2 (`Group`): Group names (e.g., CS, OS, PS).
- The formatted file (e.g., `diet_summer.txt` ) is provided in this folder.

### 3. Web Tool Parameters
To reproduce the base Venn diagrams, upload `diet_summer.txt` to ImageGP with the following settings:
- **Tool:** Venn Diagram
- **Set Column containing all items:** TAX
- **Set Column containing all sets information:** Group
- **Color vector:** Set3 (or manual color codes: #7CAE00, etc.)
- **Output Format:** PDF/SVG for vector editing.

### 4. Post-processing (Manual Editing)
The final figure was assembled in **Adobe Illustrator (AI)**:
1. **Layout:** Four individual Venn diagrams (Summer/Winter vs. ASV/Genus) were aligned into a 2x2 grid.
2. **Annotation:** 
   - Panel labels (A, B, C, D) and titles (Summer, Winter) were added.
   - **Percentages:** Percentages for each intersection were calculated manually based on the raw counts and added to the plot for clarity.
   - Legend and font sizes were standardized to 8-10 pt (Arial).