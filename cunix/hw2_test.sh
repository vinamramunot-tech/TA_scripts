#!/bin/bash


TEST_SCRIPT="runSimpleTests.sh"
OUTPUT_CHECK="primesCheckOutput"
GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
OUTPUT="output.txt"
STUDENT_DIR="student_repo"
HW2_RESULT="hw2_result.txt"
EXPECTED_OUTPUT="expectedOutput.txt"
HOMEWORK_FOLDER_EXISTING=0
PRIMES_FILE_EXISTING=0
PRIMES_FILE_COMPILED=0
PRIMES_FILE_RUN=0
TEST_PASSED=0

cd ${STUDENT_DIR}
echo > ${HW2_RESULT}
cat "$GITHUB_USERNAME_LIST" | while read line
do
    echo $line | while read -a wordarray
    do
        cp "${wordarray[0]}_Homework_${COURSE_NAME}/hw2/primes.c" ../hw2_scripts/ 2> /dev/null
        if [ $? == 0 ]
        then 
            (( PRIMES_FILE_EXISTING = 0 ))
            gcc -o ../hw2_scripts/primes ../hw2_scripts/primes.c -Wall -Werror -lm -std=c99 2> /dev/null
            
            


            rm ../hw2_scripts/primes.c
        fi
    done 
done