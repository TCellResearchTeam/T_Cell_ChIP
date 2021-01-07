#!/bin/bash

module load ucsc_tools

MACS2_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2
OUT_DIR=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/2_MACS2_bw

bdg_name=$MACS2_DIR/2018_IMMUNITY_Page___Tox_LCMVova_CNS-OTI-CD8-ToxKO_treat_pileup.bdg
bdg_srt_name=$MACS2_DIR/2018_IMMUNITY_Page___Tox_LCMVova_CNS-OTI-CD8-ToxKO_treat_pileup_srt.bdg
bw_name=$OUT_DIR/2018_IMMUNITY_Page___Tox_LCMVova_CNS-OTI-CD8-ToxKO.bw
chrom_size=/gpfs/group/pipkin/hdiao/ref_resources/mm/release102/GRCm38.genome.sizes

##### Sort bedgraph file
LC_COLLATE=C sort -k1,1 -k2,2n $bdg_name > $bdg_srt_name

##### Convert
bedGraphToBigWig $bdg_srt_name $chrom_size $bw_name
