#!/bin/sh

D=/srv/apps/motion/data

for F in `ls $D/*.jpg $D/*.swf 2>/dev/null`; do
	DATE=`basename $F |cut -d- -f2 |cut -c1-8`
	HOUR=`basename $F |cut -d- -f2 |cut -c9-10`
	mkdir -p $D/$DATE/$HOUR
	mv $F $D/$DATE/$HOUR
done

