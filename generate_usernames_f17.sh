#!/bin/bash
# 2023.06.06 @nyxgeek
# quick and dirty username generation from census data
#
# this will use approx 10GB of space and might take hours. HOURS. I tried to add output along the way.
# Good luck.

echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "******************************************************************************************"
echo " HEY! THIS IS GOING TO TAKE A LONG LONG TIME, AND WILL TAKE UP LIKE 10GB of DISK SPACE!!! "
echo "******************************************************************************************"
echo ""
echo "(you still have time to CTRL-C for about 10 seconds)"
if [[ -z $1 ||  -z $2 ]]; then
	echo "You need to specify the first and last name files"
    exit
fi

sleep 10
echo "Starting username generation..."

FIRSTNAMES=$1
LASTNAMES=$2

CURRENTDIR=`pwd`

#generate john.smith variations
echo "Generating john.smith variations. This is gonna take FOREVER. Limiting total to 10m lines per variation."

## VARIATION 1: 500 first names, 20k last names

TMPPATH="USERNAMES/tron_john.smith_500x20k" 
mkdir ${TMPPATH} 2>/dev/null

TMPFIRSTNAME="/tmp/first.tmp"
TMPLASTNAME="/tmp/last.tmp"

cat "$1" | head -n 500 > ${TMPFIRSTNAME}
cat "$2" | head -n 20000 > ${TMPLASTNAME}

time while read FIRSTNAME; do while read LASTNAME; do echo "${FIRSTNAME}.${LASTNAME}" >> ${TMPPATH}/full.txt; done< ${TMPLASTNAME}; done <  ${TMPFIRSTNAME}
cd ${TMPPATH}
split -l 175000 full.txt
rm full.txt
cd ${CURRENTDIR}

echo "Done!"
