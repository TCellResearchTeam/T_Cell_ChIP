#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=16gb

module load sra-tools
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

fastq-dump -I --split-files SRR3203622 &
fastq-dump -I --split-files SRR3203623 &
fastq-dump -I --split-files SRR2467231 &
fastq-dump -I --split-files SRR2467213 &
fastq-dump -I --split-files SRR2467230 &
fastq-dump -I --split-files SRR5217323 &
fastq-dump -I --split-files SRR3586800 &
fastq-dump -I --split-files SRR3586801 
wait
fastq-dump -I --split-files SRR3586802 &
fastq-dump -I --split-files SRR3586803 &
fastq-dump -I --split-files SRR3586804 &
fastq-dump -I --split-files SRR5217324 &
fastq-dump -I --split-files SRR5217322 &
fastq-dump -I --split-files SRR5217325 &
fastq-dump -I --split-files SRR5217326 &
fastq-dump -I --split-files SRR5217327 
