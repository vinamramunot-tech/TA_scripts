#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
STUDENT_DIR="student_repo"
HW1_RESULT="hw1_result.txt"

cd ${STUDENT_DIR}
cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw1" ]
            then
                cd hw1
                rm hw1_result.txt           
            fi
        fi
        cd ../..
    done 
done