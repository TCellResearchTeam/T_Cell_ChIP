#!/bin/bash
#SBATCH --mem=24gb

module load macs/2.1.0

BAM_INPUT_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2
OUT_DIR1=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2
OUT_DIR2=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2_broad
cd $BAM_INPUT_DIR

########## Peak calling
macs2 callpeak -t SRR8591885_srt_dupr_flb.bam SRR8591886_srt_dupr_flb.bam SRR8591887_srt_dupr_flb.bam SRR8591888_srt_dupr_flb.bam SRR8591889_srt_dupr_flb.bam -c SRR8591890_srt_dupr_flb.bam \
               -g mm -B --SPMR --nomodel --extsize 147 --call-summits \
               -n 2019_IMMUNITY_Veeken___Cbfb_LCMV-d07-CD8 --outdir $OUT_DIR1