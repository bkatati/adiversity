# Retrieve phylogenetic tree
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Note1: The tree was constructed from MEGA7 and saved as an '.nwk' file as follows:
# cleaned then deduplicated sequences for maize and soil isolates were combined, aligned, trimmed, and phylogenetic tree constructed from the alignment.
# Phylogenetic tree was then saved as a ".nwk file with branches" and used in R:
require(ggtree)
tree <- read.tree("C:/Users/katat001/OneDrive - Wageningen University & Research/ACADEMIC/Thesis/Publications/Github/adiverse/PhyloFlavi.nwk")
tree
# Schematic view of the tree:
ggplot(tree) + geom_tree()

# Check & note for positions of nodes where the Aspergilli differentiate at species level:
require(tidyverse)
p1 <- ggtree(tree, aes(color=branch.length), size=1.2, linetype=1) +
  xlim(0, 0.035) + 
  geom_tiplab(size=3.2, color="darkgreen", offset = 0.00005, linetype = 3) +
  theme_tree2("black") +
  scale_color_continuous(low='red', high='blue', name="Branch Length") +
  theme_bw() + theme(legend.position="bottom") +
  geom_label2(aes(subset=!isTip, label=node), size=3, color="darkred", alpha=1)

plot(p1)

# Retrieve traits (metabolic profiles/ecological niche) to later add to the tree:
traits2 <- read.csv("C:/Users/katat001/OneDrive - Wageningen University & Research/ACADEMIC/Thesis/Publications/Github/adiverse/traits.csv")
head(traits2)
dim(traits2)
# Important!!! Ensure that order of the species in the csv for traits is exactly as arrangement in your tree:
# The order in raw file from cinematographic analysis will not be the same as order in the tree. To check this:
# Write csv of the species on the tree:
# Write.csv(tree$tip.label, "~your path/tree_check.csv")
# Arrange species metabolic profiles according to "tree_check.csv" file.

matrix <- as.matrix(traits2[,c(3:5)])
matrix
rownames(matrix) <- (traits2[,1])
head(matrix)

# Colour for each niche (maize and soil) is defined:
my_colours <- c("darkgreen", "brown")

# Branched tree:
p2 <- ggtree(tree, aes(color=branch.length), size=1.2, linetype=1) +
  xlim(0, 0.075) + 
  scale_color_continuous(low='red', high='black', name="Branch Length") +
  theme_bw() + theme(legend.position="bottom") +
  geom_tiplab(size=3.2, color=my_colours[(traits2$Niche == 1)+1], offset = 0.0005, linetype = 3)

p2

# Species clades are assigned  based on identified node numbers
p3 <- p2 + 
  geom_cladelabel(98, "A. Oryzae", offset=0.003, barsize=1,angle=90, offset.text=0.0005, hjust=0.6, fontsize=4.5) + 
  geom_cladelabel(55, "A. Parasiticus", offset=0.003, barsize=01, angle=90, offset.text=0.0005, hjust=0.4, fontsize=4.5) +
  geom_cladelabel(85, "A. Minisclerotigenes", offset=0.003, barsize=1, angle=90, offset.text=0.0005, hjust=0.4, fontsize=4.5) +
  geom_cladelabel(96, "A. Flavus", offset=0.003, barsize=1, angle=90, offset.text=0.0005, hjust=0.4, fontsize=4.5) +

  
  # and taxa of same field but with no sequence divergence (CaM) linked:

geom_taxalink("M10B", "E10A", color="blue3", linetype=2, size = 1) +
geom_taxalink("M14E", "E14B", color="blue", linetype=2, size = 1) +
geom_taxalink("M19B", "E19A", color="blue", linetype=2, size = 1) +
geom_taxalink("M16G", "E16B", color="blue", linetype=2, size = 1)

plot(p3)

# Combined branched Tree with species traits:

p4 <-  gheatmap(p3, matrix, offset=0.001, low="green", high="red", colnames_position = "top", font.size=5) + theme_classic()
p4

# NB: the traits are qualitative. Ignore the range 0 - 1.