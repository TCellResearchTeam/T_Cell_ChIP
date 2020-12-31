#!/usr/bin/env python

import csv
import sys

solid_dict_second = {'0': ["A", "C", "G", "T"],
             '1': ["C", "A", "T", "G"],
             '2': ["G", "T", "A", "C"],
             '3': ["T", "G", "C", "A"]}

def solid_to_seq(solid_seq):
    solid_seq_list = list(solid_seq)[1:]
    start_char = solid_seq[0]
    first_char = start_char

    seq_list = []
    for i in solid_seq_list:
        # # # If previous nucleotide is unknown
        if first_char == ".":
            seq_list.append("N")
            first_char = "."
        # # # If previous nucleotide is known
        else:
            # Get positition of second nucleotide
            second_pos = ["A", "C", "G", "T"].index(first_char)
            if i != ".":
                second_char = solid_dict_second[i][second_pos]
                seq_list.append(second_char)
            else:
                second_char = "."
                seq_list.append("N")
            first_char = second_char
    return("".join(seq_list))


fastq_file = sys.argv[1]
fastq_file_new = fastq_file.replace(".fastq", "_solidCvt.fastq").replace(".fq", "_solidCvt.fastq")

with open(fastq_file, "r") as fin:
    with open(fastq_file_new, "w") as fout:
        rfin = csv.reader(fin, delimiter=",")
        wfout = csv.writer(fout, delimiter=",", lineterminator='\n')
        row_n = 0
        for row in rfin:
            if row_n % 4 == 1:
                wfout.writerow([solid_to_seq(row[0])])
            elif row_n % 4 == 3:
                wfout.writerow([row[0][1:]])
            else:
                wfout.writerow(row)
            row_n += 1




