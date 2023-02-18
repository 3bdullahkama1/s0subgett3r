#!/bin/bash

if [ $# -ne 2 ]; then
    ## view tool help
    echo "--------------------------------"
    echo "Usage:- ./subl1st domain wordlist"
    echo "--------------------------------"
    exit
fi

domain=$1
wordlist=$2

if [ -f $wordlist ]; then
    ## ------
    for sub in $(cat $wordlist); do
        if [[ $(ping -c 1 $sub.$domain 2>/dev/null) ]]; then
            echo "$(host -t a $sub.$domain | grep address | cut -d ' ' -f 1,4)"
        fi
    done
    ## ------
else
    # if file not exists
    echo "xxx error :( $wordlist not exists !!! ): xxx"
    exit
fi
