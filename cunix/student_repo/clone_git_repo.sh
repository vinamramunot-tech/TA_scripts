#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="error_folder/clone_err.txt"

function createCloneError(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createCloneError ${CLONE_ERR}

while read line 
do
    echo $line | while read -a wordarray
    do
        if [ ! -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            echo "Cloning ${wordarray[0]}..."
            git clone ${wordarray[1]} --quiet
            if [ $? == 0 ]
            then
                mv "Homework_${COURSE_NAME}" "${wordarray[0]}_Homework_${COURSE_NAME}"
            else
                echo ${wordarray[0]} >> ${CLONE_ERR}
            fi
        fi
    done 
done < "$GITHUB_USERNAME_LIST"