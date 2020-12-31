#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR4437335 &
fastq-dump -I --split-files SRR4437336 &
fastq-dump -I --split-files SRR4437337 &
fastq-dump -I --split-files SRR4437338 &
fastq-dump -I --split-files SRR4437339 &
fastq-dump -I --split-files SRR4437340 &
fastq-dump -I --split-files SRR4437341 &
fastq-dump -I --split-files SRR4437342 
wait
fastq-dump -I --split-files SRR4437343 &
fastq-dump -I --split-files SRR4437344 &
fastq-dump -I --split-files SRR4437345 &
fastq-dump -I --split-files SRR4437346 &
fastq-dump -I --split-files SRR4437347 &
fastq-dump -I --split-files SRR4437348 &
fastq-dump -I --split-files SRR4437349 &
fastq-dump -I --split-files SRR4437350 
