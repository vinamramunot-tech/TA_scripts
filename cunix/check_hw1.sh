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
        if [ ! -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            if [ -d "hw1" ]
            then
                cd hw1
                gcc -o helloCS232 helloCS232.c -Wall -Werror
                if [ $? != 0 ]
                then                                                                
                    echo -e "compilation not successfull!"
                    continue
                fi
                ./helloCS232 > "${OUTPUT}"
                if [ -s "${OUTPUT}" ] 
                then
                    echo -e "1. Install mingw-w64 for Windows, VS Code, and Git – 20pt\n2. Create a Github account and invite both TA and instructor to your Github “Homework_CS232” repository – 20pt\n3. Push the code to Github under hw1 directory using Git – 20pt\n4. Program “helloCS232.c” can be compiled – 20pt\n5. Program “helloCS232.c” can run correctly and print “Hello CS232!” – 20pt" > hw1_result.txt
                else
                    echo -e "1. Install mingw-w64 for Windows, VS Code, and Git – 20pt\n2. Create a Github account and invite both TA and instructor to your Github “Homework_CS232” repository – 20pt\n3. Push the code to Github under hw1 directory using Git – 20pt\n4. Program “helloCS232.c” can be compiled – 20pt\n5. Program “helloCS232.c” can run correctly and print “Hello CS232!” – 0pt" > hw1_result.txt
                fi
            else
                echo -e "hw1 doesn't exist!" > hw1_result.txt
            fi
        fi
    done 
done