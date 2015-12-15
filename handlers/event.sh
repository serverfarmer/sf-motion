#!/bin/sh

msg="DETECTED MOTION EVENT, CAMERA $1"

logger -t motion "$msg"

# echo "$msg" |mail -s "$msg" kontakt@tomaszklim.pl tomasz.klim@klimbs.pl
