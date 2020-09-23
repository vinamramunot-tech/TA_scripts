#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
OUTPUT="output.txt"
HW3_RESULT="hw_results/hw3_result.txt"
FILE_EXISTING=0
FILE_COMPILED=0
BOARD_THREE=0
BOARD_FOUR=0

function createHomeworkResult(){
    if [ -f "$HW3_RESULT" ]
    then
        rm -f "$HW3_RESULT"
        touch "$HW3_RESULT"
    else
        touch "$HW3_RESULT"
    fi
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

function remove(){
    rm 3x3.txt
    rm 4x4.txt
    rm log_3.txt
    rm log_4.txt
    rm fifteen
    rm log.txt
}


createHomeworkResult

cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        (( FILE_EXISTING = 0 ))
        (( FILE_COMPILED = 0 ))
        (( BOARD_THREE = 0 ))
        (( BOARD_FOUR = 0 ))
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            if [ ! "Hunter_Norris" = "${wordarray[0]}" ]
            then
                cd "${wordarray[0]}_Homework_${COURSE_NAME}"
                if [ -d "hw3" ]
                then
                    cd hw3
                    if [ -f "fifteen.c" ]
                    then
                        (( FILE_EXISTING = 1 ))
                        gcc -o fifteen fifteen.c -Wall -Werror -lm 2> /dev/null
                        if [ $? == 0 ]
                        then
                            (( FILE_COMPILED = 1 ))
                            copyExpectedResult

                            run3by3
                            if cmp -s "log_3.txt" "log.txt"
                            then
                                (( BOARD_THREE = 1 ))
                            fi    

                            run4by4
                            if cmp -s "log_4.txt" "log.txt"
                            then
                                (( BOARD_FOUR = 1 ))
                            fi
                            
                            remove
                        fi
                    fi
                    cd ..
                fi
                cd ..
            fi 
        fi
        echo "${wordarray[0]}" >> ${HW3_RESULT}
        echo -e "\t\tfile_existing\tfile_compiled\t\t\tBoard 3\t\t\tBoard 4" >> ${HW3_RESULT}
        echo -e "\t\t\t  ${FILE_EXISTING} \t\t\t\t${FILE_COMPILED}\t\t\t\t\t${BOARD_THREE}\t\t\t\t${BOARD_FOUR}" >> ${HW3_RESULT}
    done
done