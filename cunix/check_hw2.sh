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
        (( HOMEWORK_FOLDER_EXISTING=0 ))
        (( PRIMES_FILE_EXISTING=0 ))
        (( PRIMES_FILE_COMPILED=0 ))
        (( PRIMES_FILE_RUN=0 ))
        (( TEST_PASSED=0 ))
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw2" ]
            then
                (( HOMEWORK_FOLDER_EXISTING=1 ))
                cd hw2
                # cp "../../../hw2_scripts/${OUTPUT_CHECK}" "../../../hw2_scripts/${TEST_SCRIPT}" "../../../hw2_scripts/${EXPECTED_OUTPUT}" .
                
                if [ -f primes.c ]
                then
                    cp primes.c ../../../hw2_scripts/
                    (( PRIMES_FILE_EXISTING=1 ))
                    gcc -o primes primes.c -Wall -Werror -lm -std=c99 2> /dev/null
                    if [ $? != 0 ]
                    then                                                     
                        (( PRIMES_FILE_COMPILED=0 ))
                    else
                        (( PRIMES_FILE_COMPILED=1 ))
                        ./${TEST_SCRIPT} > ${OUTPUT} 2> /dev/null
                        if [ $? == 0 ]
                        then
                            if [ -s "${OUTPUT}" ] 
                            then
                                (( PRIMES_FILE_RUN=1 ))
                                DIFF=$(diff "$OUTPUT" "$EXPECTED_OUTPUT" 2> /dev/null 1> /dev/null)
                                if [ "$DIFF" == "" ]
                                then
                                    (( TEST_PASSED=1 ))
                                else
                                    (( TEST_PASSED=0 ))
                                fi
                            else
                                (( PRIMES_FILE_RUN=0 ))        
                            fi
                        fi
                        
                    fi
                    rm primes 2> /dev/null
                    rm -R -f primes.dSYM 2> /dev/null
                    rm ${OUTPUT_CHECK} 2> /dev/null
                    rm ${TEST_SCRIPT} 2> /dev/null
                    rm ${EXPECTED_OUTPUT} 2> /dev/null
                    rm ${OUTPUT} 2> /dev/null     
                fi
                cd ../..
            else
                (( HOMEWORK_FOLDER_EXISTING=0 ))   
                cd ..          
            fi
        fi
        echo "${wordarray[0]}" >> ${HW2_RESULT}
        echo -e "\t\tprimes_file_existing\tprimes_file_compiled\tprimes_file_run\ttests_passed" >> ${HW2_RESULT}
        echo -e "\t\t\t\t${PRIMES_FILE_EXISTING}\t\t\t\t\t\t\t${PRIMES_FILE_COMPILED}\t\t\t\t\t${PRIMES_FILE_RUN}\t\t\t\t${TEST_PASSED}" >> ${HW2_RESULT}
    done 
done