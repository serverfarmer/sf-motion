#!/bin/sh

s3cmd -e put $1 s3://tklim.motion

# mutt -a $1 -s "[`hostname`] Photo: `basename $1`" -- kamera@tomaszklim.pl </dev/null
