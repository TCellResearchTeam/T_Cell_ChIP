#!/usr/bin/env python

import csv
import pandas as pd
import glob
import os

sra_dir = "/gpfs/group/pipkin/hdiao/T_Cell_ChIP/202012_ChIP/\
1_SRA_Run_Table_simplified"
sra_files = glob.glob("%s/*.csv" % sra_dir)

bam_dir = "/gpfs/group/pipkin/hdiao/T_Cell_ChIP/1_bowtie2"

with open("failed_alignments.csv", "w") as fout:
    wfout = csv.writer(fout, delimiter=",")
    wfout.writerow(["Reference", "Run"])
    for file in sra_files:
        file_name = file.split("/")[-1].replace(".csv", "")
        file_srr_list = pd.read_csv(file)['Run'].tolist()
        for srr in file_srr_list:
            srr_bam_flb = bam_dir + "/%s_srt_dupr_flb.bam" % srr
            srr_bam_flb_size = os.stat(srr_bam_flb).st_size
            # If smaller than 10Mb
            if srr_bam_flb_size < 1048576:
                wfout.writerow([file_name, srr])
