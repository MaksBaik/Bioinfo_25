#!/bin/bash

sum=$(( $(tr '\t' '+' < files/1/fin) ))

echo $sum > fout
