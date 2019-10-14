##If you want to directly save high res figure, uncomment lines: 12 & 168
#Load colors
library("ggplot2")
library("viridis")
library("ggtree")
library("ggstance")
library("reshape2")
library("ggplotify")

setwd("/Users/wd/Documents/Papers/Phagepaper/Original/Code/inputdata/host")
#png("/Users/wd/Documents/Papers/Phagepaper/Figures/Bacterial_phylo.png", units="px", width=2200, height=1500, res=300)

#Read tree:
bactree <- read.tree("Bacterialtree.RAxML_bipartitions.BAC_raxml")
#Read number of scaffolds / bac for crispr & for tRNA
#crishits <- read.delim("~/Documents/Papers/Phagepaper/Code/inputdata/host/contigshits.csv")
criscounts <- read.csv("crisprcounts.csv")
colnames(criscounts) <- c("X","A","B","C","D","E")
criscounts <- melt(criscounts)
trnahits <- read.delim("contigshits_tRNA.csv")

#String to go from the multihost csv file to the taxapath:
#For crisprs (multihostlink.csv) & for tRNA (multihost_trna.csv):
#cut -f3,4,1 -d ',' multihost_trna.csv | gawk -F ',' '{print $2,$3,$1}' | grep -v Contignumber | gsed 's/\" \"/ \",\"/g' | gsed 's/\" /\",color=c(viridis(8),plasma(9))[/g' | gsed 's/$/]/g' | gsed 's/^/geom_taxalink(/g' | gsed 's/$/)/g' | gsed 's/ \"/\"/g' | gsed 's/])/],curvature=-1) +/g' 


#,aes(color=group)
#OTUlist:
cls <- list(Lacto=c("Lactobacillus_melliventris_Hma8", "Lactobacillus_melliventris_Lb_184", "Lactobacillus_kimbladii_Hma2", "Lactobacillus_kullabergensis_Biut2", "Lactobacillus_kullabergensis_Lb_186", "Lactobacillus_helsingborgensis_Bma5","Lactobacillus_helsinborgensis_Lb_183","Lactobacillus_mellifer_Bin4","Lactobacillus_mellis_Hon2","Lactobacillus_apis_Lb_185","Lactobacillus_apis_Hma11"),
            Bifido=c("Bifidobacterium_coryneforme_Bi_197", "Bifidobacterium_coryneforme_Bma6", "Bifidobacterium_asteroides_Bi_200","Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Bin2"),
            c3=c("Gilliamella_apicola_Ga_178", "Gilliamella_apicola_Ga_177", "Gilliamella_apicola_Ga_182", "Gilliamella_apicola_Ga_172","Gilliamella_apicola_Ga_169"),
            c4=c("Frischella_perrara_Fp_167"),
            c5=c("Snodgrassella_alvi_Sa_196"),
            c6 = c("Commensalibacter_sp._ESL0284"))
bactree <- groupOTU(bactree, cls)
#colvec <- c(viridis(4,begin=0.05, end=0.95))[c(3,2,4)]
#colvec1 <- c(colvec, plasma(1, begin=0.7, end=0.8),"Black")

colvec2 <- c("#2FB47CFF","#2F6C8EFF","#DEE318FF","#F1844BFF","#AF968BFF","#20A387FF","black")

p <- ggtree(bactree,aes(color=group)) +
  scale_color_manual(values=colvec2) +
  geom_tiplab(align=TRUE,linetype="dotted",linesize = 0.3, offset=0.12,size=1.5) +
  geom_treescale(fontsize=2) + 
  geom_nodelab(aes(label=label),alpha=0.5,color='black', size=2, nudge_x=-0.05, nudge_y=0.2) +
  geom_taxalink("Lactobacillus_kullabergensis_Lb_186","Lactobacillus_kullabergensis_Biut2",color=c(viridis(8),plasma(9))[1], curvature=-1, alpha=0.3) +
  geom_taxalink("Lactobacillus_kullabergensis_Lb_186","Lactobacillus_kimbladii_Hma2",color=c(viridis(8),plasma(9))[2], curvature=-1, alpha=0.3) +
  geom_taxalink("Lactobacillus_kullabergensis_Lb_186","Lactobacillus_melliventris_Hma8",color=c(viridis(8),plasma(9))[3], curvature=-1, alpha=0.3) +
  geom_taxalink("Lactobacillus_melliventris_Lb_184","Lactobacillus_kimbladii_Hma2",color=c(viridis(8),plasma(9))[4], curvature=1, alpha=0.3) +
  geom_taxalink("Lactobacillus_melliventris_Lb_184","Lactobacillus_melliventris_Hma8",color=c(viridis(8),plasma(9))[4], curvature=-1, alpha=0.3) +
  geom_taxalink("Lactobacillus_kimbladii_Hma2","Lactobacillus_melliventris_Hma8",color=c(viridis(8),plasma(9))[4], curvature=-1, alpha=0.3) +
  geom_taxalink("Lactobacillus_helsinborgensis_Lb_183","Lactobacillus_melliventris_Hma8",color=c(viridis(8),plasma(9))[5], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bi_198",color=c(viridis(8),plasma(9))[6], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bi_199",color=c(viridis(8),plasma(9))[6], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bin2",color=c(viridis(8),plasma(9))[6], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[6], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bi_199",color=c(viridis(8),plasma(9))[6], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bin2",color=c(viridis(8),plasma(9))[6], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[6], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Bin2",color=c(viridis(8),plasma(9))[6], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[6], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[6], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bi_200",color=c(viridis(8),plasma(9))[7], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[7], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_200","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[7], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_170","Bifidobacterium_asteroides_Bi_200",color=c(viridis(8),plasma(9))[8], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bi_199",color=c(viridis(8),plasma(9))[9], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[9], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Hma3",color=c(viridis(8),plasma(9))[9], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[9], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Hma3",color=c(viridis(8),plasma(9))[9], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Hma3",color=c(viridis(8),plasma(9))[9], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bi_199",color=c(viridis(8),plasma(9))[10], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_169","Gilliamella_apicola_Ga_177",color=c(viridis(8),plasma(9))[11], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_169","Gilliamella_apicola_Ga_182",color=c(viridis(8),plasma(9))[11], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_177","Gilliamella_apicola_Ga_182",color=c(viridis(8),plasma(9))[11], curvature=1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_172","Gilliamella_apicola_Ga_182",color=c(viridis(8),plasma(9))[12], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_172","Gilliamella_apicola_Ga_177",color=c(viridis(8),plasma(9))[13], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_172","Gilliamella_apicola_Ga_178",color=c(viridis(8),plasma(9))[13], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_177","Gilliamella_apicola_Ga_178",color=c(viridis(8),plasma(9))[13], curvature=-1, alpha=0.3) +
  geom_taxalink("Gilliamella_apicola_Ga_177","Gilliamella_apicola_Ga_178",color=c(viridis(8),plasma(9))[14], curvature=-1, alpha=0.3) +
  geom_taxalink("Lactobacillus_kimbladii_Hma2","Lactobacillus_kullabergensis_Biut2",color=c(viridis(8),plasma(9))[15], curvature=1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Bin7",color=c(viridis(8),plasma(9))[16], curvature=-1, alpha=0.3) +
  geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Hma3",color=c(viridis(8),plasma(9))[17], curvature=-1, alpha=0.3) #+
  
  # 
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_melliventris_Hma8",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_kullabergensis_Biut2",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_apis_Hma11",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_kimbladii_Hma2",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_helsinborgensis_Lb_183",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_melliventris_Lb_184",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_apis_Lb_185",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsingborgensis_Bma5","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_kullabergensis_Biut2",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_apis_Hma11",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_kimbladii_Hma2",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_helsinborgensis_Lb_183",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_melliventris_Lb_184",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_apis_Lb_185",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Hma8","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kullabergensis_Biut2","Lactobacillus_apis_Hma11",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kullabergensis_Biut2","Lactobacillus_kimbladii_Hma2",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kullabergensis_Biut2","Lactobacillus_helsinborgensis_Lb_183",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kullabergensis_Biut2","Lactobacillus_melliventris_Lb_184",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kullabergensis_Biut2","Lactobacillus_apis_Lb_185",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kullabergensis_Biut2","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_apis_Hma11","Lactobacillus_kimbladii_Hma2",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_apis_Hma11","Lactobacillus_helsinborgensis_Lb_183",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_apis_Hma11","Lactobacillus_melliventris_Lb_184",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_apis_Hma11","Lactobacillus_apis_Lb_185",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_apis_Hma11","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kimbladii_Hma2","Lactobacillus_helsinborgensis_Lb_183",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kimbladii_Hma2","Lactobacillus_melliventris_Lb_184",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kimbladii_Hma2","Lactobacillus_apis_Lb_185",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_kimbladii_Hma2","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsinborgensis_Lb_183","Lactobacillus_melliventris_Lb_184",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsinborgensis_Lb_183","Lactobacillus_apis_Lb_185",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_helsinborgensis_Lb_183","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Lb_184","Lactobacillus_apis_Lb_185",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Lactobacillus_melliventris_Lb_184","Lactobacillus_kullabergensis_Lb_186",color="gray48",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_coryneforme_Bma6",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bin7",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bin2",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bi_200",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bi_199",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bi_198",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Hma3","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_asteroides_Bin7",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_asteroides_Bin2",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_asteroides_Bi_200",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_asteroides_Bi_199",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_asteroides_Bi_198",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_coryneforme_Bma6","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Bin2",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Bi_200",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Bi_199",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Bi_198",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin7","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Bi_200",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Bi_199",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Bi_198",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=--0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bin2","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_200","Bifidobacterium_asteroides_Bi_199",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_200","Bifidobacterium_asteroides_Bi_198",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_200","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_200","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Bi_198",color="gray68",curvature=-0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_199","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_coryneforme_Bi_197",color="gray68",curvature=0.5, alpha=0.3) +
  # geom_taxalink("Bifidobacterium_asteroides_Bi_198","Bifidobacterium_asteroides_Bi_170",color="gray68",curvature=0.5)
  
p <- p + xlim_tree(3) + theme_tree2()

p2 <- p + scale_fill_grey()
#levels(criscounts$variable) <- c(1,2,3,4,5)
criscounts$variable <- factor(criscounts$variable, levels = rev(levels(criscounts$variable)))
p3 <- ggtree::facet_plot(p2, panel = 'CRISPR-Spacers', data = criscounts, geom = geom_barh, mapping = aes(x = value,fill=variable), stat='identity')
p4 <- p3 + ggtree::xlim_expand(xlim=c(0,15), panel="CRISPR-Spacers")


trnahits$Ambigious <- as.factor(trnahits$Ambigious)
p5 <- ggtree::facet_plot(p4, panel = 'tRNAs', data = trnahits, geom = geom_barh, mapping = aes(x= Num_Contigs,colour=group,fill=Ambigious),stat='identity')
p6 <- p5
p7 <- p6 + ggtree::xlim_expand(xlim=c(0,15), panel="tRNAs")
p8 <- facet_widths(p7, c(4,1,1))

p8
dev.off()




