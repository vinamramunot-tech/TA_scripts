#!/bin/bash


# student list with names in the format "LastName FirstName"
input="student_list.txt"

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
    touch "${fname%?}_${courseName}_HW${homework_number}.txt"
    echo -e "Contains the string that needs to be inserted in the file" > "${fname%?}_${courseName}_HW${homework_number}.txt"
    
done < "$input"
