#!/usr/bin/bash

n=${1:-20}
i=0

while [ $i -le $n ]; do
    if ! (($i%3)) && ! (($i % 5));
     then echo "fizz_buzz";
    
    elif ! (($i%3));
     then echo "_fizz";
    
    elif ! (($i%5));
     then echo "buzz";
    
    else
        echo $i
    fi
let i+=1

done
