library("vegan")
library("phyloseq")
library("ggplot2")
setwd("~/Bioinf/repo/Beevir/R_code")
# Read metadata
metadat <- read.delim("~/Bioinf/repo/Beevir/2Stats/output/Sample_metadata.csv", row.names=1)
# Read coverage matrix
coverage_tpmean <- read.delim("~/Bioinf/repo/Beevir/2Stats/data/coverage_tpmean.tsv", row.names=1)
coverage_tpmean$Length <- NULL
coverage_tpmean <- as.matrix(coverage_tpmean)
coverage_tpmean <- t(coverage_tpmean)
cov_distmat <- vegdist(coverage_tpmean, method='bray')

# Location
adonis(cov_distmat ~ metadat$Location, permutations = 10000)
# Year
adonis(cov_distmat ~ metadat$Year, permutations = 10000)
# metadat$Status
adonis(cov_distmat ~ metadat$Status, permutations = 10000)


cov_pcoa <- pcoa(cov_distmat)
ggplot() +
  theme_minimal() +
  scale_color_manual(values=c("#1f77b4","#ff7f0e")) +
  geom_point(aes(x=cov_pcoa$vectors[,1], y=cov_pcoa$vectors[,2], col=metadat$Year)) + 
  labs(y= "PCoA2", x = "PCoA1", color="Year")
ggsave("Pcoa_Year.png",dpi = 300, width = 5, height = 3)

ggplot() +
  theme_minimal() +
  scale_color_manual(values=c("#1f77b4","#ff7f0e","#2ca02c","#d62728","#9467bd","#8c564b")) +
  geom_point(aes(x=cov_pcoa$vectors[,1], y=cov_pcoa$vectors[,3], col=metadat$Location)) + 
  labs(y= "PCoA2", x = "PCoA1", color="Location")
ggsave("Pcoa_Location.png",dpi = 300, width = 5, height = 3)

ggplot() +
  theme_minimal() +
  scale_color_manual(values=c("#1f77b4","#ff7f0e")) +
  geom_point(aes(x=cov_pcoa$vectors[,1], y=cov_pcoa$vectors[,2], col=metadat$Status)) + 
  labs(y= "PCoA2", x = "PCoA1", color="Status")
ggsave("Pcoa_status.png",dpi = 300, width = 5, height = 3)

