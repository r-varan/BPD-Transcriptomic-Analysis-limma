# BPD-Transcriptomic-Analysis-limma
Differential Gene Expression Analysis of Bipolar Disorder via limma.

## Project Overview

Project Title: Gene Expression Analysis of Bipolar Disorder
Date: 2023-12-14
Dataset Citation: Ryan MM, Lockstone HE, Huffaker SJ, Wayland MT et al. Gene expression analysis of bipolar disorder reveals downregulation of the ubiquitin cycle and alterations in synaptic genes. Mol Psychiatry 2006 Oct;11(10):965-78. PMID: 16894394

This project involves a differential gene expression analysis to compare healthy control groups and individuals with Bipolar Disorder (BPD). The goal is to visualize the differentiated gene expression profiles using the limma package and identify the most prominent risk factors and diagnostic markers for BPD through the analysis of various phenotypic variables.

## Dataset Information

The dataset used in this analysis, referenced by the accession number GSE5389, includes gene expression data from samples of both healthy individuals and those diagnosed with BPD. The dataset comprises 22,283 genes/features across 21 samples, along with phenotypic information such as disease status, age, gender, and various treatment details.

## Hypothesis

The primary hypothesis is that there will be significant differences in gene expression profiles between individuals with BPD and healthy controls. Additionally, the analysis aims to identify which phenotypic characteristics, such as drug and alcohol abuse, might be linked to these gene expression changes, potentially serving as risk factors for BPD.

## Methods

### Data Processing and Exploration

Data Access and Structure Assessment:
The dataset was accessed and its structure was assessed, including the number of features (genes) and samples, as well as phenotypic variables.

Data Cleaning and Transformation:
Initial data exploration checked for missing values and unnecessary columns were filtered out.
A log2 transformation was applied to the gene expression values to normalize the data distribution.

### Visualization and Preliminary Analysis
Data Distribution:
Histograms of raw and log2-transformed data were generated to visualize the distribution and check for normalization.

Principal Component Analysis (PCA):
PCA was conducted to explore the data and identify patterns or clusters based on phenotypic traits.
The analysis highlighted significant variance driven by factors such as suicide status and gender.

### Differential Gene Expression Analysis

Group Definition and Contrast Establishment:
Samples were categorized into control and BPD groups.
Contrasts between these groups were established to identify differentially expressed genes.
Results

The analysis revealed significant gene expression differences between the BPD and control groups. Key findings include:

## PCA Results:
Suicide status and gender were identified as primary drivers of variance in gene expression.
Some differentiation was observed for drug abuse, although not as prominently for alcohol abuse.

## Differential Gene Expression:
One family of genes in particular, PGA (PGA3, PGA4, PGA5), who are associated with the ubiquitin cycle and synaptic functions, were notably downregulated in individuals with BPD, consistent with the original study findings.
Several genes showed significant differential expression, suggesting potential diagnostic markers and therapeutic targets for BPD.

### Conclusion
This analysis supports the hypothesis that gene expression profiles differ significantly between individuals with BPD and healthy controls. Furthermore, the exploration of phenotypic variables indicates that factors like suicide status and drug abuse may contribute to these differences. These findings provide valuable insights into the molecular underpinnings of BPD and highlight potential areas for further research in diagnostic and therapeutic strategies.
