#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J 02_mummer_validation
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools MUMmer/3.23

mummer -b -c -mum ../../raw_data/reference/OBMB01.fasta ../01_canu/assembly.contigs.fasta > mummer.mums
mummerplot -R ../../raw_data/reference/OBMB01.fasta -Q ../01_canu/assembly.contigs.fasta --png -p mummer mummer.mums
 



