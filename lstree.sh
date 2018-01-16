#!/bin/bash
#
# lstree by Yokai Seishinkage
#
# This tool functions similarly to "ls" in that it displays files and directories but
# does so using a tree-like structure and a more aesthetic color scheme.
#
# This is free software and you are free to redistribute and/or modify it or sell it under
# the stipulations of the General Public License v2.0 (or later at your convenience). Please
# Give credit to the author if any modifications are made to this code.

help_menu() {

echo -e "    \x1b[92mUsage: fmon.sh [-hmrs] <directory/file...>

    \x1b[93mOptions:

    \x1b[95m-s \x1b[92mPrint information about a single file.
    \x1b[95m-r \x1b[92mPrint information about multiple files of recursive directories.
    \x1b[95m-m \x1b[92mPrint information about the last and current file modification.
    \x1b[95m-h \x1b[92mPrint this help info.
\x1b[0m" && exit 0
}

single() {

if [ ! -f "${1}" ]; then echo -e "\x1b[93m[\x1b[91mERROR\x1b[93m]: \x1b[93mThe \x1b[95m-s\x1b[93m argument requires a file!\x1b[0m\n" && help_menu; fi

    local file="${1}"

    echo -e "\x1b[93mFile name: \x1b[92m$(stat -c %n $file)\x1b[0m"
    echo -e "\x1b[95m
           File type: $(stat -c %F $file)
           File owner: $(stat -c %U $file)
           File size: $(stat -c %s $file) Bytes
\x1b[0m"; exit 0
}

recurse() {

if [ ! -d "${1}" ]; then echo -e "\x1b[93m[\x1b[91mERROR\x1b[93m]: \x1b[93mThe \x1b[95m-r\x1b[93m argument requires a directory!\x1b[0m\n" && help_menu; fi

for file in "${*}"/*
do

    echo -e "\x1b[93mFile name: \x1b[92m$(stat -c %n $file)\x1b[0m"
    echo -e "\x1b[95m
           File type: $(stat -c %F $file)
           File owner: $(stat -c %U $file)
           File size: $(stat -c %s $file) Bytes
\x1b[0m"

done && exit 0
}

mod_record() {

    if [ ! -f "${1}" ]; then echo -e "\x1b[93m[\x1b[91mERROR\x1b[93m]:  \x1b[93mThe \x1b[95m-m\x1b[93m requires a file!\x1b[0m\n" && help_menu; fi
    if [ ! -d "$HOME/fmon/logs/" ]; then mkdir -p $HOME/fmon/logs; fi

    if [[ ! -f $HOME/fmon/logs/${1//[^ ]*\/}_last_modded.log ]]
    then
       stat -c %y "${1}" >> $HOME/fmon/logs/${1//[^ ]*\/}_last_modded.log
    fi

    echo -e "\n\x1b[93mFile name: \x1b[92m$(stat -c %n ${1})\x1b[0m"
    echo -e "\x1b[95m\n         Last Modified: $(tail -n1 $HOME/fmon/logs/${1//[^ ]*\/}_last_modded.log)\x1b[0m\n"

}

if [ ! "${*}" ]; then help_menu; fi; while getopts "hmrs" opt; do
case "$opt" in

     m) mod_record "${2}" ;;
     s) single "${2}" ;;
     r) recurse "${2}" ;;
     h) help_menu && exit 0 ;;

esac; done
