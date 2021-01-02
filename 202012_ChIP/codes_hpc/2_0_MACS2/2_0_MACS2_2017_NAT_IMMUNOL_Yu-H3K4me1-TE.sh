#!/bin/bash
#SBATCH --mem=24gb

module load macs/2.1.0

BAM_INPUT_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2
OUT_DIR1=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2
OUT_DIR2=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2_broad
cd $BAM_INPUT_DIR

########## Peak calling
macs2 callpeak -t SRR4437331_srt_dupr_flb.bam SRR4437332_srt_dupr_flb.bam -c SRR4437355_srt_dupr_flb.bam SRR4437356_srt_dupr_flb.bam \
               -g mm -B --SPMR --nomodel --extsize 147 --call-summits \
               -n 2017_NAT_IMMUNOL_Yu___H3K4me1_P14-CD8-TE --outdir $OUT_DIR1

macs2 callpeak -t SRR4437331_srt_dupr_flb.bam SRR4437332_srt_dupr_flb.bam -c SRR4437355_srt_dupr_flb.bam SRR4437356_srt_dupr_flb.bam \
               -g mm --nomodel --extsize 147 --broad \
               -n 2017_NAT_IMMUNOL_Yu___H3K4me1_P14-CD8-TE --outdir $OUT_DIR2
