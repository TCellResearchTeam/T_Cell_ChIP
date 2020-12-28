#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR1124795 &
fastq-dump -I --split-files SRR1124796 &
fastq-dump -I --split-files SRR1124797 &
fastq-dump -I --split-files SRR1124798 &
fastq-dump -I --split-files SRR1124799 &
fastq-dump -I --split-files SRR1124800 &
fastq-dump -I --split-files SRR1124801 &
fastq-dump -I --split-files SRR1124802 
wait
fastq-dump -I --split-files SRR1124803 &
fastq-dump -I --split-files SRR1124804 &
fastq-dump -I --split-files SRR1124805 &
fastq-dump -I --split-files SRR1124806 &
fastq-dump -I --split-files SRR1124807 &
fastq-dump -I --split-files SRR1124808 &
fastq-dump -I --split-files SRR1124809 &
fastq-dump -I --split-files SRR1124810 
