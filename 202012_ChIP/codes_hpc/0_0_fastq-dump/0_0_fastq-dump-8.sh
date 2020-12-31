#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR5905842 &
fastq-dump -I --split-files SRR5905843 &
fastq-dump -I --split-files SRR5905844 &
fastq-dump -I --split-files SRR5905845 &
fastq-dump -I --split-files SRR5905846 &
fastq-dump -I --split-files SRR5905847 &
fastq-dump -I --split-files SRR5905848 &
fastq-dump -I --split-files SRR5905849 
wait
fastq-dump -I --split-files SRR5905850 &
fastq-dump -I --split-files SRR5905851 &
fastq-dump -I --split-files SRR5905852 &
fastq-dump -I --split-files SRR5905853 &
fastq-dump -I --split-files SRR5905854 &
fastq-dump -I --split-files SRR8240834 &
fastq-dump -I --split-files SRR8240835 &
fastq-dump -I --split-files SRR8240836 
