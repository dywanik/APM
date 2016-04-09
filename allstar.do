#	Wojtek Pych OAUW, 1994.10.17
#	Photometry with DAOphotII and AllstarII
#	Rememeber about files:
#		daophot.opt
#		photo.opt
#		allstar.opt
#	Usage: allstarvf.do frame fwhm
#
#	NOTE: this script sets threshold (edit this)
#	NOTE: watch progress is set to -1
#
#	version for 1 single fts !!!!! (fi 1,1)
#
\rm $1.psf
\rm $1.als
\rm $1.ap
\rm $1.lst
\rm $1.nei
\rm $1.out
\rm $1.coo
/home/dywan/MN_Dra/Borowiec/15-06-29/daophot5120 << KONIEC-1
at $1.fits
op

fw=$2
wa=-2.0
th=7.0

fi
1,1

y
ph




pi

9

psf



psf






psf






psf







exit
KONIEC-1
#
/home/dywan/MN_Dra/Borowiec/15-06-29/allstar5120 << KONIEC-2

$1



END OF FILE
KONIEC-2
#
/home/dywan/MN_Dra/Borowiec/15-06-29/daophot5120 << KONIEC-3
so
4
$1.als
.out
y
exit
KONIEC-3
