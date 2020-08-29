#!/bin/bash


# student list with names in the format "LastName FirstName"
GITHUB_USERNAME_LIST="student_github.txt"
COURSE_NAME="CS232"

cd ../../student_repo/
clear
while read line; do
    
    for username in $line; do
        if [ ! -d "${username}_Homework_${COURSE_NAME}" ] ; then
            git clone https://github.com/${username}/Homework_${COURSE_NAME}.git
            mv Homework_${COURSE_NAME} ${username}_Homework_${COURSE_NAME}
        fi
    done
    
done < "$GITHUB_USERNAME_LIST"