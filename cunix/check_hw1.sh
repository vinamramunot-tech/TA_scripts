#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="clone_err.txt"
STUDENT_DIR="student_repo"
FILE_EXISTING=0
FILE_COMPILED=0
FILE_RUN=0

# this is to check whether the student directory exists or not
if [ -d "${MAIN_DIR}" ]
then
    cd "${STUDENT_DIR}"
else
    mkdir student_repo
fi

clear

cd ${STUDENT_DIR}
cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            if [ -d "hw1" ]
            then
                cd hw1
                gcc -o helloCS232 helloCS232.c -Wall -Werror
                if [ $? != 0 ]
                then                                                                
                    (( $FILE_COMPILED = 0 ))
                    echo $FILE_COMPILED
                fi
                ./helloCS232 > "${OUTPUT}"
                if [ -s "${OUTPUT}" ] 
                then
                    (( $FILE_RUN = 1 ))
                    echo $FILE_RUN
                else
                    (( $FILE_RUN = 0 ))
                    echo $FILE_RUN
                fi
            else
                (( $FILE_EXISTING = 0 )) 
                echo $FILE_EXISTING
            fi
        else
            2> /dev/null
        fi
    done 
done