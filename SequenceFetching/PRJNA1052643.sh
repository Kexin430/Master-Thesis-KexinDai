#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --time=72:00:00
#SBATCH --job-name="PRJNA1052643_sequences"
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
  --i-accession-ids PRJNA1052643-cache:PRJNA1052643_id \
  --p-n-jobs 32 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJNA1052643_single \
  --o-paired-reads PRJNA1052643_paired \
  --o-failed-runs PRJNA1052643_failed_ids