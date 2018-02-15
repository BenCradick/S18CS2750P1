#Ben Cradick
#CS 2750
#Project 1

#accept command line argument, set n equal to it, otherwise default value n is the current directory (".")
n=${1:-"."}
#find empty (-empty) files (-type f) in directory ($n) then execute command (-exec) remove (rm) using output of find and
#ask if you're sure you want to delete the found files (-i)
find $n -type f -empty -exec rm -i {} \;
#list all files in the directory with their size, search for files beggining with - and then sort them by their size in bytes
#then print the name of the file and the size of the file
ls -lR | grep '^-' | sort -k 5 -rn | awk '{print $5, $9}'