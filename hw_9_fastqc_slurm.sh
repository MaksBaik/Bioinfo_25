#!/bin/bash
#SBATCH --job-name=fastqc_multiqc
#SBATCH --cpus-per-task=1
#SBATCH --mem=1gb
#SBATCH --time=1:00:00
#SBATCH --output=JobName.%j.log
#SBATCH --partition=short
#SBATCH --constraint=compute

fastqc *.fastq.gz -o fastqc_reports

multiqc fastqc_reports -o multiqc_report
