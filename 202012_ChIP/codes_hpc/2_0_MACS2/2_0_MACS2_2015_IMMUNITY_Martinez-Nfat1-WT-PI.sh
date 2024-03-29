#!/bin/bash
#SBATCH --mem=24gb

module load macs/2.1.0

BAM_INPUT_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2
OUT_DIR1=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2
OUT_DIR2=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2_broad
cd $BAM_INPUT_DIR

########## Peak calling
macs2 callpeak -t SRR1731135_srt_dupr_flb.bam -c SRR1731129_srt_dupr_flb.bam \
               -g mm -B --SPMR --nomodel --extsize 147 --call-summits \
               -n 2015_IMMUNITY_Martinez___Nfat1_invitro-CD8-PI-1h-WT --outdir $OUT_DIR1
