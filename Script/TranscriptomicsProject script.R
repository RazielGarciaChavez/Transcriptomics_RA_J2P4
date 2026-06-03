TranscriptomicsProject script
#WC1

setwd("C:/Users/razie/OneDrive/Escritorio/Docs School/J2P4/Transcriptomics/Project/Data_RA_raw")
getwd()
library(BiocManager)
library(Rsubread)
#Info over package:
browseVignettes('Rsubread')
#Er wordt van je verwacht dat je voor de casusopdracht wel gaat kijken of je de functies correct gebruikt. Je kunt niet alle codes van het werkcollege 1 op 1 overnemen voor de uitvoering van je casus.

buildindex(
  basename = 'ref_reuma',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)
#--
align.ctrl_01 <- align(index = "ref_reuma", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "ctrl_01.BAM")

align.ctrl_02 <- align(index = "ref_reuma", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "ctrl_02.BAM")

align.ctrl_03 <- align(index = "ref_reuma", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "ctrl_03.BAM")

align.ctrl_04 <- align(index = "ref_reuma", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = 'SRR4785831_2_subset40k.fastq', output_file = "ctrl_04.BAM")

align.ra_01 <- align(index = "ref_reuma", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq",output_file = "ra_01.BAM")

align.ra_02 <- align(index = "ref_reuma", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "ra_02.BAM")

align.ra_03 <- align(index = "ref_reuma", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "ra_03.BAM")

align.ra_04 <- align(index = "ref_reuma", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "ra_04.BAM")

#--
# Laad Rsamtools voor sorteren en indexeren (dowloaden indien nodig)
BiocManager::install('Rsamtools')
library(Rsamtools)

# Bestandsnamen van de monsters
samples <- c('ctrl_01', 'ctrl_02', 'ctrl_03', 'ctrl_04', 'ra_01', 'ra_02','ra_03', 'ra_04')

---------------------------
#WC2  
setwd("C:/Users/razie/OneDrive/Escritorio/Docs School/J2P4/Transcriptomics/Project/Data_RA_raw")

library(Rsubread)

#Voor alle samples tegelijkertijd:
sampleswc2 <- c('ctrl_01.BAM', 'ctrl_02.BAM', 'ctrl_03.BAM', 'ctrl_04.BAM', 'ra_01.BAM', 'ra_02.BAM', 'ra_03.BAM', 'ra_04.BAM')
count_matrix <- featureCounts(
  files = sampleswc2,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE, 
  GTF.featureType = "gene",
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE )
#Output:
==========     _____ _    _ ____  _____  ______          _____  
=====         / ____| |  | |  _ \|  __ \|  ____|   /\   |  __ \ 
=====      | (___ | |  | | |_) | |__) | |__     /  \  | |  | |
  ====      \___ \| |  | |  _ <|  _  /|  __|   / /\ \ | |  | |
  ====    ____) | |__| | |_) | | \ \| |____ / ____ \| |__| |
  ==========   |_____/ \____/|____/|_|  \_\______/_/    \_\_____/
  Rsubread 2.24.0

//========================== featureCounts setting ===========================\\
||                                                                            ||
  ||             Input files : 8 BAM files                                      ||
  ||                                                                            ||
  ||                           ctrl_01.BAM                                      ||
  ||                           ctrl_02.BAM                                      ||
  ||                           ctrl_03.BAM                                      ||
  ||                           ctrl_04.BAM                                      ||
  ||                           ra_01.BAM                                        ||
  ||                           ra_02.BAM                                        ||
  ||                           ra_03.BAM                                        ||
  ||                           ra_04.BAM                                        ||
  ||                                                                            ||
  ||              Paired-end : yes                                              ||
  ||        Count read pairs : yes                                              ||
  ||              Annotation : genomic.gtf (GTF)                                ||
  ||      Dir for temp files : .                                                ||
  ||                 Threads : 1                                                ||
  ||                   Level : meta-feature level                               ||
  ||      Multimapping reads : counted                                          ||
  || Multi-overlapping reads : not counted                                      ||
  ||   Min overlapping bases : 1                                                ||
  ||                                                                            ||
  \\============================================================================//
  
  //================================= Running ==================================\\
  ||                                                                            ||
    || Load annotation file genomic.gtf ...                                       ||
    ||    Features : 67512                                                        ||
    ||    Meta-features : 67512                                                   ||
    ||    Chromosomes/contigs : 539                                               ||
    ||                                                                            ||
    || Process BAM file ctrl_01.BAM...                                            ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 8789 (87.9%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ctrl_02.BAM...                                            ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 8733 (87.3%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ctrl_03.BAM...                                            ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 9143 (91.4%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ctrl_04.BAM...                                            ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 9011 (90.1%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ra_01.BAM...                                              ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 5606 (56.1%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ra_02.BAM...                                              ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 5000 (50.0%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ra_03.BAM...                                              ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 5295 (53.0%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Process BAM file ra_04.BAM...                                              ||
    ||    Paired-end reads are included.                                          ||
    ||    Total alignments : 10000                                                ||
    ||    Successfully assigned alignments : 6016 (60.2%)                         ||
    ||    Running time : 0.00 minutes                                             ||
    ||                                                                            ||
    || Write the final count table.                                               ||
    || Write the read assignment summary.                                         ||
    ||                                                                            ||
    \\============================================================================//

#Countmatrix bekijken:
str(count_matrix)
  #Output:
#  List of 4
#  $ counts    : int [1:67512, 1:8] 1 959 0 3 0 0 0 0 0 34 ...
#  ..- attr(*, "dimnames")=List of 2
#  .. ..$ : chr [1:67512] "DDX11L1" "WASH7P" "MIR6859-1" "MIR1302-2HG" ...
#  .. ..$ : chr [1:8] "ctrl_01.BAM" "ctrl_02.BAM" "ctrl_03.BAM" "ctrl_04.BAM" ...
#  $ annotation:'data.frame':	67512 obs. of  6 variables:
#    ..$ GeneID: chr [1:67512] "DDX11L1" "WASH7P" "MIR6859-1" "MIR1302-2HG" ...
#  ..$ Chr   : chr [1:67512] "NC_000001.11" "NC_000001.11" "NC_000001.11" "NC_000001.11" ...
#  ..$ Start : int [1:67512] 11874 14362 17369 29774 30366 34611 52453 63016 65419 95222 ...
# ..$ End   : int [1:67512] 14409 29370 17436 35418 30503 36081 53396 63885 71585 107727 ...
#  ..$ Strand: chr [1:67512] "+" "-" "-" "+" ...
#  ..$ Length: int [1:67512] 2536 15009 68 5645 138 1471 944 870 6167 12506 ...
#  $ targets   : chr [1:8] "ctrl_01.BAM" "ctrl_02.BAM" "ctrl_03.BAM" "ctrl_04.BAM" ...
#  $ stat      :'data.frame':	14 obs. of  9 variables:
#    ..$ Status     : chr [1:14] "Assigned" "Unassigned_Unmapped" "Unassigned_Read_Type" "Unassigned_Singleton" ...
#  ..$ ctrl_01.BAM: int [1:14] 8789 86 0 0 0 0 0 0 0 0 ...
#  ..$ ctrl_02.BAM: int [1:14] 8733 615 0 0 0 0 0 0 0 0 ...
#  ..$ ctrl_03.BAM: int [1:14] 9143 544 0 0 0 0 0 0 0 0 ...
#  ..$ ctrl_04.BAM: int [1:14] 9011 723 0 0 0 0 0 0 0 0 ...
#  ..$ ra_01.BAM  : int [1:14] 5606 46 0 0 0 0 0 0 0 0 ...
#  ..$ ra_02.BAM  : int [1:14] 5000 57 0 0 0 0 0 0 0 0 ...
#  ..$ ra_03.BAM  : int [1:14] 5295 55 0 0 0 0 0 0 0 0 ...
#  ..$ ra_04.BAM  : int [1:14] 6016 54 0 0 0 0 0 0 0 0 ...
 
counts <- count_matrix$counts
head(counts)
  #Output:
# ctrl_01.BAM ctrl_02.BAM ctrl_03.BAM ctrl_04.BAM ra_01.BAM ra_02.BAM ra_03.BAM
# DDX11L1               1           0           0           0         0         1         1
# WASH7P              959         152          59          29       119       434       333
# MIR6859-1             0           0           0           0         0         0         0
# MIR1302-2HG           3           1           0           0         0         0         0
# MIR1302-2             0           0           0           0         0         0         0
# FAM138A               0           0           0           0         1         0         0
# ra_04.BAM
# DDX11L1             3
# WASH7P            498
# MIR6859-1           0
# MIR1302-2HG         0
# MIR1302-2           0
# FAM138A             0

colnames(counts) <- c( "ctrl_01", "ctrl_02", "ctrl_03", "ctrl_04", "ra_01", "ra_02", "ra_03", "ra_04" )
head(counts)
  #Output
# ctrl_01 ctrl_02 ctrl_03 ctrl_04 ra_01 ra_02 ra_03 ra_04
# DDX11L1           1       0       0       0     0     1     1     3
# WASH7P          959     152      59      29   119   434   333   498
# MIR6859-1         0       0       0       0     0     0     0     0
# MIR1302-2HG       3       1       0       0     0     0     0     0
# MIR1302-2         0       0       0       0     0     0     0     0
# FAM138A           0       0       0       0     1     0     0     0

#Counmatrix slaan
write.csv(counts, "RA_countmatrix.csv")
---------------------------
  
#WC3-> nog verwerken
setwd("C:/Users/razie/OneDrive/Escritorio/Docs School/J2P4/Transcriptomics/Project/Data_RA_raw")

#Count matrix van BB ingeladen in plaats van je eigen countmatrxix!
counts <- read.table ("count_matrix_RA.txt", row.names = 1)

library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)

treatment <- c( "control", "control", "control", "control", "RA", "RA", "RA", "RA")
treatment_table <- data.frame(treatment)

# Maak DESeqDataSet aan
rownames(treatment_table) <- c( "ctrl_01", "ctrl_02", "ctrl_03", "ctrl_04", "ra_01", "ra_02", "ra_03", "ra_04" )
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table,
                              design = ~ treatment)
  #Output: 
#Warning message:
#In DESeqDataSet(se, design = design, ignoreRank) :
#  some variables in design formula are characters, converting to factors

# Voer analyse uit
dds <- DESeq(dds)
resultaten <- results(dds)

#opslaan
write.table(resultaten, file = 'RA_DESeq2_results.csv', row.names = TRUE, col.names = TRUE)
#---
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
#[1] 2
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)
#[1] 2
hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]

#Visualisatie:volcano
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')

#Je kunt het figuur opslaan in je working directory met onderstaande code. Je kunt de plot ook opslaan via het ‘Plots’ rechtsonderin RStudio.

dev.copy(png, 'VolcanoplotWC.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

---
  resultaten[1] <- NULL
resultaten[2:5] <- NULL
&&&&&&&&&&&&&&
pathview(
  gene.data = resultaten,
  pathway.id = "eco02026",  
  species = "eco",          
  gene.idtype = "KEGG",     
  limit = list(gene = 5)    
)

  
  