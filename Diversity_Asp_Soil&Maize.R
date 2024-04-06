# Retrieve phylogenetic tree
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Note1: The tree was constructed using MEGA7 and saved as an 'nwk' file as follows:
# - cleaned then dereplicated sequences for maize and soil isolates were combined (n = 58), aligned, trimmed,
# - and phylogenetic tree constructed from the alignment using maximum likelihood with bootstrap set at 500 replicates.
# - Phylogenetic tree was then saved as a ".nwk file with branches" and used in this R code:

#~~~~~~~~~~~~~~~~~~~~~#
###### FIGURE 6 #######
#~~~~~~~~~~~~~~~~~~~~~#

require(ggplot2)
require(ggtree)
tree <- read.tree(url("https://github.com/bkatati/adiversity/blob/main/Phylotree-Asp_soil+maize.nwk"))
# NB: if file error occurs, download rds file "Phylotree-Asp_soil+maize" from site "https://github.com/bkatati/adiversity" 
# On your PC, create appropriate local drive path for the file and change above file path.
tree

# Schematic view of the tree:
ggplot(tree) + geom_tree() + theme_tree2()

# Check & note for positions of nodes where the Aspergilli differentiate at species level:
require(tidyverse)
p1 <- ggtree(tree, aes(color=branch.length), size=1.2, linetype=1) +
  xlim(0, 0.06) + 
  geom_tiplab(size=3.2, color="darkgreen", offset = 0.00005, linetype = 3) +
  theme_tree2("black") +
  scale_color_continuous(low='red', high='blue', name="Branch Length") +
  theme_bw() + theme(legend.position="none") +
  geom_label2(aes(subset=!isTip, label=node), size=3, color="darkred", alpha=1)
plot(p1)

# Retrieve traits (phenotypic characteristics of isolates) to add to the tree:
traits <- read.csv(url("https://github.com/bkatati/adiversity/blob/main/Triphasic.csv"))
# NB: if file error occurs, download rds file "Triphasic" from site "https://github.com/bkatati/adiversity" 
# On your PC, create appropriate local drive path for the file and change above file path.
head(traits)
dim(traits)
# Important!!! Ensure that order of the species/clades in the csv file for traits is arranged as your tree.
# The species codes in the traits file should be exactly as the codes on the tree tips.
# You may check the order/codes of the isolates in the tree by writing it:
# write.csv(tree$tip.label, "~your path/tree_name.csv")
# Arrange species metabolic profiles according to "tree_name.csv" file.

matrix <- as.matrix(traits[,c(4:8)])
matrix
rownames(matrix) <- (traits[,1])
head(matrix)

# Colour for each niche (maize and soil) is defined:
my_colours <- c("darkgreen", "brown")

# Branched tree:
p2 <- ggtree(tree, aes(color=branch.length), size=1.2, linetype=1) +
  scale_color_continuous(low='red', high='black', name="Branch Length") +
  theme_bw() + theme(legend.position="none") +
  geom_tiplab(size=3.2, color=my_colours[(traits$Niche == 1)+1], offset = 0.0005, linetype = 3)

p2

# Species clades are assigned  based on identified node numbers
p3 <- p2 + 
  geom_cladelabel(69, "A. oryzae", offset=0.015, barsize=1,angle=90, offset.text=0.002, hjust=0.6, fontsize=3.0) + 
  geom_cladelabel(92, "A. parasiticus", offset=0.02, barsize=01, angle=90, offset.text=0.002, hjust=0.5, fontsize=3.0) +
  geom_cladelabel(77, "A. minisclerotigenes", offset=0.02, barsize=1, angle=90, offset.text=0.002, hjust=0.5, fontsize=3.0) +
  geom_cladelabel(75, "A. flavus", offset=0.018, barsize=1, angle=90, offset.text=0.002, hjust=0.4, fontsize=3.0) +
  geom_cladelabel(107, "A. parasiticus", offset=0.02, barsize=01, angle=90, offset.text=0.002, hjust=0.6, fontsize=3.0) +
  geom_cladelabel(89, "A. sergii", offset=0.02, barsize=01, angle=90, offset.text=0.002, hjust=0.6, fontsize=3.0) +
  geom_cladelabel(90, "A. transmontanensis", offset=0.02, barsize=01, angle=90, offset.text=0.0009, hjust=0.6, fontsize=3.0) +
  geom_cladelabel(87, "A. tubingensis", offset=0.12, barsize=01, angle=90, offset.text=0.002, hjust=0.6, fontsize=3.0)+
  # and link taxa of same field but no sequence divergence (CAM gene):

geom_taxalink("MKZ10B", "EKZ10A", color="purple", linetype=2, size = 1) + # no sequence divergence, but with phenotypic difference
geom_taxalink("MLV14E", "ELV14B", color="purple", linetype=2, size = 1) + # no sequence divergence, but with phenotypic difference
geom_taxalink("MML19B", "EML19A", color="blue", linetype=1, size = 1) + # no sequence divergence and phenotypic difference
geom_taxalink("MML16G", "EML16B", color="blue", linetype=1, size = 1) # no sequence divergence and phenotypic difference

plot(p3)

# Combined branched Tree with species traits:
library(ComplexHeatmap)
library(gplots)
p4 <-  gheatmap(p2, matrix, offset=0.001, low="white", high="green", colnames_position = "top", font.size=3, hjust = 0.6) + theme_classic() + geom_treescale() 
p4 

# NB: the traits are qualitative. Ignore the legend range 0 to 1. 
# The range is to assess the pattern of the traits per species to ensure correct colouring

# Truncate long branched species (tree without traits):
require(ggbreak)
p5 <- p3 + scale_x_break(c(0.07, 0.33)) + scale_x_break(c(0.35, 0.72)) + hexpand(.05) + scale_x_break(c(0.735, 0.745)) + xlim(0,0.765)  + theme_classic()
p5 + geom_treescale()

# To zoom in and check arrangement of traits:
p6 <- p4 + scale_x_ggtree()
p6 + xlim(0.8, 1.7) 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
### Supplementary Figure S3 ###
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Note1: The tree was constructed from MEGA7 and saved as an '.nwk' file as follows:
# Fasta sequences were first cleaned then dereplicated the isolates for maize (n = 112 to 33) and soil (n = 36 to 25)
# Soil and maize isolates were then combined (n = 58), aligned, trimmed, and the phylogenetic tree constructed from the alignment.
# Phylogenetic tree was then saved as a '.nwk' file with branches and used in R:

tree <- read.tree(url("https://github.com/bkatati/adiversity/blob/main/Tree-Asp_soil+maize+Refs.nwk"))
# NB: if file error occurs, download rds file "Tree-Asp_soil+maize+Refs" from site "https://github.com/bkatati/adiversity" 
# On your PC, create appropriate local drive path for the file and change above file path.
library(phytools)
tree

# To view labels:
print(tree$tip.label)

# To identify nodes:
plot(tree, edge.width = 0.2, label.offset = 0.005, type = "radial")
nodelabels()

# Delineate the clades of interest using "geom_hilight" starting at a node to tip:
p4 <- ggtree(tree, layout = "circular", branch.length="none", color="blue", size=0.5, linetype=1) +
  geom_tiplab(size=2, offset=0.1) +
  geom_hilight(node=143, fill="pink", alpha=0.5) + # A. flavus
  geom_hilight(node=98, fill="lightgreen", alpha=0.5) + # A. parasiticus
  geom_hilight(node=140, fill="steelblue", alpha=0.5) + # A. aflatoxiformans
  geom_hilight(node=134, fill="lightblue", alpha=0.5)+ # A. transmontanensis
  geom_hilight(node=168, fill="yellow", alpha=0.5) + # A. minisclerotigenes
  geom_hilight(node=132, fill="green", alpha=0.5)+ # A. sergii
  geom_hilight(node=162, fill="yellow", alpha=0.5) # A. minisclerotigenes

plot(p4)