#!/bin/bash

export directory as pwd
touch prodigy_out.out
for FILE in *.pdb; do
    touch prodigy_out.out
    echo ${FILE} | tee -a prodigy_out.out
    prodigy ${FILE} --selection A B | tee -a prodigy_out.out
done
input="prodigy_out.out"
#While loop to read line by line
touch prodigy_out_summary.out
while IFS= read -r line; do
    #If the line starts with ST then set var to yes.
    if [[ $line == '[++]'* ]] ; then
        printline="yes"
    fi
    if [[ $line == *.pdb ]] ; then
        printline="yes"
    fi
    # If variable is yes, print the line.
    if [[ $printline == "yes" ]] ; then
        echo "$line" | tee -a prodigy_out_summary.out
    fi
    #If the line starts with ST then set var to no.
    if [[ $line == '[+]'* ]] ; then
        printline="no"
    fi
done < "$input"
