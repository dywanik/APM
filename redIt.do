# darks only reduction
rfits("@lista.txt","","@iraf.txt", make_image=yes, long_header=no, 
short_header=yes,datatype="ushort", blank=0.,scale=yes, oldirafname=no, 
offset=0)
#
hedit (images="M*.imh", fields="IMAGETYP", value="object")
hedit (images="D*.imh", fields="IMAGETYP", value="dark")
#
ccdproc ("@lista2.txt",
ccdtype="dark", max_cache=4, noproc=no, fixpix=no, overscan=no, trim=yes,
zerocor=no, darkcor=no, flatcor=no, illumcor=no, fringecor=no, readcor=no,
scancor=no, readaxis="line", fixfile="", biassec="",
trimsec="[500:900,280:800]", dark="", illum="",
fringe="", minreplace=1., scantype="shortscan", nscan=20, interactive=no,
function="chebyshev", order=1, sample="*", naverage=1, niterate=1,
low_reject=3., high_reject=3., grow=0.)
darkcombine ("@lista2.txt",
output="Dark", combine="average", reject="avsigclip", ccdtype="dark",
process=no, delete=no, clobber=no, scale="exposure", statsec="", nlow=1,
nhigh=1, mclip=yes, lsigma=3., hsigma=3., rdnoise="15", gain="2.5",
pclip=-0.5)
#
ccdproc ("@lista2.txt",
ccdtype="object", max_cache=8, noproc=no, fixpix=no, overscan=no, trim=yes,
zerocor=no, darkcor=yes, flatcor=no, illumcor=no, fringecor=no, readcor=no,
scancor=no, readaxis="line", fixfile="", biassec="",
trimsec="[500:900,280:800]", dark="Dark.imh",
illum="", fringe="", minreplace=1., scantype="shortscan",
nscan=20, interactive=no, function="chebyshev", order=1, sample="*",
naverage=1, niterate=1, low_reject=3., high_reject=3., grow=0.)
#
wfits ("Dark.imh","Dark.fits")
wfits ("@lista2.txt","@iraf.txt")
