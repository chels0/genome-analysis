#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:30:00
#SBATCH -J 09_htseq_rna_counting_ERR2117290
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools
module load htseq/0.12.4
module load samtools/1.9 
#Måste göra ett sånt här skript för varje fil och ha med samtools index för att indexera skiten

#Path to file

path=/home/chels/genome-analysis/analysis/08_bwa

samtools index -@ 2 ${path}/ERR2117290.sorted.bam 

htseq-count -f bam -r pos -t CDS -i ID -s reverse ${path}/ERR2117290.sorted.bam annotation_without_nucleotides.gff > ERR2117290_mapped_read_counts_batch.txt  

