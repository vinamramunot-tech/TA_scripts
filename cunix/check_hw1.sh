#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
CLONE_ERR="clone_err.txt"
STUDENT_DIR="student_repo"
FILE_EXISTING=0
FILE_COMPILED=0
FILE_RUN=0

cd ${STUDENT_DIR}
cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw1" ]
            then
                (( FILE_EXISTING = 1 ))
                cd hw1
                gcc -o helloCS232 helloCS232.c -Wall -Werror 2> /dev/null
                if [ $? != 0 ]
                then                                                     
                    (( FILE_COMPILED = 0 ))
                else
                    (( FILE_COMPILED = 1 ))
                    ./helloCS232 > "${OUTPUT}"
                    if [ -s "${OUTPUT}" ] 
                    then
                        (( FILE_RUN = 1 ))        
                    else
                        (( FILE_RUN = 0 ))        
                    fi
                fi
            else
                (( FILE_EXISTING = 0 )) 
                
            fi

            echo 
            
        fi
        cd ../..
    done 
done