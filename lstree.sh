#!/bin/bash
#
# lstree by Yokai Seishinkage
#
# This tools is provided to the public in the hopes that it will be useful.
#

## COLORS ##
blk=$'\x1b[90m'
red=$'\x1b[91m'
grn=$'\x1b[92m'
ylw=$'\x1b[93m'
blu=$'\x1b[94m'
pur=$'\x1b[95m'
cyn=$'\x1b[96m'
wht=$'\x1b[97m'
rst=$'\x1b[0m'

main() {

for f in "${*}"/*
do

    if [ -d "$f" ] ; then

       echo -e "\n${ylw}┌────[Current Working Directory]${grn}Φ${ylw}[${red}$(pwd)${ylw}]${rst}"
       echo -e "${ylw}└──Ͼ>[Listing sub-directory]${red}Φ${ylw}[${grn}${f}${ylw}]${rst}\n"
       main "$f"

    elif [ -f "$f" ]; then

         echo -e "${pur}${f/${*}/      }${rst}" | tr -d '/'

    fi

done

}

if [ ! "${*}" ]; then

   main "$(pwd)"

else

   main "${*}"

fi
