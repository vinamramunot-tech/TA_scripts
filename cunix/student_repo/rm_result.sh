#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"

cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw3" ]
            then
                cd hw3
                rm 3x3.txt 2> /dev/null
                rm 4x4.txt 2> /dev/null
                rm fifteen 2> /dev/null
                rm log_3.txt 2> /dev/null
                rm -R -f primes.dSYM 2> /dev/null
                rm log_4.txt 2> /dev/null
                cd ..
            fi
            cd ..
        fi
    done 
done