#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="clone_err.txt"

function createCloneError(){
    if [ -f "$CLONE_ERR" ]
    then
        rm -f "$CLONE_ERR"
        touch "$CLONE_ERR"
    else
        touch "$CLONE_ERR"
    fi
}

createCloneError

cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ ! -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            git clone ${wordarray[1]} 2> /dev/null
            if [ $? == 0 ]
            then
                mv Homework_${COURSE_NAME} ${wordarray[0]}_Homework_${COURSE_NAME}
            else
                echo ${wordarray[0]} >> ${CLONE_ERR}
            fi
        fi
        sleep 1
    done 
done