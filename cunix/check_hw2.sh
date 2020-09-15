#!/bin/bash


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
TEST_SCORE=0

cd ${STUDENT_DIR}
echo > ${HW2_RESULT}
cat "$GITHUB_USERNAME_LIST" | while read line
do
    echo $line | while read -a wordarray
    do
        (( PRIMES_FILE_EXISTING=0 ))
        (( PRIMES_FILE_COMPILED=0 ))
        (( PRIMES_FILE_RUN=0 ))
        (( TEST_SCORE=0 ))
        cp "${wordarray[0]}_Homework_${COURSE_NAME}/hw2/primes.c" ../hw2_scripts/ 2> /dev/null
        if [ $? == 0 ]
        then 
            (( PRIMES_FILE_EXISTING = 1 ))
            cd ../hw2_scripts/
            gcc -o primes primes.c -Wall -Werror -lm -std=c99 2> /dev/null
            if [ $? == 0 ]
            then
                (( PRIMES_FILE_COMPILED = 1 ))
                ./runSimpleTests.sh > "${OUTPUT}"   
                if [ $? == 0 ]
                then        
                    (( PRIMES_FILE_RUN = 1 ))     
                    while read tests
                    do
                        case $tests in
                            "Tests successfully passed for bounds 1, 1")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 1, 2")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 1, 5")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 2, 100")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 50, 51")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 50, 200")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 7, 7")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 17, 12")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 73, 127")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 160, 162")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            "Tests successfully passed for bounds 40000, 45000")
                                TEST_SCORE=$(( TEST_SCORE + 10 ))
                                ;;
                            *)
                                ;;
                        esac
                    done < "${OUTPUT}"
                fi
            fi
            rm -R -f primes.dSYM
            rm primes.c 2> /dev/null
            rm output.txt
            rm primes
            cd "../${STUDENT_DIR}"
        fi
        echo "${wordarray[0]}" >> ${HW2_RESULT}
        echo -e "\t\tprimes_file_existing\tprimes_file_compiled\tprimes_file_run\ttests_score" >> ${HW2_RESULT}
        echo -e "\t\t\t\t${PRIMES_FILE_EXISTING}\t\t\t\t\t\t\t${PRIMES_FILE_COMPILED}\t\t\t\t\t${PRIMES_FILE_RUN}\t\t\t\t${TEST_SCORE}" >> ${HW2_RESULT}

    done
done