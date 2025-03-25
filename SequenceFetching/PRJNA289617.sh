#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --time=72:00:00
#SBATCH --job-name="PRJNA289617_sequences"
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
  --i-accession-ids PRJNA289617-cache:PRJNA289617_id \
  --p-n-jobs 32 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJNA289617_single \
  --o-paired-reads PRJNA289617_paired \
  --o-failed-runs PRJNA289617_failed_ids