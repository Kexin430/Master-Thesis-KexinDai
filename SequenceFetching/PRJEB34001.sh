#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --time=72:00:00
#SBATCH --job-name="PRJEB34001_sequences"
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
  --i-accession-ids PRJEB34001_id.qza \
  --p-n-jobs 24 \
  --p-email kexdai@ethz.ch \
  --o-single-reads PRJEB34001-cache:PRJEB34001_single \
  --o-paired-reads PRJEB34001-cache:PRJEB34001_paired \
  --o-failed-runs PRJEB34001-cache:PRJEB34001_failed_ids