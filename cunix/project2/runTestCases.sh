#!/bin/bash

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
do
	if [[ ${i} -lt 10 ]]
	then
    	url="https://users.pfw.edu/chenz/testweb/page_00000${i}.html"
    else
    	url="https://users.pfw.edu/chenz/testweb/page_0000${i}.html"
    fi

    ./indexPage ${url} > test${i}Output.txt
    ./solution ${url} > test${i}CorrectOutput.txt

    diff -q test${i}CorrectOutput.txt test${i}Output.txt > /dev/null

    if [[ $? == 0 ]]
    then
		echo Test ${i} was passed successfully.
		rm test${i}Output.txt test${i}CorrectOutput.txt
    else
		diff -q -b test${i}CorrectOutput.txt test${i}Output.txt > /dev/null

		if [[ $? == 0 ]]
		then
			echo Test ${i} differed in its whitespace.
		else
			echo Test ${i} failed.
		fi

		echo "Here is a side-by-side comparison for test ${i}, with the correct output on the left, showing only the mismatched lines:"

		diff -y --suppress-common-lines test${i}CorrectOutput.txt test${i}Output.txt
    fi

done