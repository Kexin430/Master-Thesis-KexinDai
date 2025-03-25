#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --time=144:00:00
#SBATCH --job-name="PRJEB65292_sequences"
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
  --i-accession-ids PRJEB65292_id.qza \
  --p-n-jobs 24 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJEB65292-cache:PRJEB65292_single \
  --o-paired-reads PRJEB65292-cache:PRJEB65292_paired \
  --o-failed-runs PRJEB65292-cache:PRJEB65292_failed_ids