./webSearch ./webSearchSol/urlFiles/train1.txt 10 10 < ./webSearchSol/searchFiles/train1.txt > result1.txt
./webSearch ./webSearchSol/urlFiles/train2.txt 10 10 < ./webSearchSol/searchFiles/train2.txt > result2.txt
./webSearch ./webSearchSol/urlFiles/test0.txt 100 1427195 < ./webSearchSol/searchFiles/test0.txt > test_result_0.txt
./webSearch ./webSearchSol/urlFiles/test1.txt 100 1427195 < ./webSearchSol/searchFiles/test1.txt > test_result_1.txt
./webSearch ./webSearchSol/urlFiles/test2.txt 100 1427195 < ./webSearchSol/searchFiles/test1.txt > test_result_2.txt

./webSearchSol/webSearch ./webSearchSol/urlFiles/train1.txt 10 10 < ./webSearchSol/searchFiles/train1.txt > ./webSearchSol/result1.txt
./webSearchSol/webSearch ./webSearchSol/urlFiles/train2.txt 10 10 < ./webSearchSol/searchFiles/train2.txt > ./webSearchSol/result2.txt
./webSearchSol/webSearch ./webSearchSol/urlFiles/test0.txt 100 1427195 < ./webSearchSol/searchFiles/test0.txt > ./webSearchSol/test_result_0.txt
./webSearchSol/webSearch ./webSearchSol/urlFiles/test1.txt 100 1427195 < ./webSearchSol/searchFiles/test1.txt > ./webSearchSol/test_result_1.txt
./webSearchSol/webSearch ./webSearchSol/urlFiles/test2.txt 100 1427195 < ./webSearchSol/searchFiles/test1.txt > ./webSearchSol/test_result_2.txt

diff ./result1.txt ./webSearchSol/result1.txt > results_all.txt
diff ./result2.txt ./webSearchSol/result2.txt >> results_all.txt
diff ./test_result_0.txt ./webSearchSol/test_result_0.txt >> results_all.txt
diff ./test_result_1.txt ./webSearchSol/test_result_1.txt >> results_all.txt
diff ./test_result_2.txt ./webSearchSol/test_result_2.txt >> results_all.txt
