## Importing necessary libraries
library(GEOquery) # Importing the dataset
library(limma) # Reducing dimension 
library(Biobase) # Getting expression data
library(tidyverse) # Data wrangling and preprocessing
library(ggfortify)
library(cowplot) # Combining visualizations together
library(pheatmap)
library(EnhancedVolcano)

## Accessing the dataset
data <- getGEO("GSE5389", GSEMatrix = TRUE, getGPL = TRUE)
data <- data[[1]]

##normalizing via log transformation
exprs(data) <- log2(exprs(data))

## PCA Analysis (along with some exploration)
pca <- prcomp(t(na.omit(exprs(data))))

## Conducting differential gene expression analysis
#establishing model design for analysis
design_bpd <- model.matrix(~0 + data$characteristics_ch1) 
colnames(design_bpd) <- c("BPD", "HC") #rename two group columns
cont_matrix_bpd <- makeContrasts(BPD-HC, levels = design_bpd) #establish contrast between groups

#fitting data into a linear model 
fit_bpd <- lmFit(data, design_bpd)
fit2_bpd <- contrasts.fit(fit_bpd, cont_matrix_bpd) # compute contrasts from linear model
fit2_bpd <- eBayes(fit2_bpd, 0.01) # compute statistics based on lm

#Extracting top 25differentially expressed genes
top_bpd <- topTable(fit2_bpd, adjust.method = "fdr", number = 25) 

##Creating heatmap to better identify DEG
# check significance cut off, annotate which rows/genes are differentially expressed
tt_data$diff <- tt_data$adj.P.Val < 0.05 & abs(tt_data$logFC) > 0.5

# create data frame (including sample, diagnosis, and batch) # to colour by (for drug abuse)
anno_colour <- data.frame(row.names = colnames(data),
                          pheno = as.factor(pData(data)$characteristics_ch1),
                          drugabuse = as.factor(pData(data)$characteristics_ch1.13))

phm_data <- data[rownames(data) %in% rownames(tt_data),]
pheatmap(phm_data, scale = "row", annotation_col = anno_colour, cutree_cols = 3)

# creating a heatmap for alcohol abuse
anno_colour <- data.frame(row.names = colnames(data),
                          pheno = as.factor(pData(data)$characteristics_ch1),
                          alcoholabuse = as.factor(pData(data)$characteristics_ch1.14))
phm_data <- data[rownames(data) %in% rownames(tt_data),]
pheatmap(phm_data, scale = "row", annotation_col = anno_colour, cutree_cols = 3)
