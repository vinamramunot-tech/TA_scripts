#!/bin/bash


# student list with names in the format "LastName FirstName"
# input="student_list.txt"
input="test.txt"

courseName=""
homework_number=""

read -p "Course Name: " courseName # "CS123"
read -p "Homework Number: " homework_number # "2"

clear
while read line; do
    fname=""
    for word in $line; do
        nameInFile+="${word}"
        fname+="${word}_"
    done
    touch "temp/${fname%?}_${courseName}_HW${homework_number}.txt"
    echo -e -n "ACS577 HW3 -  130/130 = 100 /100  + extra  30/30\nStudent name:  ${fname%?}\nPart I - Reading  ( 10 /10 points)\nPart II - Problem Solving  (78/ 78 points)\nQ1. (20/20)\nQ1-1. (5 points)\nQ1-2. (2 points)\nQ1-3. (6 points)\nQ1-4. (5 points)\nQ1-5. (2 points)\nQ2. (15/15)\nQ2-1. (5 points)\nQ2-2. (8 points)\nQ2-3. (2 points)\nQ3. (15/15)\nQ3-1. (2 points)\nQ3-2. (5 points)\nQ3-3. (8 points)\nQ4. (20/20)\nQ4-1. (3 points)\nQ4-2. (3 points)\nQ4-3. (3 points)\nQ4-4. (3 points)\nQ4-5. (8 points)\nQ5. (8/8)\nQ5-1. (6 points)\nQ5-2  (2 points)\nPractice Part I  ( 12/12 points)\nPractice Part II  ( Extra 30/30 points)" > "temp/${fname%?}_${courseName}_HW${homework_number}.txt"
    
done < "$input"
