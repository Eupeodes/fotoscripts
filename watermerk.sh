#!/bin/sh
# watermerk.sh
#watermerkjes plaatsen

#standaardinstellingen
name="© Marten Tacoma"
size="2048x2048"
cc="";

basepath=${PWD##*/}

#lees parameters in
until [ -z "$1" ]  # Until all parameters used up . . .
do
   case "$1" in
	-n) name="$2";shift;;
	-s) size="$2";shift;;
	-cc) cc="cc";;
	-h) echo "usage: $0 [-b] [-t] [-n name] [-f files] [-o outputfolder] [-s size]
    -b        Draw border
    -t	      Create thumbnails
    -n string Use copyrightstring instead of '$name'
    -s size   Width x height of output images"
	return 0;  
    esac
  shift
done

#copyright plaatsen
echo $(date +"%T") - Copyright plaatsen...
if [ "$name" = "© Marten Tacoma" ]
then
	if [ "$cc" = "cc" ] 
	then
		watermerk=$basepath/cc_watermark_$size.png
        else
		watermerk=$basepath/watermark_$size.png
	fi
	echo $watermerk
	for IMG in *
	do
	        composite -quality 90 -dissolve 50 -gravity southeast $watermerk $IMG $IMG
	done
else
	mogrify -quality 100 -pointsize 65 -draw "gravity southeast fill black text 0,5 '$name' fill white text 5,0 '$name'" *
fi
