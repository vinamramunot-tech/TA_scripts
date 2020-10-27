#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
OUTPUT="output.txt"
CLONE_ERR="clone_err.txt"
STUDENT_DIR="student_repo"
FILE_EXISTING=0
FILE_COMPILED=0
FILE_RUN=0
HW1_RESULT="hw_results/hw1_result.txt"

function createHw1ResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createHw1ResultFile $HW1_RESULT

while read line 
do
    echo $line | while read -a wordarray
    do
        (( FILE_EXISTING = 0 ))
        (( FILE_COMPILED = 0 ))
        (( FILE_RUN = 0 ))
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            
        fi
        
        echo "${wordarray[0]}" >> ${HW1_RESULT}
        echo -e "\t\tfile_existing\tfile_compiled\tfile_run" >> ${HW1_RESULT}
        echo -e "\t\t\t  ${FILE_EXISTING} \t\t\t\t${FILE_COMPILED}\t\t\t${FILE_RUN}" >> ${HW1_RESULT}
    done 
done < "$GITHUB_USERNAME_LIST"