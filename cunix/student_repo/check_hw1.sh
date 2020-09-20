#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
OUTPUT="output.txt"
CLONE_ERR="clone_err.txt"
STUDENT_DIR="student_repo"
FILE_EXISTING=0
FILE_COMPILED=0
FILE_RUN=0
HW1_RESULT="hw1_result.txt"

cd ${STUDENT_DIR}
echo > ${HW1_RESULT}
cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        (( FILE_EXISTING = 0 ))
        (( FILE_COMPILED = 0 ))
        (( FILE_RUN = 0 ))
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
                        rm ${OUTPUT}
                    else
                        (( FILE_RUN = 0 ))        
                    fi
                fi
                rm helloCS232
                cd ../..
            else
                (( FILE_EXISTING = 0 ))     
                cd ..        
            fi
        fi
        
        echo "${wordarray[0]}" >> ${HW1_RESULT}
        echo -e "\t\tfile_existing\tfile_compiled\tfile_run" >> ${HW1_RESULT}
        echo -e "\t\t\t  ${FILE_EXISTING} \t\t\t\t${FILE_COMPILED}\t\t\t${FILE_RUN}" >> ${HW1_RESULT}
    done 
done