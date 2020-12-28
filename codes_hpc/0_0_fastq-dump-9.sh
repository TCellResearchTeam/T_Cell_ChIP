#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR8240837 &
fastq-dump -I --split-files SRR5195618 &
fastq-dump -I --split-files SRR5195619 &
fastq-dump -I --split-files SRR5195620 &
fastq-dump -I --split-files SRR6228881 &
fastq-dump -I --split-files SRR6228882 &
fastq-dump -I --split-files SRR6228883 &
fastq-dump -I --split-files SRR6228884 
wait
fastq-dump -I --split-files SRR6228885 &
fastq-dump -I --split-files SRR6228886 &
fastq-dump -I --split-files SRR6228887 &
fastq-dump -I --split-files SRR6228888 &
fastq-dump -I --split-files SRR10285313 &
fastq-dump -I --split-files SRR10285314 &
fastq-dump -I --split-files SRR10285315 &
fastq-dump -I --split-files SRR10285316 
