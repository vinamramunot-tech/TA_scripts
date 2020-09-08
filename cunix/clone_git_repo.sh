#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="clone_err.txt"
STUDENT_DIR="student_repo"

# this is to check whether the student directory exists or not
if [ -d "${MAIN_DIR}" ]
then
    cd "${STUDENT_DIR}"
else
    mkdir student_repo
fi

clear

echo "" > "${STUDENT_DIR}/${CLONE_ERR}"


cd ${STUDENT_DIR}
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