#DILALATUOLIU2026iMetaOmics

This repository contains the official data, code, and reproducibility instructions for the manuscript:
"Gut microbiome seasonality is associated with dietary plasticity and coexistence in three sympatric Pamir ungulates" (Submitted to iMetaOmics, 2024).

Authors: Dilala Tuoliu, Lijiao Zhang, Muyang Wang*, Hongchen Jiang*, Weikang Yang*

## Data Availability
The raw sequencing and metabolomics data generated in this study have been deposited in the National Genomics Data Center (CNCB-NGDC). Access them via the following links:

* **Shotgun metagenome data:**
  * BioProject: PRJCA047018
  * GSA Accession: [CRA030655](https://ngdc.cncb.ac.cn/gsa/browse/CRA030655)
* **16S rRNA amplicon sequencing data:**
  * BioProject: PRJCA047075
  * GSA Accession: [CRA048087](https://ngdc.cncb.ac.cn/gsa/browse/CRA048087)
* **Dietary metabarcoding data:**
  * BioProject: PRJCA070118
  * GSA Accession: [CRA048084](https://ngdc.cncb.ac.cn/gsa/browse/CRA048084)
* **Metabolomics datasets:**
  * BioProject: PRJCA055923
  * OMIX Accession: [OMIX014376](https://ngdc.cncb.ac.cn/omix/release/OMIX014376)

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
