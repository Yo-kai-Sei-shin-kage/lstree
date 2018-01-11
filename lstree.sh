#!/bin/bash
#
# lstree by Yokai Seishinkage
#
# This tools is provided to the public in the hopes that it will be useful.
#

main() {

for f in "${*}"/*
do

    if [ -d "$f" ] ; then

       echo -e "\n┌────[Current Working Directory]Φ[$(pwd)]"
       echo -e "└──Ͼ>[Listing sub-directory]Φ[${f}]\n"
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
