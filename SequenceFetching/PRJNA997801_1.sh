#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=144:00:00
#SBATCH --job-name="PRJNA997801_1_sequences"
#SBATCH --mem-per-cpu=2048
#SBATCH --tmp=1700G
#SBATCH --mail-type=BEGIN,END
#SBATCH --output=%x.out
#SBATCH --error=%x.err

module load eth_proxy

# Load Conda environment
source ~/.bashrc  # Ensure Conda is available
conda activate fondue  # Activate the correct environment

qiime fondue get-sequences \
  --i-accession-ids PRJNA997801_id_1.qza \
  --p-n-jobs 16 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJNA997801-cache:PRJNA997801_1_single \
  --o-paired-reads PRJNA997801-cache:PRJNA997801_1_paired \
  --o-failed-runs PRJNA997801-cache:PRJNA997801_1_failed_ids