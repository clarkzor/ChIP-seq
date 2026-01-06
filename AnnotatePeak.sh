#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file
#SBATCH -t 12:00:00

PEAKS=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/St105_ezh2-unique.filtered.sorted.bed
FASTA=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_genome.fasta
GFF3=/dfs10/bio/clarklh/RNA_Seq/ReferenceGenome/XENTR_10.0_Xenbase.gtf
OUTPUT=/dfs7/mbt/nymar/paper_2025/fig1/peaks_1D/annotatePeak/St105_ezh2-unique_annotatePeak.txt

annotatePeaks.pl $PEAKS $FASTA -gtf $GFF3 > $OUTPUT
