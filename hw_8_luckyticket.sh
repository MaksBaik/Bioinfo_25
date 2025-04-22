#!/bin/bash

while IFS= read -r name && IFS= read -r ticket; do 
	if [[ "$ticket" == *"777"* ]]; then
		echo "$name" >> fout
		echo "$ticket" >> fout
	fi 
done < files/4/fin
