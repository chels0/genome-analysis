#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J 02_quast_validation
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools quast/4.5.4

quast.py -R ../../raw_data/reference/OBMB01.fasta --threads 1 ../01_canu/assembly.contigs.fasta
