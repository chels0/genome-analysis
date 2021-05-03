#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J 08_bwa_rna_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools 
module load bwa/0.7.17
module load samtools/1.9


#Run bwa index
bwa index -p index_mapping assembly.contigs.fasta

#Iterate through list of accession numbers
for prefix in $(cat prefix_p1_file.txt)
do
	bwa mem -t 2 index_mapping /home/chels/genome-analysis/raw_data/RNA_trimmed_reads/${prefix}_P1.trim.fastq.gz /home/chels/genome-analysis/raw_data/RNA_trimmed_reads/${prefix}_P2.trim.fastq.gz | samtools sort -@ 2 -o ${prefix}.sorted.bam -;
done
