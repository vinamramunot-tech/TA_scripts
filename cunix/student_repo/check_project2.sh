#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"
PROJ_RESULT="hw_results/project2.txt"
TEST_SCRIPT="runTestCases.sh"
SOLUTION="solution"
PYTHON_SCRIPT="getText.py"
INDEX_PAGE="indexPage"


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

# while read line 
# do
#     echo $line | while read -a wordarray
#     do
        # echo "Checking for ${wordarray[0]}...."
        # if [ -d "${wordarray[0]}_Homework_${COURSE_NAME}" ]
        if [ -d "Andriamanjaka_Ralambomanarivo_Homework_CS232" ]
        then
            # echo -n "${wordarray[0]}" >> $PROJ_RESULT
            echo -n "Andriamanjaka_Ralambomanarivo" >> $PROJ_RESULT
            # cd "${wordarray[0]}_Homework_${COURSE_NAME}"
            cd "Andriamanjaka_Ralambomanarivo_Homework_CS232"
            if [ -d "project2" ]
            then
                cd project2
                if [ -f "indexPage.c" ]
                then
                    copyProjectTestFiles ${TEST_SCRIPT} ${SOLUTION} ${PYTHON_SCRIPT}
                    gcc -std=gnu99 -o indexPage indexPage.c 1>/dev/null 2>&1
                    if [ $? == 0 ]
                    then
                        "./$TEST_SCRIPT" 1> "test_Output.txt" 2> /dev/null
                        if [ $? == 0 ]
                        then
                            valgrind --leak-check=yes --error-exitcode=7 ./indexPage "https://users.pfw.edu/chenz/testweb/page_000008.html" 1> temp.txt 2> /dev/null
                            if [ $? == 7 ]
                            then
                                echo -e -n "\t leak" >> "../../$PROJ_RESULT"
                                echo "" >> "../../$PROJ_RESULT"
                            else 
                                rm temp.txt
                            fi
                        fi
                        rm $TEST_SCRIPT $SOLUTION $PYTHON_SCRIPT $INDEX_PAGE
                    else
                        echo -e -n "\t compiler-error" >> "../../$PROJ_RESULT"
                        echo "" >> "../../$PROJ_RESULT"
                        rm $TEST_SCRIPT $SOLUTION $PYTHON_SCRIPT $INDEX_PAGE
                    fi
                else
                    echo -e -n "\t no-solution" >> "../../$PROJ_RESULT"
                    echo "" >> "../../$PROJ_RESULT"
                fi
                cd ..
            else
                echo -e -n "\t project-2-doesn't-exist" >> "../$PROJ_RESULT"
                echo "" >> "../$PROJ_RESULT"
            fi
            cd ..
        fi
        
        # echo -e -n "\t $COMPILE_ERROR" >> $PROJ_RESULT
        # echo -e -n "\t $TEST" >> $PROJ_RESULT
        # echo -e -n "\t $MEMORY_LEAK" >> $PROJ_RESULT((  ))
        # echo "" >> $PROJ_RESULT
#     done
# done < "$GITHUB_USERNAME_LIST" 