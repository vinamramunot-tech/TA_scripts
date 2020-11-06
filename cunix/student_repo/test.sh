#!/bin/bash










#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
EXTRA_CREDIT_RESULT="hw_results/extra_credit_result.txt"
SCORE=0
BOARD_THREE_TRIAL=0
BOARD_FOUR_TRIAL=0

function createExtraCreditResultFile(){
    if [ -f $1 ]; then rm -f $1 touch $1; else touch $1; fi
}

function copyExpectedResult(){
    cp ../../../hw3_solution_scripts/log_4.txt .
    cp ../../../hw3_solution_scripts/log_3.txt .
    cp ../../../hw3_solution_scripts/3x3.txt .
    cp ../../../hw3_solution_scripts/4x4.txt .
}

function run3by3(){
    ./fifteen 3 < 3x3.txt > /dev/null 
}

function run4by4(){
    ./fifteen 4 < 4x4.txt > /dev/null
}

createExtraCreditResultFile $EXTRA_CREDIT_RESULT

while read line 
do
    echo $line | while read -a wordarray
    do
        (( BOARD_FOUR_TRIAL=0 ))
        (( BOARD_THREE_TRIAL=0 ))
        (( SCORE=0 ))
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "extra_credit" ]
            then
                cd "extra_credit"
                if [ -f "fifteen.c" ]
                then
                    echo -n "${wordarray[0]}" >> ../../hw_results/${EXTRA_CREDIT_RESULT}
                    gcc -o fifteen fifteen.c -lm
                    copyExpectedResult
                    run3by3
                    diff log.txt log_3.txt
                    if [ $? == 0 ]; then (( BOARD_THREE_TRIAL = 1 )); fi

                    run4by4
                    diff log.txt log_4.txt
                    if [ $? == 0 ]; then (( BOARD_FOUR_TRIAL = 1 )); fi

                    if [ $BOARD_THREE_TRIAL -eq 1 ] && [ $BOARD_FOUR_TRIAL -eq 1 ]
                    then
                        valgrind --leak-check=yes --error-exitcode=7 ./fifteen 3 < 3x3.txt > /dev/null
                        if [ $? == 7 ] 
                        then
                            ((SCORE+=0))
                        else
                            ((SCORE+=1))
                            echo -e -n "\t$SCORE" >> ../../hw_results/${EXTRA_CREDIT_RESULT}
                            echo "" >> ../../hw_results/${EXTRA_CREDIT_RESULT}
                        fi
                    fi
                fi
                cd ..
            fi
            cd ..
        fi
    done
done < $GITHUB_USERNAME_LIST




















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




















#Put the time in seconds which the process is allowed to run below
KILL_TIME=1

KILL_LIST=`{
ps -eo uid,pid,lstart | tree |
    while read PROC_UID PROC_PID PROC_LSTART; do
        SECONDS=$[$(date +%s) - $(date -d"$PROC_LSTART" +%s)]
        if [ $SECONDS -gt $KILL_TIME ]; then
        echo -n "$PROC_PID "
        fi
     done 
}`

if [[ -n $KILL_LIST ]]
then
        kill $KILL_LIST
fi






