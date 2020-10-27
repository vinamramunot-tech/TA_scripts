#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
PROJ_RESULT="hw_results/project1.txt"
TEST_SCRIPT="runTestCases.sh"
EXPECTED_RESULT="expected_results.txt"
PYTHON_SCRIPTS="getLinks.py"
RESULT_FILE="results.txt"


function createProject1ResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

function copyProjectTestFiles(){
    cp ../../../project1/$1 . cp ../../../project1/$2 . cp ../../../project1/$3 .
}

function rmTestFiles(){
    rm $1 rm $2 rm $3
}

createProject1ResultFile ${PROJ_RESULT}

# while read line 
# do
#     echo $line | while read -a wordarray
#     do
        # if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        if [ -d "Adam_DeWitt_Homework_CS232" ]
        then
            # cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            cd "Adam_DeWitt_Homework_CS232"
            if [ -d "project1" ]
            then
                cd project1
                copyProjectTestFiles ${TEST_SCRIPT} ${EXPECTED_RESULT} ${PYTHON_SCRIPTS}
                if [ -f "crawler.c" ]
                then
                    ./${TEST_SCRIPT}
                    %(${EXPECTED_RESULT}=${RESULT_FILE}?echo "1":echo "0")
                fi
                rm ${TEST_SCRIPT} ${EXPECTED_RESULT} ${PYTHON_SCRIPTS}
                cd ..
            fi
            cd ..
        fi
        # echo "${wordarray[0]}" >> ${PROJ_RESULT}
        echo "Adam_DeWitt_Homework_CS232" >> ${PROJ_RESULT}
        # echo -e "\t\tscore: ${TEST_SCORE}" >> ${HW4_RESULT}
        # echo -e "" >> ${HW4_RESULT}
#     done
# done < "$GITHUB_USERNAME_LIST" 