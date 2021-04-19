#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J 02_quast_validation
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools prokka/1.12-12547ca

prokka --outdirr ~/chels/genome-analysis/analysis/03_prokka --prefix assembly ../analysis/01_canu/assembly.contigs.fasta



