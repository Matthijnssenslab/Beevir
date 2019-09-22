

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
revigo.data <- rbind(c("GO:0000287","magnesium ion binding",1.785,94.0000,0.937,0.000,"magnesium ion binding"),
c("GO:0050897","cobalt ion binding",0.042,4.0000,0.952,0.457,"magnesium ion binding"),
c("GO:1901265","nucleoside phosphate binding",20.185,5.0000,0.925,0.332,"magnesium ion binding"),
c("GO:0043168","anion binding",20.942,5.0000,0.927,0.425,"magnesium ion binding"),
c("GO:0043167","ion binding",33.492,28.0000,0.942,0.262,"magnesium ion binding"),
c("GO:0043169","cation binding",15.599,24.0000,0.931,0.247,"magnesium ion binding"),
c("GO:0043178","alcohol binding",0.020,1.0000,0.958,0.192,"magnesium ion binding"),
c("GO:0031419","cobalamin binding",0.143,2.0000,0.937,0.228,"magnesium ion binding"),
c("GO:0031420","alkali metal ion binding",0.091,2.0000,0.952,0.287,"magnesium ion binding"),
c("GO:0070279","vitamin B6 binding",0.000,1.0000,0.960,0.465,"magnesium ion binding"),
c("GO:0030955","potassium ion binding",0.074,2.0000,0.952,0.281,"magnesium ion binding"),
c("GO:0046914","transition metal ion binding",6.942,8.0000,0.925,0.691,"magnesium ion binding"),
c("GO:0046872","metal ion binding",15.425,41.0000,0.916,0.631,"magnesium ion binding"),
c("GO:0019842","vitamin binding",0.634,1.0000,0.944,0.265,"magnesium ion binding"),
c("GO:0050660","flavin adenine dinucleotide binding",1.637,72.0000,0.905,0.179,"magnesium ion binding"),
c("GO:0008270","zinc ion binding",4.511,22.0000,0.926,0.444,"magnesium ion binding"),
c("GO:0030170","pyridoxal phosphate binding",1.157,1.0000,0.923,0.635,"magnesium ion binding"),
c("GO:0003676","nucleic acid binding",21.226,232.0000,0.924,0.185,"magnesium ion binding"),
c("GO:0000166","nucleotide binding",20.185,63.0000,0.893,0.447,"magnesium ion binding"),
c("GO:0097159","organic cyclic compound binding",41.137,56.0000,0.940,0.213,"magnesium ion binding"),
c("GO:1901363","heterocyclic compound binding",41.115,56.0000,0.940,0.292,"magnesium ion binding"),
c("GO:0005506","iron ion binding",1.548,2.0000,0.935,0.683,"magnesium ion binding"),
c("GO:0005509","calcium ion binding",0.967,1.0000,0.941,0.365,"magnesium ion binding"),
c("GO:0036094","small molecule binding",21.337,6.0000,0.946,0.214,"magnesium ion binding"),
c("GO:0003674","molecular_function",100.000,457.0000,1.000,0.000,"molecular_function"),
c("GO:0003700","transcription factor activity, sequence-specific DNA binding",4.217,74.0000,0.979,0.000,"transcription factor activity, sequence-specific DNA binding"),
c("GO:0001130","bacterial-type RNA polymerase transcription factor activity, sequence-specific DNA binding",0.000,3.0000,0.983,0.363,"transcription factor activity, sequence-specific DNA binding"),
c("GO:0001210","transcriptional repressor activity, metal ion regulated sequence-specific DNA binding",0.000,2.0000,0.975,0.309,"transcription factor activity, sequence-specific DNA binding"),
c("GO:0001199","transcription factor activity, metal ion regulated sequence-specific DNA binding",0.000,2.0000,0.983,0.371,"transcription factor activity, sequence-specific DNA binding"),
c("GO:0003735","structural constituent of ribosome",2.679,4.0000,0.993,0.000,"structural constituent of ribosome"),
c("GO:0003824","catalytic activity",65.827,414.0000,0.998,0.000,"catalytic activity"),
c("GO:0005198","structural molecule activity",3.268,14.0000,0.993,0.000,"structural molecule activity"),
c("GO:0005215","transporter activity",8.494,5.0000,0.993,0.000,"transporter activity"),
c("GO:0005488","binding",55.656,117.0000,0.997,0.000,"binding"),
c("GO:0008408","3'-5' exonuclease activity",0.342,236.0000,0.777,0.000,"3prime-5prime exonuclease activity"),
c("GO:0016798","hydrolase activity, acting on glycosyl bonds",1.822,56.0000,0.841,0.330,"3prime-5prime exonuclease activity"),
c("GO:0008962","phosphatidylglycerophosphatase activity",0.017,17.0000,0.825,0.407,"3prime-5prime exonuclease activity"),
c("GO:0016791","phosphatase activity",1.017,10.0000,0.768,0.694,"3prime-5prime exonuclease activity"),
c("GO:0016794","diphosphoric monoester hydrolase activity",0.004,1.0000,0.840,0.448,"3prime-5prime exonuclease activity"),
c("GO:0016814","hydrolase activity, acting on carbon-nitrogen (but not peptide) bonds, in cyclic amidines",0.379,5.0000,0.845,0.562,"3prime-5prime exonuclease activity"),
c("GO:0008979","prophage integrase activity",0.000,2.0000,0.969,0.500,"3prime-5prime exonuclease activity"),
c("GO:0016817","hydrolase activity, acting on acid anhydrides",7.223,37.0000,0.817,0.409,"3prime-5prime exonuclease activity"),
c("GO:0004132","dCMP deaminase activity",0.015,5.0000,0.872,0.691,"3prime-5prime exonuclease activity"),
c("GO:0016810","hydrolase activity, acting on carbon-nitrogen (but not peptide) bonds",1.786,8.0000,0.841,0.329,"3prime-5prime exonuclease activity"),
c("GO:0004113","2',3'-cyclic-nucleotide 3'-phosphodiesterase activity",0.016,1.0000,0.826,0.486,"3prime-5prime exonuclease activity"),
c("GO:0016788","hydrolase activity, acting on ester bonds",4.643,203.0000,0.826,0.267,"3prime-5prime exonuclease activity"),
c("GO:0004197","cysteine-type endopeptidase activity",0.093,2.0000,0.852,0.657,"3prime-5prime exonuclease activity"),
c("GO:0044824","retroviral 3' processing activity",0.000,4.0000,0.859,0.340,"3prime-5prime exonuclease activity"),
c("GO:0016857","racemase and epimerase activity, acting on carbohydrates and derivatives",0.238,2.0000,0.956,0.557,"3prime-5prime exonuclease activity"),
c("GO:0044823","retroviral integrase activity",0.000,4.0000,0.970,0.473,"3prime-5prime exonuclease activity"),
c("GO:0016854","racemase and epimerase activity",0.403,1.0000,0.954,0.609,"3prime-5prime exonuclease activity"),
c("GO:0004170","dUTP diphosphatase activity",0.031,31.0000,0.860,0.368,"3prime-5prime exonuclease activity"),
c("GO:0004176","ATP-dependent peptidase activity",0.094,1.0000,0.821,0.545,"3prime-5prime exonuclease activity"),
c("GO:0047429","nucleoside-triphosphate diphosphatase activity",0.138,20.0000,0.845,0.415,"3prime-5prime exonuclease activity"),
c("GO:0033973","dCTP deaminase (dUMP-forming) activity",0.000,2.0000,0.908,0.493,"3prime-5prime exonuclease activity"),
c("GO:0004252","serine-type endopeptidase activity",0.808,24.0000,0.824,0.296,"3prime-5prime exonuclease activity"),
c("GO:0033922","peptidoglycan beta-N-acetylmuramidase activity",0.000,3.0000,0.905,0.353,"3prime-5prime exonuclease activity"),
c("GO:0008094","DNA-dependent ATPase activity",0.593,5.0000,0.817,0.614,"3prime-5prime exonuclease activity"),
c("GO:0046555","acetylxylan esterase activity",0.001,7.0000,0.862,0.333,"3prime-5prime exonuclease activity"),
c("GO:0046556","alpha-L-arabinofuranosidase activity",0.032,1.0000,0.861,0.527,"3prime-5prime exonuclease activity"),
c("GO:0008253","5'-nucleotidase activity",0.048,4.0000,0.813,0.555,"3prime-5prime exonuclease activity"),
c("GO:0048256","flap endonuclease activity",0.022,14.0000,0.801,0.534,"3prime-5prime exonuclease activity"),
c("GO:0004386","helicase activity",1.222,40.0000,0.814,0.520,"3prime-5prime exonuclease activity"),
c("GO:0047846","deoxynucleotide 3'-phosphatase activity",0.000,5.0000,0.880,0.264,"3prime-5prime exonuclease activity"),
c("GO:0003796","lysozyme activity",0.045,165.0000,0.843,0.174,"3prime-5prime exonuclease activity"),
c("GO:0003934","GTP cyclohydrolase I activity",0.040,4.0000,0.864,0.681,"3prime-5prime exonuclease activity"),
c("GO:0008186","RNA-dependent ATPase activity",0.106,2.0000,0.840,0.536,"3prime-5prime exonuclease activity"),
c("GO:0004427","inorganic diphosphatase activity",0.064,3.0000,0.853,0.389,"3prime-5prime exonuclease activity"),
c("GO:0008234","cysteine-type peptidase activity",0.411,1.0000,0.837,0.622,"3prime-5prime exonuclease activity"),
c("GO:0008233","peptidase activity",4.049,13.0000,0.828,0.372,"3prime-5prime exonuclease activity"),
c("GO:0070001","aspartic-type peptidase activity",0.269,4.0000,0.843,0.598,"3prime-5prime exonuclease activity"),
c("GO:0003918","DNA topoisomerase type II (ATP-hydrolyzing) activity",0.138,47.0000,0.828,0.425,"3prime-5prime exonuclease activity"),
c("GO:0003678","DNA helicase activity",0.530,110.0000,0.816,0.281,"3prime-5prime exonuclease activity"),
c("GO:0052689","carboxylic ester hydrolase activity",0.623,7.0000,0.788,0.656,"3prime-5prime exonuclease activity"),
c("GO:0016887","ATPase activity",4.560,16.0000,0.789,0.670,"3prime-5prime exonuclease activity"),
c("GO:0008893","guanosine-3',5'-bis(diphosphate) 3'-diphosphatase activity",0.004,1.0000,0.840,0.448,"3prime-5prime exonuclease activity"),
c("GO:0004523","RNA-DNA hybrid ribonuclease activity",0.126,51.0000,0.783,0.609,"3prime-5prime exonuclease activity"),
c("GO:0016894","endonuclease activity, active with either ribo- or deoxyribonucleic acids and producing 3'-phosphomonoesters",0.083,7.0000,0.794,0.619,"3prime-5prime exonuclease activity"),
c("GO:0004518","nuclease activity",2.144,190.0000,0.764,0.615,"3prime-5prime exonuclease activity"),
c("GO:0016997","alpha-sialidase activity",0.022,1.0000,0.864,0.515,"3prime-5prime exonuclease activity"),
c("GO:1990238","double-stranded DNA endodeoxyribonuclease activity",0.000,1.0000,0.862,0.351,"3prime-5prime exonuclease activity"),
c("GO:0016996","endo-alpha-(2,8)-sialidase activity",0.000,1.0000,0.904,0.359,"3prime-5prime exonuclease activity"),
c("GO:0004553","hydrolase activity, hydrolyzing O-glycosyl compounds",1.490,59.0000,0.818,0.661,"3prime-5prime exonuclease activity"),
c("GO:0004568","chitinase activity",0.021,9.0000,0.865,0.513,"3prime-5prime exonuclease activity"),
c("GO:0008843","endochitinase activity",0.000,1.0000,0.891,0.409,"3prime-5prime exonuclease activity"),
c("GO:0008829","dCTP deaminase activity",0.020,11.0000,0.869,0.165,"3prime-5prime exonuclease activity"),
c("GO:0009055","electron carrier activity",1.275,24.0000,0.993,0.000,"electron carrier activity"),
c("GO:0016987","sigma factor activity",0.517,4.0000,0.993,0.000,"sigma factor activity"),
c("GO:0030234","enzyme regulator activity",0.856,5.0000,0.987,0.000,"enzyme regulator activity"),
c("GO:0031992","energy transducer activity",0.012,3.0000,0.993,0.000,"energy transducer activity"),
c("GO:0034257","nicotinamide riboside transmembrane transporter activity",0.013,9.0000,0.961,0.000,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0022803","passive transmembrane transporter activity",0.699,4.0000,0.954,0.538,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0015267","channel activity",0.699,4.0000,0.945,0.385,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0022857","transmembrane transporter activity",5.870,7.0000,0.953,0.579,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0015343","siderophore transmembrane transporter activity",0.024,3.0000,0.960,0.401,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0015144","carbohydrate transmembrane transporter activity",0.325,1.0000,0.942,0.499,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0034291","canonical holin activity",0.000,3.0000,0.960,0.563,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0034290","holin activity",0.000,3.0000,0.962,0.563,"nicotinamide riboside transmembrane transporter activity"),
c("GO:0098772","molecular function regulator",1.115,5.0000,0.993,0.000,"molecular function regulator"),
c("GO:0009009","site-specific recombinase activity",0.041,2.0000,0.968,0.021,"site-specific recombinase activity"),
c("GO:0008907","integrase activity",0.041,8.0000,0.967,0.021,"integrase activity"),
c("GO:0004124","cysteine synthase activity",0.045,3.0000,0.944,0.021,"cysteine synthase activity"),
c("GO:0004122","cystathionine beta-synthase activity",0.008,1.0000,0.949,0.501,"cysteine synthase activity"),
c("GO:0016835","carbon-oxygen lyase activity",1.304,1.0000,0.935,0.532,"cysteine synthase activity"),
c("GO:0016846","carbon-sulfur lyase activity",0.143,1.0000,0.944,0.589,"cysteine synthase activity"),
c("GO:0080146","L-cysteine desulfhydrase activity",0.004,1.0000,0.954,0.358,"cysteine synthase activity"),
c("GO:0000704","pyrimidine dimer DNA N-glycosylase activity",0.000,1.0000,0.837,0.354,"cysteine synthase activity"),
c("GO:0003910","DNA ligase (ATP) activity",0.055,29.0000,0.933,0.022,"DNA ligase (ATP) activity"),
c("GO:0016881","acid-amino acid ligase activity",0.396,1.0000,0.939,0.658,"DNA ligase (ATP) activity"),
c("GO:0016879","ligase activity, forming carbon-nitrogen bonds",1.406,1.0000,0.933,0.593,"DNA ligase (ATP) activity"),
c("GO:0016886","ligase activity, forming phosphoric ester bonds",0.135,7.0000,0.943,0.457,"DNA ligase (ATP) activity"),
c("GO:0004748","ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor",0.070,48.0000,0.931,0.022,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0004146","dihydrofolate reductase activity",0.034,8.0000,0.943,0.235,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0015035","protein disulfide oxidoreductase activity",0.305,23.0000,0.939,0.297,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0016645","oxidoreductase activity, acting on the CH-NH group of donors",0.305,1.0000,0.939,0.310,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0016725","oxidoreductase activity, acting on CH or CH2 groups",0.187,37.0000,0.941,0.265,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0016705","oxidoreductase activity, acting on paired donors, with incorporation or reduction of molecular oxygen",1.177,1.0000,0.933,0.351,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0016620","oxidoreductase activity, acting on the aldehyde or oxo group of donors, NAD or NADP as acceptor",0.395,1.0000,0.935,0.360,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0043365","[formate-C-acetyltransferase]-activating enzyme activity",0.023,4.0000,0.948,0.229,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0016903","oxidoreductase activity, acting on the aldehyde or oxo group of donors",0.627,1.0000,0.936,0.377,"ribonucleoside-diphosphate reductase activity, thioredoxin disulfide as acceptor"),
c("GO:0000150","recombinase activity",0.105,43.0000,0.966,0.023,"recombinase activity"),
c("GO:0061783","peptidoglycan muralytic activity",0.218,51.0000,0.964,0.024,"peptidoglycan muralytic activity"),
c("GO:0019239","deaminase activity",0.250,5.0000,0.964,0.024,"deaminase activity"),
c("GO:0004803","transposase activity",0.307,14.0000,0.963,0.025,"transposase activity"),
c("GO:0003887","DNA-directed DNA polymerase activity",0.456,211.0000,0.861,0.026,"DNA-directed DNA polymerase activity"),
c("GO:0016765","transferase activity, transferring alkyl or aryl (other than methyl) groups",0.753,1.0000,0.900,0.280,"DNA-directed DNA polymerase activity"),
c("GO:0016772","transferase activity, transferring phosphorus-containing groups",8.504,178.0000,0.874,0.413,"DNA-directed DNA polymerase activity"),
c("GO:0016757","transferase activity, transferring glycosyl groups",1.986,10.0000,0.891,0.264,"DNA-directed DNA polymerase activity"),
c("GO:0009007","site-specific DNA-methyltransferase (adenine-specific) activity",0.045,68.0000,0.900,0.188,"DNA-directed DNA polymerase activity"),
c("GO:0016773","phosphotransferase activity, alcohol group as acceptor",4.703,1.0000,0.849,0.645,"DNA-directed DNA polymerase activity"),
c("GO:0016776","phosphotransferase activity, phosphate group as acceptor",0.359,1.0000,0.880,0.409,"DNA-directed DNA polymerase activity"),
c("GO:0016778","diphosphotransferase activity",0.128,1.0000,0.889,0.374,"DNA-directed DNA polymerase activity"),
c("GO:0016779","nucleotidyltransferase activity",1.954,172.0000,0.861,0.484,"DNA-directed DNA polymerase activity"),
c("GO:0047507","(deoxy)nucleoside-phosphate kinase activity",0.000,1.0000,0.920,0.495,"DNA-directed DNA polymerase activity"),
c("GO:0019205","nucleobase-containing compound kinase activity",0.345,4.0000,0.878,0.408,"DNA-directed DNA polymerase activity"),
c("GO:0004713","protein tyrosine kinase activity",0.138,1.0000,0.886,0.430,"DNA-directed DNA polymerase activity"),
c("GO:0042083","5,10-methylenetetrahydrofolate-dependent methyltransferase activity",0.053,4.0000,0.903,0.609,"DNA-directed DNA polymerase activity"),
c("GO:0004749","ribose phosphate diphosphokinase activity",0.059,8.0000,0.891,0.352,"DNA-directed DNA polymerase activity"),
c("GO:0008174","mRNA methyltransferase activity",0.011,2.0000,0.911,0.549,"DNA-directed DNA polymerase activity"),
c("GO:0008168","methyltransferase activity",2.784,42.0000,0.870,0.600,"DNA-directed DNA polymerase activity"),
c("GO:0004810","tRNA adenylyltransferase activity",0.028,2.0000,0.887,0.569,"DNA-directed DNA polymerase activity"),
c("GO:0016748","succinyltransferase activity",0.062,1.0000,0.907,0.617,"DNA-directed DNA polymerase activity"),
c("GO:0004799","thymidylate synthase activity",0.031,20.0000,0.903,0.441,"DNA-directed DNA polymerase activity"),
c("GO:0016747","transferase activity, transferring acyl groups other than amino-acyl groups",2.285,1.0000,0.878,0.336,"DNA-directed DNA polymerase activity"),
c("GO:0004797","thymidine kinase activity",0.022,18.0000,0.891,0.326,"DNA-directed DNA polymerase activity"),
c("GO:0016746","transferase activity, transferring acyl groups",2.893,5.0000,0.887,0.330,"DNA-directed DNA polymerase activity"),
c("GO:0016741","transferase activity, transferring one-carbon groups",3.043,4.0000,0.886,0.350,"DNA-directed DNA polymerase activity"),
c("GO:0016749","N-succinyltransferase activity",0.032,1.0000,0.908,0.582,"DNA-directed DNA polymerase activity"),
c("GO:0004842","ubiquitin-protein transferase activity",0.352,3.0000,0.906,0.223,"DNA-directed DNA polymerase activity"),
c("GO:0004514","nicotinate-nucleotide diphosphorylase (carboxylating) activity",0.066,11.0000,0.912,0.194,"DNA-directed DNA polymerase activity"),
c("GO:0016874","ligase activity",3.540,8.0000,0.955,0.033,"ligase activity"),
c("GO:0046812","host cell surface binding",0.001,2.0000,0.977,0.034,"host cell surface binding"),
c("GO:0016853","isomerase activity",2.691,1.0000,0.956,0.041,"isomerase activity"),
c("GO:0016829","lyase activity",3.596,2.0000,0.955,0.043,"lyase activity"),
c("GO:0008144","drug binding",0.178,5.0000,0.968,0.050,"drug binding"),
c("GO:0003697","single-stranded DNA binding",0.219,76.0000,0.932,0.051,"single-stranded DNA binding"),
c("GO:0044212","transcription regulatory region DNA binding",0.275,6.0000,0.922,0.374,"single-stranded DNA binding"),
c("GO:0008135","translation factor activity, RNA binding",0.909,1.0000,0.926,0.493,"single-stranded DNA binding"),
c("GO:0043565","sequence-specific DNA binding",2.222,38.0000,0.916,0.366,"single-stranded DNA binding"),
c("GO:0003747","translation release factor activity",0.135,2.0000,0.931,0.192,"single-stranded DNA binding"),
c("GO:0001067","regulatory region nucleic acid binding",0.282,6.0000,0.939,0.204,"single-stranded DNA binding"),
c("GO:0003723","RNA binding",5.283,37.0000,0.917,0.487,"single-stranded DNA binding"),
c("GO:0003677","DNA binding",12.549,358.0000,0.907,0.415,"single-stranded DNA binding"),
c("GO:0003684","damaged DNA binding",0.291,3.0000,0.930,0.376,"single-stranded DNA binding"),
c("GO:0003688","DNA replication origin binding",0.057,8.0000,0.927,0.267,"single-stranded DNA binding"),
c("GO:0003690","double-stranded DNA binding",0.508,8.0000,0.927,0.399,"single-stranded DNA binding"),
c("GO:0000217","DNA secondary structure binding",0.013,10.0000,0.932,0.241,"single-stranded DNA binding"),
c("GO:0042802","identical protein binding",0.400,55.0000,0.949,0.054,"identical protein binding"),
c("GO:0046983","protein dimerization activity",1.157,2.0000,0.945,0.610,"identical protein binding"),
c("GO:0008134","transcription factor binding",0.320,5.0000,0.950,0.530,"identical protein binding"),
c("GO:0051082","unfolded protein binding",0.486,3.0000,0.948,0.550,"identical protein binding"),
c("GO:0051087","chaperone binding",0.101,2.0000,0.954,0.481,"identical protein binding"),
c("GO:0042803","protein homodimerization activity",0.221,2.0000,0.952,0.513,"identical protein binding"),
c("GO:0030246","carbohydrate binding",0.723,2.0000,0.965,0.058,"carbohydrate binding"),
c("GO:0016787","hydrolase activity",22.294,308.0000,0.947,0.059,"hydrolase activity"),
c("GO:0051539","4 iron, 4 sulfur cluster binding",1.007,8.0000,0.958,0.060,"4 iron, 4 sulfur cluster binding"),
c("GO:0005515","protein binding",4.410,57.0000,0.957,0.073,"protein binding"),
c("GO:0051540","metal cluster binding",2.056,4.0000,0.961,0.074,"metal cluster binding"),
c("GO:0016491","oxidoreductase activity",12.783,71.0000,0.950,0.080,"oxidoreductase activity"),
c("GO:0048037","cofactor binding",5.599,6.0000,0.956,0.087,"cofactor binding"),
c("GO:0097367","carbohydrate derivative binding",17.252,4.0000,0.948,0.112,"cofactor binding"),
c("GO:0016740","transferase activity",21.036,193.0000,0.947,0.093,"transferase activity"),
c("GO:0000822","inositol hexakisphosphate binding",0.002,1.0000,0.956,0.099,"inositol hexakisphosphate binding"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap_MOLFUN.pdf", width=16, height=9 ) # width and height are in inches

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
