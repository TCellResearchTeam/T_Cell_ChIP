#!/usr/bin/env python

import csv
import pandas as pd
import glob
import math
from pathlib import Path

sra_dir = "/gpfs/group/pipkin/hdiao/T_Cell_ChIP/202012_ChIP/1_SRA_Run_Table_simplified"
sra_files = glob.glob("%s/*.csv"%sra_dir)

fastq_dir = "/gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq"
fastq_files = glob.glob("%s/*.fastq"%fastq_dir)
fastq_srr_list = list(set([x.split("/")[-1].split("_")[0] for x in fastq_files]))

srr_failed_list = []
with open("failed_srr.csv", "w") as fout:
    wfout = csv.writer(fout, delimiter=",")
    wfout.writerow(["Reference", "Run"])
    for file in sra_files:
        file_name = file.split("/")[-1].replace(".csv", "")
        file_srr_list = pd.read_csv(file)['Run'].tolist()
        for srr in file_srr_list:
            if srr not in fastq_srr_list:
                wfout.writerow([file_name, srr])
                srr_failed_list.append(srr)

out_file = "0_0_fastq-dump_redo.sh"
hpc_wkdir = "/gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq"
with open(out_file, "w") as fout:
    wfout = csv.writer(fout, delimiter="\t",lineterminator='\n')
    wfout.writerow(["#!/bin/bash"])
    wfout.writerow(["#SBATCH --nodes=1"])
    wfout.writerow(["#SBATCH --ntasks=8"])
    wfout.writerow(["#SBATCH --mem=16gb"])
    wfout.writerow([])
    wfout.writerow(["module load sra-tools"])
    wfout.writerow(["cd %s"%hpc_wkdir])
    wfout.writerow([])

    for j in range(0, len(srr_failed_list)):
        j_srr = srr_failed_list[j]
        if ((j+1) % 8 != 0) and (j < len(srr_failed_list)-1):
            wfout.writerow(["fastq-dump -I --split-files %s &"%j_srr])
        elif (j < len(srr_failed_list)-1):
            wfout.writerow(["fastq-dump -I --split-files %s "%j_srr])
            wfout.writerow(["wait"])
        else:
            wfout.writerow(["fastq-dump -I --split-files %s "%j_srr])
        

