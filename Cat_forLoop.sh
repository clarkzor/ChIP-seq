#!/bin/bash
#SBATCH -A kwcho_lab
#SBATCH -J CatBoiz
#SBATCH -p standard
#SBATCH --nodes=1 ##number of nodes to use
#SBATCH --cpus-per-task=30 ##number of cores to use per node
#SBATCH -error=slurm-%J.err ##Error file


OUTPUT=/dfs10/bio/clarklh/New_ChIP/Grhl1_ChIP_Pooled_rmdup.bed
> "$OUTPUT"

for i in {1..4}; do
  f="/dfs10/bio/clarklh/New_ChIP/Grhl1_ChIP_R${i}_rmdup.bed"
  [[ -s "$f" ]] || { echo "Missing or empty: $f" >&2; exit 1; }
  cat "$f" >> "$OUTPUT"
done


