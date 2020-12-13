#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
PULL_ERR="error_folder/pull_err.txt"

function createPullError(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createPullError $PULL_ERR

while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            echo "pulling to ${wordarray[0]}"
            git config --local credential.helper store
            git pull --force -q origin master
            cd ..
        else
            echo "${wordarray[0]}_Homework_${COURSE_NAME}" >> ${PULL_ERR}
        fi
    done
done < "$GITHUB_USERNAME_LIST"








