#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm *.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute -f test_apex/runSentimentSync.apex -u test-hzn5xxsquyhp@example.com >> outSyncSent.log &
    sleep .5
    sfdx force:apex:execute -f test_apex/runQnaSync.apex -u test-hzn5xxsquyhp@example.com  >> outSyncQna.log &
    sleep .5
    sfdx force:apex:execute -f test_apex/runQnaAsync.apex -u test-hzn5xxsquyhp@example.com >> outAsyncQna.log &
    sleep .5
    sfdx force:apex:execute -f test_apex/runSentimentAsync.apex -u test-hzn5xxsquyhp@example.com >> outAsyncSent.log &
    sleep .5
    echo 'Another 4 runs that queue function invocations.' $c 'out of' $jobs 'batches started.' 
    c=$(($c+1))
    
done