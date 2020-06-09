#!/bin/bash

input="student_list.txt"
homework_number=""

read -p "Homework Number: " homework_number
clear
while read line; do
    fname=""
    for word in $line; do
        nameInFile+="${word}"
        fname+="${word}_"
    done
    touch "${fname%?}_CS331_HW${homework_number}.txt"
    echo -e "HW${homework_number} - xxx/100\nName:${fname%?}\n\nPart I (xx/42)\nQ1 (x/4)\nQ2 (x/6)\nQ3 (x/8)\nQ4 (x/4)\nQ5 (x/4)\nQ6 (x/7)\nQ7 (x/3)\nQ8 (x/3)\nQ9 (x/3)\n\nPart II (xx/58)\nQ1 (xx/18)\nQ1-1\nQ1-2\nQ2 (xx/15)\nQ3 (xx/10)\nQ4 (xx/15)" > "${fname%?}_CS331_HW${homework_number}.txt"
    
done < "$input"
