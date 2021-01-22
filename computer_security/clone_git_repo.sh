#!/bin/bash

GITHUB_USERNAME_LIST="students.txt"
COURSE_NAME="CS445"
CLONE_ERR="clone_err.txt"

function createCloneError(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createCloneError ${CLONE_ERR}

while read line 
do
    echo $line | while read -a wordarray
    do
        if [ ! -d "student_repo/${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            echo "Cloning ${wordarray[0]}..."
            git clone ${wordarray[1]} --quiet
            if [ $? == 0 ]
            then
                mv "${wordarray[2]}" "student_repo/${wordarray[0]}_Homework_${COURSE_NAME}"
            else
                echo ${wordarray[0]} >> ${CLONE_ERR}
            fi
            sleep 1s
        fi
    done 
done < "$GITHUB_USERNAME_LIST"