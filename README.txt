## lstree ##
A simple ls-like tool to recursively display directories and sub-directories and their contents.
It can show file and directory access permissions, modes, and ownership just like `ls` only
in a nice colorful manner.

## INSTALLATION ##

1.) git clone https://github.com/yo-kai-sei-shin-kage/lstree.git
2.) cd lstree
3.) chmod u+x lstree
4.) mv lstree /usr/bin/lstree

## USAGE ##

$ lstree [-fFdDhU] <directory/file...>

    Options:

    -f Print information about a single file.
    -F Print information about multiple files.
    -d Print information about all files in a single directory.
    -D Print information about all files in all sub-directories of the given directory.
    -U Update lstree.
    -h Print this help info.

## Future Add-ons ##

Suggestions welcome.

## DISCLAIMER ##

This tool is released to the public in the hopes that it will be useful. I am
not responsible for anything that you do with this tool or anything that happens
while using this tool. It is a basic bash shell script. Not much else to it.

## NOTES ##

Play with the code and see what you can do with it. Fork if you wish to add
your own features.
