#!/bin/bash
#SBATCH --mem=24gb

module load macs/2.1.0

BAM_INPUT_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2
OUT_DIR1=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2
OUT_DIR2=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2_broad
cd $BAM_INPUT_DIR

########## Peak calling
macs2 callpeak -t SRR6228885_srt_dupr_flb.bam -c SRR6228886_srt_dupr_flb.bam \
               -g mm -B --SPMR --nomodel --extsize 147 --call-summits \
               -n 2018_SCIENCE_Pace_native___H3K9me3_invitro-d3-CD8-WT --outdir $OUT_DIR1

macs2 callpeak -t SRR6228885_srt_dupr_flb.bam -c SRR6228886_srt_dupr_flb.bam \
               -g mm --nomodel --extsize 147 --broad \
               -n 2018_SCIENCE_Pace_native___H3K9me3_invitro-d3-CD8-WT --outdir $OUT_DIR2
