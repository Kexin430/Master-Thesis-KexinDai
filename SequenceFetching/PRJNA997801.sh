#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --time=144:00:00
#SBATCH --job-name="PRJNA997801_sequences"
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
  --i-accession-ids PRJNA997801_id.qza \
  --p-n-jobs 24 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJNA997801-cache:PRJNA997801_single \
  --o-paired-reads PRJNA997801-cache:PRJNA997801_paired \
  --o-failed-runs PRJNA997801-cache:PRJNA997801_failed_ids