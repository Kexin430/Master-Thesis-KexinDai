#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --time=72:00:00
#SBATCH --job-name="PRJEB21603_sequences"
#SBATCH --mem-per-cpu=2048
#SBATCH --tmp=1000G
#SBATCH --mail-type=BEGIN,END
#SBATCH --output=%x.out
#SBATCH --error=%x.err

module load eth_proxy

# Load Conda environment
source ~/.bashrc  # Ensure Conda is available
conda activate fondue  # Activate the correct environment

qiime fondue get-sequences \
  --i-accession-ids PRJEB21603_id.qza \
  --p-n-jobs 32 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJEB21603-cache:PRJEB21603_single \
  --o-paired-reads PRJEB21603-cache:PRJEB21603_paired \
  --o-failed-runs PRJEB21603-cache:PRJEB21603_failed_ids