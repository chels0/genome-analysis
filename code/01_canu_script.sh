#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 16:00:00
#SBATCH -J 01_canu_genome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user chelsea.ramsin.9601@student.uu.se

module load bioinfo-tools
module 
