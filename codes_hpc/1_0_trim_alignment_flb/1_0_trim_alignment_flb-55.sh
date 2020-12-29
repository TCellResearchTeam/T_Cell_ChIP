#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --mem=8gb

module load fastqc
module load trimgalore
module load samtools
module load bowtie2
module load bedtools

### Fastqc for untrimmed files
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq
fastq_untrimmed_1=SRR2075583_1.fastq
fastqc $fastq_untrimmed_1

### Trim Galore
trim_galore --length 24 --stringency 3 $fastq_untrimmed_1
trim_fastq_end1=/gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq/SRR2075583_1_trimmed.fq

### Fastqc for trimmed files
fastqc $trim_fastq_end1

### Bowtie2 alignment
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2
bowtie2_index=/gpfs/group/pipkin/hdiao/ref_resources/mm/release102/GRCm38
sam_name=SRR2075583.sam
bowtie2 -p 16 -x $bowtie2_index -U $trim_fastq_end1 -S $sam_name

### Convert/sort/filter
bam_name=SRR2075583.bam
bam_name_srt=SRR2075583_srt.sam
sam_name_srt_dupr=SRR2075583_srt_dupr.sam
bam_name_srt_dupr=SRR2075583_srt_dupr.bam
flb_bam_name=SRR2075583_srt_dupr_flb.bam
blacklist_bed=/gpfs/group/pipkin/hdiao/ref_resources/mm/mm10_blacklisted_2016_nochr.bed

samtools view -bS $sam_name > $bam_name
samtools sort $bam_name -o $bam_name_srt
samtools rmdup -S $bam_name_srt $sam_name_srt_dupr
samtools view -bS $sam_name_srt_dupr > $bam_name_srt_dupr
bedtools intersect -abam $bam_name_srt_dupr -b $blacklist_bed -v > $flb_bam_name

### Remove intermediate files
filesize=$(stat -c%s $flb_bam_name)
if (( filesize > 10000 )) 
then
    rm $sam_name
    rm $bam_name
    rm $bam_name_srt
    rm $sam_name_srt_dupr
    rm $bam_name_srt_dupr
    rm $trim_fastq_end1
fi
