#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="clone_err.txt"
STUDENT_DIR="student_repo"
PULL_ERR="pull_err.txt"


# this is to check whether the student directory exists or not
if [ -d "${MAIN_DIR}" ]
then
    cd "${STUDENT_DIR}"
else
    mkdir student_repo
fi

# clean error file
echo "" > "${STUDENT_DIR}/${PULL_ERR}"

clear

cd ${STUDENT_DIR}
cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            git config --local credential.helper store
            git pull 1> /dev/null 2> /dev/null
            cd ..
        else
            echo "${wordarray[0]}_Homework_${COURSE_NAME}" >> ${PULL_ERR}
        fi
    done 
done
