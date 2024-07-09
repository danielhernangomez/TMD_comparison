#!/bin/bash
#SBATCH -t 104:10:00
#SBATCH --exclusive
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=8
#SBATCH -N 8
#SBATCH -J "WS2"
#SBATCH --partition=largemem

export OMP_NUM_THREADS=8
export OMP_PLACES=cores
export OMP_PROC_BIND=true

module reset
module load chem/CP2K/2024.1-foss-2023b-gcc-openmpi-openblas-libgrpp

srun   /pc2/groups/hpc-prf-metdyn/eprop2d1_Jan/02_compile_CP2K/46*/cp2k/exe/local/cp2k.psmp    *.inp &> cp2k.out
