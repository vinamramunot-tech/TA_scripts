#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
STUDENT_DIR="student_repo"

cd ${STUDENT_DIR}
cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw2" ]
            then
                cd hw2
                rm hw2_result.txt 2> /dev/null
                rm expectedOutput.txt 2> /dev/null
                rm primesCheckOutput 2> /dev/null
                rm runSimpleTests.sh 2> /dev/null
                rm -R -f primes.dSYM 2> /dev/null
                rm primes 2> /dev/null
                cd ../../
            fi
            cd ..
        fi
    done 
done