# Software and module notes

Historical scripts use HPC3 modules and conda environments. Exact module names can change, so confirm availability on the cluster before running a template.

Common tools represented:

- FastQC
- Bowtie 1
- Bowtie2
- SAMtools
- BEDTools
- MACS2
- IDR
- deepTools
- HOMER
- SRA Toolkit
- ROSE (legacy Python 2 workflow)

Where possible, cleaned templates use `${SLURM_CPUS_PER_TASK}` for thread counts instead of hard-coding a second CPU count.

For conda-based tools such as HOMER or IDR, the templates assume the environment already exists. Environment creation is intentionally kept separate from analysis scripts.
