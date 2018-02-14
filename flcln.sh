n=${1:-"."}
find $n -type f -empty -exec rm -i {} \;
ls -lR | grep '^-' | sort -k 5 -rn | awk '{print $5, $9}'