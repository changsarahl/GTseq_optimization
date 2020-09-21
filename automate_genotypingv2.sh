#!/bin/bash
#automate genotyping for multiple files when using the GTseq_Genotyper.pl script in the GTseq pipeline.
#make sure the GTseq_Genotyper.pl script is in the same folder as this script, as well as your fastq files.
#change this script according to your file names, this current iteration will search for all forward reads as fastq files
#execute this by running: ./automate_genotyping.sh
#SLC

read -p 'What is your probeseqsfilename called (include .csv)? ' probeseq
for file in *R1.fastq
do 
	perl GTseq_Genotyper_v3.pl $probeseq $file > $file.genos
	mmv '*.fastq.genos' '#1.genos'
done

