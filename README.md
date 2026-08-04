#DILALATUOLIU2026iMetaOmics

This repository contains the official data, code, and reproducibility instructions for the manuscript:
"Gut microbiome seasonality is associated with dietary plasticity and coexistence in three sympatric Pamir ungulates" (Submitted to iMetaOmics, 2024).

Authors: Dilala Tuoliu, Lijiao Zhang, Muyang Wang*, Hongchen Jiang*, Weikang Yang*

##Data Availability
The raw sequencing data generated in this study have been deposited in the Genome Sequence Archive (GSA) at the National Genomics Data Center (CNCB-NGDC).
* **BioProject ID:** [PRJCAxxxxxx](Link_to_BioProject)
* **GSA Accession:** [CRAxxxxxx](Link_to_GSA)

## Repository Structure & Reproducibility Guide
To facilitate reproducibility, this repository is organized by Figures. You can navigate into the specific Figure folder to find the corresponding scripts or software instructions.

* `data/` : Contains the basic shared datasets for down-stream analysis.
  * `metadata.tsv` : Sample grouping and metadata information.
  * `16S_ASV_table.tsv` : Normalized ASV abundance table.

- /Fig1 # Venn diagram of microbial and diet distribution
  - `venn_input.tsv`: The formatted input file used for ImageGP.
  - `protocol.md`: Detailed parameters for ImageGP and post-processing steps in Adobe Illustrator.



## System Requirements & Dependencies
To ensure the scripts run correctly, please verify your environment:
Script-based environments:
* R version: 4.2.2 or higher
* R Packages: `ggplot2 (v3.4.0)`, `vegan (v2.6-4)`, `ggpicrust2 (v1.3.0)`, `phyloseq (v1.42.0)`

Third-party Software / Web tools:
* STAMP (v2.1.3)
* iTOL website (v6.8.1)

##Citation
If you use the data or code in this repository, please cite our paper:
Dilala Tuoliu,Lijiao Zhang, Muyang WANG, Wenxuan Xu, Kathreen Ruckstuhl, António Alves da Silva,Joana Alves,Hongchen Jiang,Weikang Yang.2026"Gut microbiome seasonality is associated with dietary plasticity and coexistence in three sympatric Pamir ungulates"  iMetaOmics. (In review)
