valgrind --leak-check=yes ./webSearch ./webSearchSol/urlFiles/train1.txt 10 10 < ./webSearchSol/searchFiles/train1.txt 2> valgrind_results.txt
valgrind --leak-check=yes ./webSearch ./webSearchSol/urlFiles/train2.txt 10 10 < ./webSearchSol/searchFiles/train2.txt 2>> valgrind_results.txt
valgrind --leak-check=yes ./webSearch ./webSearchSol/urlFiles/test0.txt 100 1427195 < ./webSearchSol/searchFiles/test0.txt 2>> valgrind_results.txt
valgrind --leak-check=yes ./webSearch ./webSearchSol/urlFiles/test1.txt 100 1427195 < ./webSearchSol/searchFiles/test1.txt 2>> valgrind_results.txt
valgrind --leak-check=yes ./webSearch ./webSearchSol/urlFiles/test2.txt 100 1427195 < ./webSearchSol/searchFiles/test1.txt 2>> valgrind_results.txt
