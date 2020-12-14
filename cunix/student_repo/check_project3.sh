#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"

function copyFiles(){
    cp ../../../project3/$1 . && cp ../../../project3/$2 . && cp ../../../project3/$3 . && cp ../../../project3/$4 . && cp -R ../../../project3/$5 .
}


while read line 
do
    echo $line | while read -a wordarray
    do
        echo "Checking for ${wordarray[0]}...."
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "project3" ]
            then
                cd project3
                copyFiles "getLinks.py" "getText.py" "test_all.sh" "test_valgrind.sh" "webSearchSol"
                cd ..
            fi
            cd ..
        fi
    done
done < "$GITHUB_USERNAME_LIST" 