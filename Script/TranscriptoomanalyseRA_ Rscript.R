#Transcriptoomanalyse Reumatoïde Artritis R script
#Student:Raziel L. Garcia Chavez

# I. Used packages

# Main analysis and visualization packages     | Version |
# Rsubread                                     | 2.24.0  |
# DESeq2                                       | 1.50.2  |
# EnhancedVolcano                              | 1.28.2  |
# clusterProfiler                              | 4.18.4  |
# org.Hs.eg.db                                 | 3.22.0  |
# pathview                                     | 1.50.0  |
# ggplot2                                      | 4.0.3   |

#  Supporting packages:
# enrichplot                                   | 1.30.5  |
# dplyr                                        | 1.2.0   |
# stringr                                      | 1.6.0   |
  

# 1. Build reference genome index
buildindex(
  basename = 'ref_reuma',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

# 2. Align paired-end RNA-seq reads
align.ctrl_01 <- align(index = "ref_reuma", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "ctrl_01.BAM")

align.ctrl_02 <- align(index = "ref_reuma", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "ctrl_02.BAM")

align.ctrl_03 <- align(index = "ref_reuma", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "ctrl_03.BAM")

align.ctrl_04 <- align(index = "ref_reuma", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = 'SRR4785831_2_subset40k.fastq', output_file = "ctrl_04.BAM")

align.ra_01 <- align(index = "ref_reuma", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq",output_file = "ra_01.BAM")

align.ra_02 <- align(index = "ref_reuma", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "ra_02.BAM")

align.ra_03 <- align(index = "ref_reuma", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "ra_03.BAM")

align.ra_04 <- align(index = "ref_reuma", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "ra_04.BAM")

# 3. Generate gene count matrix
samples <- c('ctrl_01', 'ctrl_02', 'ctrl_03', 'ctrl_04', 'ra_01', 'ra_02','ra_03', 'ra_04')

count_matrix <- featureCounts(
  files = samples,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE, 
  GTF.featureType = "gene",
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE )

counts <- count_matrix$counts

# 4. Differential expression analysis
treatment <- c( "control", "control", "control", "control", "RA", "RA", "RA", "RA")

treatment_table <- data.frame(treatment)

rownames(treatment_table) <- c( "SRR4785819", "SRR4785820", "SRR4785828", "SRR4785831", "SRR4785979", "SRR4785980", "SRR4785986", "SRR4785988" )

dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = treatment_table,
  design = ~ treatment
)

dds <- DESeq(dds)
resultaten <- results(dds)

# 5. Volcano plot
EnhancedVolcano(
  resultaten,
  lab = rownames(resultaten),
  selectLab = rownames(head(laagste_p_waarde, 10)),
  x = 'log2FoldChange',
  y = 'padj',
  drawConnectors = TRUE )

dev.copy(png, 'Volcanoplot1.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

# 6. GO enrichment analysis + visualization
sig_genes <- rownames(   resultaten[
  !is.na(resultaten$padj) &
    !is.na(resultaten$log2FoldChange) &
    resultaten$padj < 0.05 &
    abs(resultaten$log2FoldChange) > 1,])

gene.df <- bitr(
  sig_genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

go_bp <- enrichGO(
  gene          = gene.df$ENTREZID,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05,
  qvalueCutoff  = 0.05
) 

# Visualization
go_df <- as.data.frame(go_bp)

go_df <- go_df %>%
  mutate(
    hitsPerc = sapply(
      strsplit(as.character(GeneRatio), "/"),
      function(x) as.numeric(x[1]) / as.numeric(x[2]) * 100))

top_go <- go_df %>%
  arrange(p.adjust) %>%
  slice_head(n = 10)

top_go$Description <- str_wrap(top_go$Description, width = 40)

ggplot(
  top_go,
  aes(
    x = hitsPerc,
    y = reorder(Description, hitsPerc),
    colour = -log10(p.adjust),
    size = Count
  )
) +
  geom_point() +
  labs(
    x = "Hits (%)",
    y = "GO term",
    colour = "-log10(FDR)",
    size = "Gene count"
  ) +
  theme_bw() +
  theme( axis.text.y = element_text(size = 8 ) )

# 7. KEGG pathway enrichment analysis + visualization
kegg_result <- enrichKEGG(
  gene = entrez_ids,
  organism = "hsa",
  pvalueCutoff = 0.05
)

dotplot(kegg_result, showCategory = 10)

# 8. Pathway visualization
pathview(
  gene.data = gene_list,
  pathway.id = "hsa04660",
  species = "hsa",
  gene.idtype = "ENTREZ",
  limit = list(gene = 5))

pathview(
  gene.data = gene_list,
  pathway.id = "hsa04662",
  species = "hsa",
  gene.idtype = "ENTREZ",
  limit = list(gene = 5))

pathview(
  gene.data = gene_list,
  pathway.id = "hsa05323",
  species = "hsa",
  gene.idtype = "ENTREZ",
  limit = list(gene = 5))