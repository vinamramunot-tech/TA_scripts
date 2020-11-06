#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
EXTRA_CREDIT_RESULT="hw_results/extra_credit_result.txt"
FOLDER_EXISTING=0


function createExtraCreditResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createExtraCreditResultFile $EXTRA_CREDIT_RESULT

while read line 
do
    echo $line | while read -a wordarray
    do
        (( FOLDER_EXISTING=0 ))
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "extra_credit" ]
            then
                cd ..
                echo "${wordarray[0]}" >> ${EXTRA_CREDIT_RESULT}
            else 
                cd ..
            fi
        fi
    done
done < $GITHUB_USERNAME_LIST