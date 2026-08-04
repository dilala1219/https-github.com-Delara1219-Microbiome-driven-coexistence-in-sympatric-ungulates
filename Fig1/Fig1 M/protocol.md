### Correlation and Mantel Test Analysis (Figure M)

To explore the relationship between the dietary family composition and key microbial families, Mantel tests were performed within each experimental group (CS, CW, OS, OW, PS, PW).

1. **Intra-microbial Correlations:** Pearson correlation coefficients were calculated between the relative abundances of the selected microbial families.
2. **Mantel Test:** The `linkET` package was used to conduct Mantel tests between the Bray-Curtis distance matrix of the overall dietary composition (Family level) and the Euclidean distance of individual microbial families.
3. **Visualization:** 
   - The lower-triangle heatmap represents the correlation between microbial families (red for positive, blue for negative).
   - The edge lines (links) represent the Mantel test results. 
   - **Line Color:** Indicates the significance level (P-value: < 0.01, 0.01-0.05, > 0.05).
   - **Line Width:** Represents the Mantel’s r statistic (r < 0.2, 0.2-0.4, >= 0.4).
   - **Line Type:** Solid lines represent positive correlations, while dashed lines represent negative correlations.
4. **Software:** R (version 4.3), `linkET` package (v0.0.7), and final layout assembly in Adobe Illustrator.