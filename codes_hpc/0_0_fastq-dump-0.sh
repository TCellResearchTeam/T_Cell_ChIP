#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR851152 &
fastq-dump -I --split-files SRR851153 &
fastq-dump -I --split-files SRR851154 &
fastq-dump -I --split-files SRR851155 &
fastq-dump -I --split-files SRR955610 &
fastq-dump -I --split-files SRR955611 &
fastq-dump -I --split-files SRR955612 &
fastq-dump -I --split-files SRR955613 
wait
fastq-dump -I --split-files SRR955614 &
fastq-dump -I --split-files SRR955620 &
fastq-dump -I --split-files SRR955621 &
fastq-dump -I --split-files SRR955622 &
fastq-dump -I --split-files SRR955623 &
fastq-dump -I --split-files SRR955624 &
fastq-dump -I --split-files SRR955625 &
fastq-dump -I --split-files SRR955626 
