#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
OUTPUT="output.txt"
MAIN_DIR="/Users/vinamramunot/OneDrive - Purdue University Fort Wayne/Fall2020/CS232-Unix/TA_scripts/cunix/student_repo"

cd "${MAIN_DIR}"

while read line 
do
    for username in $line
    do
        cd ${username}_Homework_CS232
        if [ $? != 0 ]
        then
            continue
        else
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
        cd "${MAIN_DIR}"
    done
done < "$GITHUB_USERNAME_LIST"

