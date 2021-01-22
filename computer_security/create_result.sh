#!/bin/bash

GITHUB_USERNAME_LIST="students.txt"
COURSE_NAME="CS445"

while read line 
do
    echo $line | while read -a wordarray
    do
        if [ ! -f "student_repo/${wordarray[0]}_Homework_${COURSE_NAME}/result.md" ]
        then
            touch "student_repo/${wordarray[0]}_Homework_${COURSE_NAME}/result.md"
        fi
    done 
done < "$GITHUB_USERNAME_LIST"