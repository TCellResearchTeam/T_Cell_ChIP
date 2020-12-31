#!/bin/bash

module load python
cd /gpfs/group/pipkin/hdiao/T_Cell_ChIP/0_fastq

python /gpfs/group/pipkin/hdiao/T_Cell_ChIP/codes_hpc/0_1_solid_to_fastq/solid_to_fastq.py SRR1731134_1.fastq
