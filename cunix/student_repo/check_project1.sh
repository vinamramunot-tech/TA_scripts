#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
OUTPUT="output.txt"
PROJ_RESULT="hw_results/project1.txt"


function createProject1ResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

createProject1ResultFile ${PROJ_RESULT}

while read line 
do
    echo $line | while read -a wordarray
    do
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw4" ]
            then
                cd hw4
                
                cd ..
            fi
            cd ..
        fi
        # echo "${wordarray[0]}" >> ${HW4_RESULT}
        # echo -e "\t\tscore: ${TEST_SCORE}" >> ${HW4_RESULT}
        # echo -e "" >> ${HW4_RESULT}
    done
done < "$GITHUB_USERNAME_LIST" 