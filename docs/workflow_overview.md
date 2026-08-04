# Workflow overview

The reusable scripts are grouped by analysis stage rather than only by software name.

1. `01_qc` — sequence integrity and read-quality checks.
2. `02_reference_and_alignment` — genome index construction and read alignment.
3. `03_bam_bed_processing` — format conversion, sorting, indexing, merging, subsampling, and BED cleanup.
4. `04_peak_calling` — MACS2 narrow- and broad-peak calling.
5. `05_reproducibility` — IDR analysis of biological replicates.
6. `06_interval_analysis` — overlap, non-overlap, closest-feature, slop, FASTA extraction, and random controls.
7. `07_signal_and_visualization` — normalized coverage, matrices, profiles, heatmaps, and binned-genome comparisons.
8. `08_motif_and_annotation` — HOMER motif enrichment, motif occurrence, tag directories, and peak annotation.
9. `09_regulatory_analysis` — specialized downstream analyses such as legacy ROSE.
10. `10_utilities` — file manipulation and reference-file utilities.

The `workflows/` directory contains longer scripts that chain multiple processing stages.
