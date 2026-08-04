# Validation and migration summary

## Original scripts

- Historical shell scripts preserved unchanged: **55**
- Every original script is mapped in `docs/script_catalog.csv`.

## Reusable templates

- Reusable shell files under `scripts/`: **53**
- `bash -n` syntax validation: **53 PASS / 0 FAIL**

## Migration classifications

- Cleaned: **31**
- Corrected: **20**
- Review required: **2**
- Duplicate consolidated: **1**
- Legacy: **1**

`bash -n` confirms shell syntax only. It does not confirm that HPC3 module names,
conda environments, reference files, or project input paths exist.

## Files intentionally requiring review

1. `filter_closest_gene_rows_loop.sh`
   - The historical awk filter depends on the exact column layout created by the
     chosen GFF/GTF plus `bedtools closest`. Confirm the gene-feature column before
     treating this as a universal annotation filter.

2. `samtools_subsample_bam.sh`
   - The historical workflow used `samtools view -s 0.9562`. The exact seed/fraction
     interpretation depends on the SAMtools version. Confirm the installed version
     before using the template for quantitative downsampling.

## Legacy workflow

`rose_super_enhancer_analysis_legacy.sh` is retained because it documents a real
analysis workflow, but the historical implementation uses Python 2.7-era ROSE.
It is explicitly labeled legacy rather than presented as a current default.
