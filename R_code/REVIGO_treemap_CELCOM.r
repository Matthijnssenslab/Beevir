

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
setwd("/Users/wd/Documents/Papers/Phagepaper/Code/")

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0005575","cellular_component",100.000,667.0000,1.000,0.000,"cellular_component"),
c("GO:0005576","extracellular region",2.375,13.0000,0.979,0.000,"extracellular region"),
c("GO:0005623","cell",53.553,67.0000,0.990,0.000,"cell"),
c("GO:0005829","cytosol",2.553,34.0000,0.893,0.000,"cytosol"),
c("GO:0044464","cell part",52.385,67.0000,0.899,0.291,"cytosol"),
c("GO:0044445","cytosolic part",0.496,3.0000,0.902,0.402,"cytosol"),
c("GO:0071944","cell periphery",11.583,26.0000,0.913,0.106,"cytosol"),
c("GO:0044444","cytoplasmic part",12.659,34.0000,0.880,0.389,"cytosol"),
c("GO:0043228","non-membrane-bounded organelle",8.408,1.0000,0.952,0.609,"cytosol"),
c("GO:0043232","intracellular non-membrane-bounded organelle",7.946,1.0000,0.870,0.600,"cytosol"),
c("GO:0005737","cytoplasm",26.017,79.0000,0.873,0.265,"cytosol"),
c("GO:0044424","intracellular part",35.654,45.0000,0.879,0.439,"cytosol"),
c("GO:0043229","intracellular organelle",19.917,1.0000,0.858,0.448,"cytosol"),
c("GO:0043590","bacterial nucleoid",0.037,1.0000,0.917,0.115,"cytosol"),
c("GO:0005622","intracellular",41.175,45.0000,0.898,0.378,"cytosol"),
c("GO:0005971","ribonucleoside-diphosphate reductase complex",0.011,3.0000,0.800,0.495,"cytosol"),
c("GO:0009295","nucleoid",0.149,1.0000,0.979,0.000,"nucleoid"),
c("GO:0016020","membrane",61.592,46.0000,0.992,0.000,"membrane"),
c("GO:0019012","virion",0.226,441.0000,0.979,0.000,"virion"),
c("GO:0019867","outer membrane",1.018,18.0000,0.965,0.000,"outer membrane"),
c("GO:0032991","macromolecular complex",14.008,114.0000,0.982,0.000,"macromolecular complex"),
c("GO:0033643","host cell part",0.058,206.0000,0.648,0.000,"host cell part"),
c("GO:0043226","organelle",20.788,1.0000,0.983,0.000,"organelle"),
c("GO:0044215","other organism",0.060,207.0000,0.979,0.000,"other organism"),
c("GO:0044423","virion part",0.215,299.0000,0.786,0.000,"virion part"),
c("GO:0046729","viral procapsid",0.000,65.0000,0.834,0.638,"virion part"),
c("GO:0046798","viral portal complex",0.000,65.0000,0.768,0.583,"virion part"),
c("GO:0039617","T=3 icosahedral viral capsid",0.000,14.0000,0.824,0.655,"virion part"),
c("GO:0098021","viral capsid, decoration",0.000,3.0000,0.841,0.589,"virion part"),
c("GO:1902494","catalytic complex",3.734,21.0000,0.828,0.000,"catalytic complex"),
c("GO:0043493","viral terminase complex",0.000,17.0000,0.894,0.190,"catalytic complex"),
c("GO:0009360","DNA polymerase III complex",0.146,3.0000,0.764,0.549,"catalytic complex"),
c("GO:1904949","ATPase complex",0.680,16.0000,0.800,0.408,"catalytic complex"),
c("GO:0017053","transcriptional repressor complex",0.042,2.0000,0.873,0.306,"catalytic complex"),
c("GO:1990391","DNA repair complex",0.168,1.0000,0.862,0.349,"catalytic complex"),
c("GO:0032300","mismatch repair complex",0.033,1.0000,0.822,0.299,"catalytic complex"),
c("GO:0098796","membrane protein complex",2.473,1.0000,0.799,0.484,"catalytic complex"),
c("GO:1990234","transferase complex",1.223,2.0000,0.791,0.674,"catalytic complex"),
c("GO:0044776","DNA polymerase III, core complex",0.000,1.0000,0.819,0.665,"catalytic complex"),
c("GO:1990351","transporter complex",0.885,1.0000,0.845,0.422,"catalytic complex"),
c("GO:0098009","viral terminase, large subunit",0.000,15.0000,0.864,0.185,"catalytic complex"),
c("GO:1990204","oxidoreductase complex",0.453,3.0000,0.772,0.609,"catalytic complex"),
c("GO:0032993","protein-DNA complex",0.418,12.0000,0.853,0.386,"catalytic complex"),
c("GO:1902495","transmembrane transporter complex",0.864,1.0000,0.811,0.420,"catalytic complex"),
c("GO:0009289","pilus",0.044,1.0000,0.944,0.054,"pilus"),
c("GO:0009986","cell surface",0.241,1.0000,0.938,0.064,"cell surface"),
c("GO:0042597","periplasmic space",0.671,1.0000,0.934,0.071,"periplasmic space"),
c("GO:0016021","integral component of membrane",55.868,13.0000,0.952,0.072,"integral component of membrane"),
c("GO:0044425","membrane part",57.394,4.0000,0.958,0.327,"integral component of membrane"),
c("GO:0031224","intrinsic component of membrane",55.975,4.0000,0.953,0.407,"integral component of membrane"),
c("GO:0030312","external encapsulating structure",0.922,12.0000,0.868,0.074,"external encapsulating structure"),
c("GO:0044459","plasma membrane part",2.405,3.0000,0.843,0.453,"external encapsulating structure"),
c("GO:0005886","plasma membrane",10.510,21.0000,0.820,0.637,"external encapsulating structure"),
c("GO:0005887","integral component of plasma membrane",1.211,3.0000,0.832,0.495,"external encapsulating structure"),
c("GO:0005618","cell wall",0.294,9.0000,0.860,0.363,"external encapsulating structure"),
c("GO:0030313","cell envelope",1.066,4.0000,0.903,0.075,"cell envelope"),
c("GO:0031975","envelope",2.324,4.0000,0.926,0.083,"envelope"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap_CELCOM.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
	stuff,
	index = c("representative","description"),
	vSize = "value",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
