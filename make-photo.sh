# Make input files list for IRAF - works ONLY for files called "ccd*.fts"
# R. Pospieszynski
# pospieszynski@gmail.com
#
# MMXV
#-------------------------------------------------------
rm lista.txt
rm lista2.txt
rm iraf.txt
rm allstar.do
rm all.do
ls *.fits > lista.txt
sed 's/fits/imh/g' lista.txt > lista2.txt
sed 's/.fits//g' lista.txt > iraf.txt
sed 's/.fits//g' lista.txt > temp1
#---------------------------
# INSERT name on the frames
#---------------------------
grep "MN_Dra" temp1 > temp2
sed 's/^/.\/allstar.do /' temp2 > all.do
#-----------here---- insert FWHM in the next line--------------------
sed -i 's/$/ 5.5/' all.do
#--------------------------------------------------------------------
rm temp*
sed "s@PATH_TO_LOCATION@$(pwd)@" allstar.do_clean > allstar.do
chmod 774 all*
chmod 774 daophot5120
chmod 774 prepare_final.sh
#TUTAJ DOROBIC REDUKCJE W IRAF (skrypt.do, analogiczny do ICH)
echo "Photometry..."
./all.do > /dev/null
mkdir out
cp *.out out
cd out
ls *.out > lista3.txt
grep '     1 ' *.out >  dane_temp
awk '{print $3 " " $4}' dane_temp > dane.txt
grep '     1 ' *.out >  dane1.txt
grep '     2 ' *.out >  dane2.txt
grep '     3 ' *.out >  dane3.txt
rm dane_temp

mv prog3New out/

#./prepare_final.sh
echo DONE!
