#!/bin/bash

GITHUB_USERNAME_LIST="students.txt"
COURSE_NAME="CS445"
PULL_ERR="pull_err.txt"

function createPullError(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createPullError $PULL_ERR

while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "student_repo/${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "student_repo/${wordarray[0]}_Homework_${COURSE_NAME}"
            echo "pulling to ${wordarray[0]}"
            git pull --force -q
            if [ $? != 0 ] 
            then
                echo "../../${wordarray[0]}_Homework_${COURSE_NAME}" >> ${PULL_ERR}
            fi 
            cd ../..
        else
            echo "${wordarray[0]}_Homework_${COURSE_NAME}" >> ${PULL_ERR}
        fi
    done
done < "$GITHUB_USERNAME_LIST"








