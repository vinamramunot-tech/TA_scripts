#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="clone_err.txt"
MAIN_DIR="/Users/vinamramunot/OneDrive - Purdue University Fort Wayne/Fall2020/CS232-Unix/TA_scripts/cunix/student_repo"

cd "${MAIN_DIR}"

while read line; do
    for username in $line; do
        if [ ! -d "${username}_Homework_${COURSE_NAME}" ]
        then
            git clone https://github.com/${username}/Homework_${COURSE_NAME}.git 2> /dev/null
            if [ $? == 0 ]
            then
                mv Homework_${COURSE_NAME} ${username}_Homework_${COURSE_NAME}
            else
                echo ${username} >> ${CLONE_ERR}
            fi
        fi
    done
done < "$GITHUB_USERNAME_LIST"