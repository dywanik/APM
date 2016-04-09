   #!/bin/bash

   FIN=$(cat tmp/fits-list.dat | wc -l)
   echo $FIN
        for i in `seq 1 $FIN`;
        do
                echo $i
        done  