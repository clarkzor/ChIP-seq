# Migration notes from the historical scripts

The original files in `examples/project_specific_scripts/` are preserved unchanged. Reusable templates apply the following cleanup:

- Replace project-specific `/dfs...` paths with named variables.
- Quote paths consistently.
- Add `set -euo pipefail`.
- Use descriptive filenames and SLURM job names.
- Use `${SLURM_CPUS_PER_TASK}` when supported.
- Separate reference-genome configuration from sample-specific inputs.
- Use `.gz` for deepTools `computeMatrix` output instead of `.sh`.
- Correct malformed/incomplete alignment syntax.
- Correct Bowtie2 index-building argument order.
- Correct `bamCoverage` to consume BAM rather than BAI.
- Correct the BEDTools random-region variable-name typo.
- Replace the historical attempt to run `samtools rmdup` on a `narrowPeak` file with BED-coordinate deduplication.
- Correct BAM merging: `samtools merge -b` expects a BAM-list file, not BAM paths.
- Replace incorrect `.fai` parsing with direct extraction of sequence names and lengths.
- Mark ROSE/Python 2 and `samtools rmdup` workflows as legacy where appropriate.

These changes improve safety and readability without altering the preserved historical record.
