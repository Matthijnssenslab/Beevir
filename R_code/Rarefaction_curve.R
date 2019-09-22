setwd("/Users/wd/Documents/Papers/Phagepaper/Code/inputdata")
counts <- read.delim("~/Documents/Papers/Phagepaper/Code/inputdata/Mapping data/counts.tsv", row.names=1)
library(vegan)
counts$Length <- NULL
counts <- t(counts)
sp_con_random <- specaccum(counts, method = "random", ci=2)
plot(sp_con_random)
#Writes sites & richness to df
spmat <- sp_con_random$perm
write.csv(spmat,file ="speccaccummat.csv", quote=F)
