#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J 06_trimmomatic_rna_preprocess
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools trimmomatic/0.36
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE ../../raw_data/RNA_raw_data/ERR2036629_1.fastq.gz ../../raw_data/RNA_raw_data/ERR2036629_2.fastq.gz ERR2036629_P1_paired.fastq.gz ERR2036629_P1_unpaired.fastq.gz ERR2036629_P2_paired.fastq.gz ERR2036629_P2_unpaired.fastq.gz  ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.36/snowy/adapters/TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:20 TRAILING:20 MINLEN:36
