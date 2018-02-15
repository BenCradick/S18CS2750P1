#!/usr/bin/bash
#Ben Cradick
#CS 2750
#Project 1

#n is value of argument 1 but 20 by default
n=${1:-20}
i=0
#while i is less than n
while [ $i -le $n ]; do
    #if i mod 3 and i mod 5 equal 0 then write fizz_buzz
    if ! (($i%3)) && ! (($i % 5));
     then echo "fizz_buzz";
    #else if i mod 3  is 0 write _fizz
    elif ! (($i%3));
     then echo "_fizz";
    #else if i mod 5 is 0 write buzz
    elif ! (($i%5));
     then echo "buzz";
    #otherwise just print the value of i
    else
        echo $i
    fi
#increment i    
let i+=1

done
