#!/bin/bash

grep -i '[0-9]' files/6/6.1/fin | grep -vi '[xy]' | tr -d '\n' | wc -c >> fout
grep -i '[0-9]' files/6/6.2/fin | grep -vi '[xy]' | tr -d '\n' | wc -c >> fout
