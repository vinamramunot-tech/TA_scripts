#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
OUTPUT="output.txt"
HW4_RESULT="hw_results/hw4_result.txt"
TEST_SCORE=0

function createHomeworkResult(){
    if [ -f "$HW4_RESULT" ]
    then
        rm -f "$HW4_RESULT"
        touch "$HW4_RESULT"
    else
        touch "$HW4_RESULT"
    fi
}

# function copyTheBomb(){
#     cp ../../../hw4_solution_scripts/theBomb .
#     cp ../../../hw4_solution_scripts/expectedOutput.txt .
# }

# function remove(){
#     rm theBomb > /dev/null
# }


createHomeworkResult

cat "$GITHUB_USERNAME_LIST" | while read line 
do
    echo $line | while read -a wordarray
    do
        ((TEST_SCORE=0))
        if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        then
            cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            if [ -d "hw4" ]
            then
                cd hw4
                while read -a ans
                do
                    case "${ans[0]}" in
                        "Careful")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                            ;;
                        "76")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                            ;;
                        "jjja")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                            ;;
                        "37")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                            ;;
                        "3hhhhhhhhh")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                            ;;
                        "iiiiiiiii4")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                            ;;
                        "-20")
                            TEST_SCORE=$(( TEST_SCORE + 10 ))
                    esac
                done < *.txt
                cd ..
            fi
            cd ..
        fi
        echo "${wordarray[0]}" >> ${HW4_RESULT}
        echo -e "\t\tscore: ${TEST_SCORE}" >> ${HW4_RESULT}
        echo -e "" >> ${HW4_RESULT}
    done
done