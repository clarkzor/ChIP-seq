# ChIP-seq Analysis on HPC3

This repository contains reusable SLURM scripts and workflow templates developed for ChIP-seq and related chromatin analyses on the HPC3 cluster. The scripts cover the major stages of the analysis, including read quality control, alignment, BAM/BED processing, peak calling, replicate reproducibility, genomic interval analysis, signal visualization, motif analysis, peak annotation, and downstream regulatory analyses.

The repository is intended both as a record of completed analysis workflows and as a practical starting point for future lab members working with ChIP-seq data.

## Recommended repository layout

```text
chipseq-hpc3/
├── README.md
├── docs/
│   ├── workflow_overview.md
│   ├── software_and_modules.md
│   └── hpc3_notes.md
│
├── scripts/
│   ├── workflows/
│   │   ├── chip_pipeline_single_end.sh
│   │   ├── chip_pipeline_single_end_loop.sh
│   │   ├── chip_pipeline_paired_end.sh
│   │   └── chip_pipeline_paired_end_loop.sh
│   │
│   ├── 01_qc/
│   │   ├── fastqc.sh
│   │   └── md5sum.sh
│   │
│   ├── 02_reference_and_alignment/
│   │   ├── bowtie1_build_index.sh
│   │   ├── bowtie1_align_single_end.sh
│   │   ├── bowtie1_align_paired_end.sh
│   │   ├── bowtie2_build_index.sh
│   │   └── bowtie2_align_single_end.sh
│   │
│   ├── 03_bam_bed_processing/
│   │   ├── samtools_sort_bam.sh
│   │   ├── samtools_index_bam.sh
│   │   ├── samtools_merge_bam.sh
│   │   ├── samtools_subsample_bam.sh
│   │   ├── bedtools_bam_to_bed.sh
│   │   ├── bedtools_bed_to_bam.sh
│   │   ├── bedtools_sort_bed.sh
│   │   └── remove_duplicate_bed_coordinates.sh
│   │
│   ├── 04_peak_calling/
│   │   ├── macs2_callpeak_narrow.sh
│   │   └── macs2_callpeak_broad.sh
│   │
│   ├── 05_reproducibility/
│   │   └── idr_analysis.sh
│   │
│   ├── 06_interval_analysis/
│   │   ├── bedtools_intersect_overlap.sh
│   │   ├── bedtools_intersect_nonoverlap.sh
│   │   ├── bedtools_intersect_counts.sh
│   │   ├── bedtools_closest.sh
│   │   ├── bedtools_closest_filter.sh
│   │   ├── bedtools_slop.sh
│   │   ├── bedtools_getfasta.sh
│   │   └── bedtools_random_regions.sh
│   │
│   ├── 07_signal_and_visualization/
│   │   ├── deeptools_bamcoverage.sh
│   │   ├── deeptools_bigwig_scaler.sh
│   │   ├── deeptools_compute_matrix_reference_point.sh
│   │   ├── deeptools_compute_matrix_scale_regions.sh
│   │   ├── deeptools_plot_profile.sh
│   │   ├── deeptools_plot_heatmap.sh
│   │   ├── deeptools_plot_heatmap_kmeans.sh
│   │   └── deeptools_multibam_summary.sh
│   │
│   ├── 08_motif_and_annotation/
│   │   ├── homer_make_tag_directory.sh
│   │   ├── homer_find_motifs_genome.sh
│   │   ├── homer_find_motif_occurrence.sh
│   │   ├── homer_annotate_peaks.sh
│   │   └── homer_make_ucsc_file.sh
│   │
│   ├── 09_regulatory_analysis/
│   │   └── rose_super_enhancer_analysis.sh
│   │
│   └── 10_utilities/
│       ├── concatenate_files_loop.sh
│       ├── remove_mt_regions.sh
│       ├── split_shuffled_lines.sh
│       ├── fasta_splitter.sh
│       ├── genome_file_maker.sh
│       ├── sra_fastq_dump.sh
│       └── file_line_number_utility.sh
│
├── examples/
│   └── project_specific_scripts/
│
└── archive/
    └── legacy_scripts/
```

## Workflow overview

```text
FASTQ
  ↓
FastQC
  ↓
Bowtie / Bowtie2 alignment
  ↓
SAM/BAM conversion
  ↓
sorting / indexing / duplicate handling
  ↓
MACS2 peak calling
  ↓
IDR replicate analysis
  ↓
BEDTools peak comparisons / genomic annotation
  ↓
deepTools signal matrices, profiles, and heatmaps
  ↓
HOMER motif analysis and peak annotation
  ↓
downstream regulatory analyses
```

## Major tools represented

| Tool | Main use in this repository |
| --- | --- |
| FastQC | Raw sequencing read quality control |
| Bowtie / Bowtie2 | Alignment to *Xenopus tropicalis* reference genomes |
| SAMtools | BAM conversion, sorting, indexing, merging, and subsampling |
| BEDTools | Genomic interval manipulation, overlap analysis, nearest-gene analysis, sequence extraction |
| MACS2 | Narrow and broad ChIP-seq peak calling |
| IDR | Reproducibility assessment between biological replicates |
| deepTools | BigWig generation, normalization, coverage summaries, heatmaps, and profile plots |
| HOMER | Motif enrichment, motif occurrence, tag directories, and peak annotation |
| ROSE | Rank-order analysis of broad regulatory regions / super-enhancer-style analyses |
| SRA Toolkit | Retrieval and conversion of public sequencing datasets |

## Design philosophy

The repository separates **complete workflows** from **individual utility scripts**.

Scripts in `scripts/workflows/` represent multi-step analyses that can run substantial portions of a ChIP-seq pipeline. Smaller scripts are grouped by the stage of analysis they perform. Project-specific scripts with hard-coded paths should be kept as worked examples, while reusable templates should use clearly named variables for inputs, outputs, genome references, SLURM resources, and software modules.

Original scripts should be preserved in `archive/legacy_scripts/` before substantial refactoring so that historical analyses remain traceable.

## HPC3 usage

Most scripts are written as SLURM batch jobs and are submitted using:

```bash
sbatch script_name.sh
```

Typical scripts define:

```bash
#SBATCH -A <account>
#SBATCH -p standard
#SBATCH --nodes=1
#SBATCH --cpus-per-task=<threads>
#SBATCH --error=slurm-%J.err
```

Required software is loaded using HPC modules or conda environments within each script.

Because module names and available software versions can change over time, the module configuration used for a published or completed analysis should be recorded alongside the analysis.

## Input and output files

The scripts operate on common genomics file types including:

```text
.fastq / .fastq.gz
.sam
.bam / .bai
.bed
.narrowPeak
.broadPeak
.bigWig / .bw
.fasta
.gtf / .gff3
.npz
```

Large sequencing and alignment files should not be committed directly to GitHub.

## Reference genome

Many scripts in this repository were developed for *Xenopus tropicalis*. Individual analyses use different historical genome builds, so the reference build used by each analysis should be documented explicitly.

When converting scripts into reusable templates, genome-specific resources should be defined near the top of the script, for example:

```bash
GENOME_FASTA=/path/to/Xenopus_tropicalis.fa
GENOME_SIZE=/path/to/Xenopus_tropicalis.genome
BOWTIE2_INDEX=/path/to/index/prefix
GENE_ANNOTATION=/path/to/genes.gtf
```

## Reproducibility

For published or long-term analyses, record:

```text
reference genome build
software version
SLURM resource request
input files
control sample
peak-calling parameters
normalization strategy
IDR threshold
effective genome size
output naming convention
```

Project-specific absolute paths are useful for documenting completed work but should be replaced with configurable variables in reusable templates.

## Notes on legacy scripts

Some scripts in this repository were written for earlier analyses and software versions. They should be treated as historical workflow records until they have been reviewed and converted into current reusable templates.

This is particularly important for commands or software that have changed over time, including older SAMtools duplicate-removal workflows, Python 2-based tools, and older Bowtie syntax.

## Future development

The long-term goal is to maintain two layers of code:

```text
examples/
    exact scripts used for historical analyses

scripts/
    cleaned, reusable, documented templates
```

This preserves analysis provenance while providing future lab members with scripts that are easier to adapt to new ChIP-seq experiments.
