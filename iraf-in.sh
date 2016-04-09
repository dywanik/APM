#/bin/bash
# Prepares input files for IRAF
ls *.fit > lista.txt
sed 's/fit/imh/g' lista.txt > lista2.txt
sed 's/.fit//g' lista.txt > iraf.txt
