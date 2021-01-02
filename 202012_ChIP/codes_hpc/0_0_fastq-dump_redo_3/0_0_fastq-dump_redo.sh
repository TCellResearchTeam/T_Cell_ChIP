#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR3233933 &
fastq-dump -I --split-files SRR3233934 &
fastq-dump -I --split-files SRR3203617 &
fastq-dump -I --split-files SRR3203621 &
fastq-dump -I --split-files SRR3203622 &
fastq-dump -I --split-files SRR3203623 &
fastq-dump -I --split-files SRR8591880 &
fastq-dump -I --split-files SRR8591881 
wait
fastq-dump -I --split-files SRR8591882 &
fastq-dump -I --split-files SRR8591883 &
fastq-dump -I --split-files SRR8591884 &
fastq-dump -I --split-files SRR8591885 &
fastq-dump -I --split-files SRR8591886 &
fastq-dump -I --split-files SRR8591887 &
fastq-dump -I --split-files SRR8591888 &
fastq-dump -I --split-files SRR8591889 
wait
fastq-dump -I --split-files SRR8591890 &
fastq-dump -I --split-files SRR8591891 &
fastq-dump -I --split-files SRR8591892 &
fastq-dump -I --split-files SRR8591893 &
fastq-dump -I --split-files SRR8591894 &
fastq-dump -I --split-files SRR8591895 &
fastq-dump -I --split-files SRR8591896 &
fastq-dump -I --split-files SRR8591897 
