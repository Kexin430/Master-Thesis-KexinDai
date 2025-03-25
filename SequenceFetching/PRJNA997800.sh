#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --time=72:00:00
#SBATCH --job-name="PRJNA997800_sequences"
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
  --i-accession-ids PRJNA997800-cache:PRJNA997800_id \
  --p-n-jobs 32 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJNA997800-cache:PRJNA997800_single \
  --o-paired-reads PRJNA997800-cache:PRJNA997800_paired \
  --o-failed-runs PRJNA997800-cache:PRJNA997800_failed_ids