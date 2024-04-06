# Title: #
# Maize *Aspergillus* section *Flavi* isolate diversity may be distinct from that of soil and subsequently the source of aflatoxin contamination #

DOI: 10.1007/s12550-024-00532-7

Support files to manuscript:

# *1) "Fasta_Soil&Maize+Refs.txt"* # 

is 'txt' file containing denoised nucleotide sequences of 2018/2019 per-field-unique *Aspergillus* section *Flavi* isolates (nonclonal, *n* = 58). It also contains the reference isolate sequences (long codes) obtained from (Frisvad et al. 2019, DOI: 10.1016/j.simyco.2018.06.001) as reference isolates for estimation of correctness of assignement of species taxonomy (supplemental figure S3). The sequences are aligned and used for generation of 'nwk' files.

# *2) "Diversity_Asp_Soil&Maize.R"* #

is code for execution of the examination of the soil and maize *Aspergillus* section *Flavi* species diversity.

# *3) Phylotree-Asp_soil+maize.nwk* #

Is a newick (nwk) file of the phylogenetic tree of the triphasic characterised non-clonal per field, maize (*n* = 33) and soil (*n* = 25), isolates after dereplication of the 148 isolates. The tree's was constructed from aligned species' sequences using software MEGA7 with evolutionary history inferred using the Maximum Likelihood method based on the Tamura-Nei model (Tamura & Nei, 1993). For this construction, cleaned then deduplicated fasta sequences for maize and soil isolates were combined, aligned, trimmed, then a phylogenetic tree constructed in MEGA7 from the alignment. The tree was then saved as a "nwk" file with branches" for use in this R code "Diversity.R."

# *4) "Tree-Asp_soil+maize+Refs.nwk"* #

the file is a 'nwk' file of the phylogenetic tree of soil and maize isolates (*n* = 58) including reference isolates for estimation of correctness of assignement of species taxonomy. The tree's was similarly constructed by maximum likelihood (MEGA v7). The 'nwk' file is run in the R code "Diversity.R."

# *5) "Triphasic.csv"* #

'the file is csv and contains assigned traits per soil/maize isolates. The traits are phenotypic as metabolic (Aflatoxin-B, Aflatoxin-G, Cyclopiazonic acid production) and morphological (large sclerotia production, colony colour). Polymorphism is based on the calmodulin gene sequences (CAMseq). The metabolites are qualitatively assigned using thin layer chromatography as produced (value = '1') or not produced (value = '0', upon HPLC verification). Production of conspicous large sclerotia is assigned '1,' and green colour assigned '1.' The ecological niches are Soil (value '1') and maize (value '0') according to location from which isolate was obtained.

# *6) "Diversity_model.xlsx"* #

contains the parameters to fit the model 'y=f(x),' which explains response of aflatoxin levels in maize to species ratio between *A. minisclerotigenes* and *A. parasiticus* (Equation-1, Materials and Methods).
