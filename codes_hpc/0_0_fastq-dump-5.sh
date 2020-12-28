#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR5217328 &
fastq-dump -I --split-files SRR5217329 &
fastq-dump -I --split-files SRR4437321 &
fastq-dump -I --split-files SRR4437322 &
fastq-dump -I --split-files SRR4437323 &
fastq-dump -I --split-files SRR4437324 &
fastq-dump -I --split-files SRR4437325 &
fastq-dump -I --split-files SRR4437326 
wait
fastq-dump -I --split-files SRR4437327 &
fastq-dump -I --split-files SRR4437328 &
fastq-dump -I --split-files SRR4437329 &
fastq-dump -I --split-files SRR4437330 &
fastq-dump -I --split-files SRR4437331 &
fastq-dump -I --split-files SRR4437332 &
fastq-dump -I --split-files SRR4437333 &
fastq-dump -I --split-files SRR4437334 
