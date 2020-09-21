#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="error_files/clone_err.txt"

function createCloneError(){
    if [ -f "$CLONE_ERR" ]
    then
        rm -f "$CLONE_ERR"
        touch "$CLONE_ERR"
    else
        touch "$CLONE_ERR"
    fi
}

function loading() {
    pid=$! # Process Id of the previous running command

    spin='-\|/'

    i=0
    while kill -0 $pid 2>/dev/null
    do
    i=$(( (i+1) %4 ))
    printf "\r${spin:$i:1}"
    sleep .1
    done
}

createCloneError

cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ ! -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            echo "Cloning ${wordarray[0]}..."
            git clone ${wordarray[1]} 2> /dev/null & loading
            if [ $? == 0 ]
            then
                mv Homework_${COURSE_NAME} ${wordarray[0]}_Homework_${COURSE_NAME}
            else
                echo ${wordarray[0]} >> ${CLONE_ERR}
            fi
        fi
    done 
done