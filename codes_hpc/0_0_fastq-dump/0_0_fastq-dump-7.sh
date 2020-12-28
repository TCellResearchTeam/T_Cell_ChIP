#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR4437351 &
fastq-dump -I --split-files SRR4437352 &
fastq-dump -I --split-files SRR4437353 &
fastq-dump -I --split-files SRR4437354 &
fastq-dump -I --split-files SRR4437355 &
fastq-dump -I --split-files SRR4437356 &
fastq-dump -I --split-files SRR4437357 &
fastq-dump -I --split-files SRR4437358 
wait
fastq-dump -I --split-files SRR4437359 &
fastq-dump -I --split-files SRR4437360 &
fastq-dump -I --split-files SRR5905836 &
fastq-dump -I --split-files SRR5905837 &
fastq-dump -I --split-files SRR5905838 &
fastq-dump -I --split-files SRR5905839 &
fastq-dump -I --split-files SRR5905840 &
fastq-dump -I --split-files SRR5905841 
