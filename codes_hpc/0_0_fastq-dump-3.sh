#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR1731135 &
fastq-dump -I --split-files SRR1731136 &
fastq-dump -I --split-files SRR1731137 &
fastq-dump -I --split-files SRR2075567 &
fastq-dump -I --split-files SRR2075568 &
fastq-dump -I --split-files SRR2075569 &
fastq-dump -I --split-files SRR2075570 &
fastq-dump -I --split-files SRR2075583 
wait
fastq-dump -I --split-files SRR2075584 &
fastq-dump -I --split-files SRR2075585 &
fastq-dump -I --split-files SRR2075586 &
fastq-dump -I --split-files SRR3203617 &
fastq-dump -I --split-files SRR3203618 &
fastq-dump -I --split-files SRR3203619 &
fastq-dump -I --split-files SRR3203620 &
fastq-dump -I --split-files SRR3203621 
