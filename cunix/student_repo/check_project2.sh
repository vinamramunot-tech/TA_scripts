#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
PROJ_RESULT="hw_results/project2.txt"
TEST_SCRIPT="runTestCases.sh"
EXPECTED_RESULT="expected_results.txt"
PYTHON_SCRIPTS="getText.py"
RESULT_FILE="results.txt"
TEST_CASE_SCRIPT="runTestCases.sh"
COMPILE_ERROR="cannot-be-compiled"
TEST="test-cannot-be-done"
MEMORY_LEAK="memory-leak-cannot-be-tested"


function createProject2ResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

function copyProjectTestFiles(){
    cp ../../../project2/$1 . && cp ../../../project2/$2 . && cp ../../../project2/$3 .
}

function rmTestFiles(){
    rm $1 && rm $2 && rm $3 && rm $4 && rm $5 && rm $6
}

createProject2ResultFile $PROJ_RESULT

while read line 
do
    echo $line | while read -a wordarray
    do
        echo "Checking for ${wordarray[0]}...."
        COMPILE_ERROR="cannot-be-compiled"
        TEST="test-cannot-be-done"
        MEMORY_LEAK="memory-leak-cannot-be-tested"
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "project2" ]
            then
                cd project2
                copyProjectTestFiles ${TEST_SCRIPT} ${EXPECTED_RESULT} ${PYTHON_SCRIPTS}
                if [ -f "indexPage.c" ]
                then
                    gcc -o indexPage indexPage.c 1>/dev/null 2>&1
                    if [ $? == 0 ]
                    then
                        COMPILE_ERROR="compiled"
                        ./${TEST_SCRIPT}
                        ./indexPage "https://users.pfw.edu/chenz/testweb/page_000001.html" > testOutput.txt
                        ./solution "https://users.pfw.edu/chenz/testweb/page_000001.html" > testCorrectOutput.txt
                        diff -q $EXPECTED_RESULT $RESULT_FILE
                        if [ $? == 0 ]; then TEST="passed"; else TEST="not-passed" cat $RESULT_FILE > $OUTPUT; fi

                        valgrind --leak-check=yes --error-exitcode=7 ./indexPage "https://users.pfw.edu/chenz/testweb/page_000001.html" 1> $TEMP 2> $TEMP
                        if [ $? == 7 ]; then MEMORY_LEAK="yes-leaks" cat $TEMP >> $OUTPUT; else MEMORY_LEAK="no-leaks"; fi

                        rm $EXECUTABLE $RESULT_FILE $TEMP
                    else
                        COMPILE_ERROR="not-compiled"
                    fi
                fi
                rm $TEST_SCRIPT $EXPECTED_RESULT $PYTHON_SCRIPTS
                cd ..
            fi
            cd ..
        fi
        echo -n "${wordarray[0]}" >> $PROJ_RESULT
        echo -e -n "\t $COMPILE_ERROR" >> $PROJ_RESULT
        echo -e -n "\t $TEST" >> $PROJ_RESULT
        echo -e -n "\t $MEMORY_LEAK" >> $PROJ_RESULT((  ))
        echo "" >> $PROJ_RESULT
    done
done < "$GITHUB_USERNAME_LIST" 