
source('lib.R')

###

 #if (!requireNamespace("BiocManager", quietly = TRUE))
 #  install.packages("BiocManager")
 #BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")

 
 library(ChIPseeker)
 library(TxDb.Hsapiens.UCSC.hg19.knownGene)
 library(clusterProfiler)
###

NAME <- 'H3K9ac_H1.intersect_with_DeepZ'
#NAME <- 'DeepZ'
#NAME <- 'H3K9ac_H1.ENCFF679LHF.hg19.filtered'
#NAME <- 'H3K9ac_H1.ENCFF719SGF.hg19.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')


###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))

plotAnnoPie(peakAnno)
dev.off()

 #peak <- readPeakFile(BED_FN)
 #pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.png'))
 #covplot(peak, weightCol="V5")
 #dev.off()
# 


