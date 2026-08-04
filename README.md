# ChIP-seq Analysis Toolkit for HPC3

This repository contains reusable SLURM templates and historical analysis scripts developed for ChIP-seq and related chromatin analyses on the HPC3 cluster. The code covers sequencing QC, alignment, BAM/BED processing, peak calling, replicate reproducibility, genomic interval analysis, signal visualization, motif analysis, peak annotation, and downstream regulatory analysis.

The repository has two layers:

- **`scripts/`** — cleaned, reusable templates intended for future analyses.
- **`examples/project_specific_scripts/`** — original project-specific scripts, preserved unchanged for analysis provenance.

## Workflow

```text
FASTQ
  ↓
FastQC
  ↓
Bowtie / Bowtie2 alignment
  ↓
SAM/BAM processing
  ↓
sorting / indexing / duplicate handling
  ↓
MACS2 peak calling
  ↓
IDR replicate analysis
  ↓
BEDTools interval analysis
  ↓
deepTools signal matrices / profiles / heatmaps
  ↓
HOMER motif and peak annotation
  ↓
downstream regulatory analyses
```

## Repository structure

```text
chipseq_hpc3_toolkit/
├── README.md
├── config/
│   └── reference_paths.example.sh
├── docs/
│   ├── workflow_overview.md
│   ├── software_and_modules.md
│   ├── migration_notes.md
│   └── script_catalog.csv
├── scripts/
│   ├── lib/
│   ├── workflows/
│   ├── 01_qc/
│   ├── 02_reference_and_alignment/
│   ├── 03_bam_bed_processing/
│   ├── 04_peak_calling/
│   ├── 05_reproducibility/
│   ├── 06_interval_analysis/
│   ├── 07_signal_and_visualization/
│   ├── 08_motif_and_annotation/
│   ├── 09_regulatory_analysis/
│   └── 10_utilities/
├── examples/
│   └── project_specific_scripts/
└── validation/
```

## Getting started

```bash
cp config/reference_paths.example.sh config/reference_paths.sh
```

Edit `config/reference_paths.sh`, then copy or modify the relevant reusable script and submit it with:

```bash
sbatch script_name.sh
```

## Main tools

| Tool | Role |
| --- | --- |
| FastQC | Raw sequencing QC |
| Bowtie / Bowtie2 | Alignment |
| SAMtools | BAM conversion, sorting, indexing, merging, subsampling |
| BEDTools | Interval operations and sequence extraction |
| MACS2 | Narrow and broad peak calling |
| IDR | Replicate reproducibility |
| deepTools | Coverage, matrices, profiles, and heatmaps |
| HOMER | Motif enrichment and peak annotation |
| ROSE | Legacy rank-ordered regulatory-region analysis |
| SRA Toolkit | Public sequencing-data retrieval |

## Reference genome

Many historical analyses use *Xenopus tropicalis*. More than one genome build appears in the historical scripts, so document the exact reference build for every project. Reusable templates use `config/reference_paths.sh` instead of embedding user-specific `/dfs...` paths.

## Reproducibility

Record the reference build, software/module versions, input/control samples, replicate structure, duplicate-handling strategy, peak-calling parameters, IDR threshold, normalization strategy, effective genome size, and output naming convention.

## Legacy commands

Some original scripts use deprecated or project-specific commands. They remain unchanged under `examples/project_specific_scripts/`, while cleaned templates fix obvious syntax/path issues and flag legacy behavior. See `docs/migration_notes.md`.

## Validation

Cleaned scripts are syntax-checked with `bash -n`; reports are stored under `validation/`.

**Primary organism:** *Xenopus tropicalis*  
**Primary assays:** ChIP-seq and related chromatin analyses  
**Computing environment:** SLURM-based HPC3
