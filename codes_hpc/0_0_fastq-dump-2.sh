#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR1124811 &
fastq-dump -I --split-files SRR1124812 &
fastq-dump -I --split-files SRR1124813 &
fastq-dump -I --split-files SRR1124814 &
fastq-dump -I --split-files SRR1124815 &
fastq-dump -I --split-files SRR1124816 &
fastq-dump -I --split-files SRR1124817 &
fastq-dump -I --split-files SRR1731126 
wait
fastq-dump -I --split-files SRR1731127 &
fastq-dump -I --split-files SRR1731128 &
fastq-dump -I --split-files SRR1731129 &
fastq-dump -I --split-files SRR1731130 &
fastq-dump -I --split-files SRR1731131 &
fastq-dump -I --split-files SRR1731132 &
fastq-dump -I --split-files SRR1731133 &
fastq-dump -I --split-files SRR1731134 
