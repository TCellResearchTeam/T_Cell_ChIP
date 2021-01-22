#!/bin/bash
#SBATCH --mem=24gb

module load macs/2.1.0

BAM_INPUT_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2
OUT_DIR1=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2
OUT_DIR2=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2_broad
cd $BAM_INPUT_DIR

########## Peak calling
macs2 callpeak -t 1_07H3_00ZRUCSD_TE-1_BRD4_mm_i77_srt_dupr_flb.bam 2_07H4_00ZRUCSD_TE-2_BRD4_mm_i81_srt_dupr_flb.bam -c 3_07HT_00ZRUCSD_Pooled_Input_mm_i82_srt_dupr_flb.bam \
               -g mm -B --SPMR --nomodel --extsize 147 --call-summits \
               -n 2021_GoldrathLab_Brd4___BRD4_TE-CD8 --outdir $OUT_DIR1
