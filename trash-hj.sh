#/bin/bash
# Cuts trash and creates hj.txt
grep DATE hjj > hj.txt
sed -i 's/.fits,DATE-OBS =//' hj.txt
#rm hjj
grep EXPOSURE exposure > exp.txt
#rm exposure
grep 245 wynik > times.txt
paste times.txt exp.txt | awk '{print $1, $11}' > czasy.txt
