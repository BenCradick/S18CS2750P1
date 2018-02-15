#!/usr/bin/bash
#Ben Cradick
#CS 2750
#Project 1

#prints out the data given to it as an argument and formats it in a human readable way
format_data(){
    sed "s/~/\nTitle: /" | sed "s/~/\nAuthor: /" | sed "s/~/\nPublisher: /" | sed "s/~/\nDate: /"  >> temp.txt
    column -t -s':' temp.txt | sed "s/~/\n/"
    rm temp.txt
    
}
#function to take user input to add books to the data set.
insert_book(){
    echo "Enter Book title to add:"
    read entry

    echo "Enter author of book:"
    read author
    entry="$entry~$author~"

    echo "Enter the publisher:"
    read publisher
    entry="$entry$publisher~"

    echo "Please enter year of publication:"
    read date
    entry="~$entry$date~"

    echo $entry >> books
}
#if a numerical argument is given allow user to enter that number of books
if [[ $1 =~ ^[0-9]+$ ]]; then
    let value=0
    while [ $value -lt $1 ]; do
        
        insert_book
        let value++
        done
#if argument -i is given search data in a non case sensative mode
elif [[ $1 =~ "-i" ]]; then
    grep -i $2 < books | format_data
#search data and be case sensative if -f argument is given
elif [[ $1 =~ "-f" ]]; then
    grep $2 < books | format_data

#print out all the data in the file in a human readable way
elif [[ $1 =~ "print" ]]; then
    while read line; do
            format_data
    done < books

#otherwise ask user to make new entry
else
    insert_book
fi