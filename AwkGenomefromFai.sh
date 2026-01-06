1) Use samtools to generate fasta index samtools faidx lyrata_genome.fa - this will create a lyrata_genome.fa.fai (index file)

But, this index file won't work as genome file due to file format issue (mainly more than required number of columns).

2) take the index file, then use awk

awk -v OFS='\t' {'print $1,$2'} lyrata_genome.fa.fai > lyrata_genomeFile.txt

this prints the 1st and 2nd column of a fai index file and separates the column by tab (OFS flag).
use this file as genome file in bedtools.
if space desired between columns do this

awk {'print $1,"",$2'} lyrata_genome.fa.fai > lyrata_genomeFile.txt

if 'chr' needs to be added infront of the chromosome/scaffold names do this

awk {'print "chr"$1,"",$2'} lyrata_genome.fa.fai > lyrata_genomeFile.txt
