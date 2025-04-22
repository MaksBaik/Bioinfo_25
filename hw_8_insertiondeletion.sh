#!/bin/bash

input_file="clinvar_20250330.vcf"
output_file="fout"

longest_insertion=""
longest_insertion_length=0
longest_deletion=""
longest_deletion_length=0

while read -r line; do 
	if [[ $line == \#* ]]; then
	       continue
	fi 

	IFS=$'\t' read -r chrom pos id ref alt qual filter info <<< "$line"

	ref_length=${#ref}
	alt_length=${#alt}

	length_difference=$((ref_length - alt_length))

	if (( length_difference > 0 )); then
		deletion_length=$length_difference
		if (( deletion_length > longest_deletion_length )); then
			longest_deletion=$ref
			longest_deletion_length=$deletion_length
		fi

	elif (( length_difference < 0 )); then
		insertion_length=$(( -length_difference ))
		if (( insertion_length > longest_insertion_length )); then
			longest_insertion=$alt
			longest_insertion_length=$insertion_length
		fi
	fi
	
done < "$input_file"

{
	echo "Longest insertion:"
	echo "$longest_insertion"
	echo "Longest deletion:"
	echo "$longest_deletion"
} >> "$output_file"
