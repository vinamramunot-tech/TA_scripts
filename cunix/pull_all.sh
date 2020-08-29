#!/bin/bash

GITHUB_USERNAME_LIST="student_github.txt"

cd ../../student_repo

while read line; 
do
    for username in $line
    do
        cd ${username}_Homework_CS232
        git pull origin master
        cd ..
    done
done < "$GITHUB_USERNAME_LIST"