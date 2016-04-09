#grep "HELJD" hj_temp > hj_temp2
#sed 's/.fits,HELJD =//g' hj_temp2 > out/hj.txt
sed -i 's/.00000000000000//g' czasy.txt
mv czasycorr.txt out/hjd.txt
paste out/hjd.txt out/V1.txt out/C1.txt out/C2.txt | awk '{print $2, $1, $6, $7, $12, $13, $18, $19}' > out/all.txt
awk '{print $2 " " $3-($5+$7)/2 " "}' out/all.txt > out/out.dat
sed -i 's/245//g' out/out.dat

