#!/bin/bash

for file in *.tsv; do
	file_name=$(basename "$file" .tsv)
	mkdir "$file_name"
	mv "$file" "$file_name/"
done
