#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm outAsyncSent.log outSyncSent.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute -f test_apex/runSentimentAsync.apex -u test-l7gbph0utd7u@example.com  >> outAsyncSent.log &
    sleep 1
    sfdx force:apex:execute -f test_apex/runSentimentSync.apex -u test-l7gbph0utd7u@example.com >> outSyncSent.log &
    sleep 1
    echo 'Another run of test_apex/runSentimentAsync.apex and test_apex/runSentimentSync.apex invocations.' $c 'out of' $jobs 'runs.' 
    c=$(($c+1))
    
done