#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
PROJ_RESULT="hw_results/project1.txt"
TEST_SCRIPT="runTestCases.sh"
EXPECTED_RESULT="expected_results.txt"
PYTHON_SCRIPTS="getLinks.py"
RESULT_FILE="results.txt"
OUTPUT="output.txt"
TEMP="temp.txt"
EXECUTABLE="crawler"
TEST=""
MEMORY_LEAK=""


function createProject1ResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

function copyProjectTestFiles(){
    cp ../../../project1/$1 . && cp ../../../project1/$2 . && cp ../../../project1/$3 .
}

function rmTestFiles(){
    rm $1 && rm $2 && rm $3 && rm $4 && rm $5 && rm $6
}

createProject1ResultFile $PROJ_RESULT

while read line 
do
    echo $line | while read -a wordarray
    do
        TEST=""
        MEMORY_LEAK=""
        MEMORY_BUFFER=""
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "project1" ]
            then
                cd project1
                copyProjectTestFiles ${TEST_SCRIPT} ${EXPECTED_RESULT} ${PYTHON_SCRIPTS}
                if [ -f "crawler.c" ]
                then
                    ./${TEST_SCRIPT}
                    diff -q $EXPECTED_RESULT $RESULT_FILE
                    if [ $? == 0 ]
                    then
                        TEST="passed"
                    else
                        TEST="not-passed"
                        cat $RESULT_FILE > $OUTPUT
                    fi

                    valgrind --leak-check=yes --error-exitcode=7 ./crawler "https://users.pfw.edu/chenz/testweb/page_000001.html" 10 899 1> $TEMP 2> $TEMP
                    if [ $? == 7 ]
                    then
                        MEMORY_LEAK="yes-leaks"
                        cat $TEMP >> $OUTPUT
                    else
                        MEMORY_LEAK="no-leaks"
                    fi
                fi
                rm $TEST_SCRIPT $EXPECTED_RESULT $PYTHON_SCRIPTS $EXECUTABLE $RESULT_FILE $TEMP
                cd ..
            fi
            cd ..
        fi
        echo -n "${wordarray[0]}" >> $PROJ_RESULT
        echo -e -n "\t $TEST" >> $PROJ_RESULT
        echo -e -n "\t $MEMORY_LEAK" >> $PROJ_RESULT
        echo "" >> $PROJ_RESULT
    done
done < "$GITHUB_USERNAME_LIST" 