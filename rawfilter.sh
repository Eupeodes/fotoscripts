#!/bin/sh
# rawfilter.sh
#functie op afbeeldingen uit te zoeken
 
#standaardinstellingen
dir="raw"
mkdir $dir
for IMG in *.CR2
do
        JPEG=${IMG/.CR2/.JPG}
        if [ -f $JPEG ]
        then
                mv $IMG $dir/$IMG
        else
                JPEG=${IMG/.CR2/.jpg}
                if [ -f $JPEG ]
                then
                        mv $IMG $dir/$IMG
                else
                        rm $IMG
                fi
        fi
done
echo "Klaar"
