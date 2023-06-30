0) "Sanger_Asp_Nonclonal_Maize_S1S2+rm.fasta"

is 'txt' file containing sequences of 2018/2019 & 2020/2021 seasons Flavi and reference isolates extracted from maize and obtained from online databases. 
Data is used in the verification of correctness of assignement of species taxonomy (supplemental figure 2).

1) "Sanger_Asp_Nonclonal_Soil&Maize_S1.fasta"

is 'txt' file containing sequences of 2018/2019 season Flavi isolates extracted from maize and soil.

2) "Sanger_Asp_Soil&Maize_Aligned_dedupe.meg"

is a 'mega' format file containing aligned sequences of maize and soil Flavi isolates (2018/2019 season) used in construction of the phylogenetic tree. This displays clustering amonng the soil and maize isolates. The tree is then converted into a nwk file for furhter analysis in R.

3) "PhyloFlavi.nwk"

the file is an 'nwk' of the phylogenetic tree. The tree's was constructed from aligend species' sequences using software MEGA7 with evolutionary history inferred using the Maximum Likelihood method based on the Tamura-Nei model (Tamura & Nei, 1993). For this construction, cleaned then deduplicated fasta sequences for maize and soil isolates were combined, aligned, trimmed, then a phylogenetic tree constructed in MEGA7 from the alignment. The tree was then saved as a "nwk" file with branches" for use in this R code.

4) "traits.csv"

'the file is csv and contains assigned traits per species on basis of i) ecosystem (soil or maize) ii) mycotoxigenicity (AF-B/-G and/or CPA production). The metabolites are qualitatively assigned using thin layer chromatography as produced (value = '1') or not produced (value = '0'). The ecological niches are Soil (value '1') and maize (value '2') according to location from which species was isolated from.

5) "Diversity.R"

is code for execution of the examination of the species diversity in relation and the relation with aflatoxins.

6) "Diversity_model.xlsx"

contains the parameters to fit the model y=f(x), which explains response of aflatoxin levels in maize to species ratio between  A. minisclerotigenes and A. parasiticus. 