#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm *.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute -f test_apex/runSentimentAsync.apex -u test-c9fg8etmazho@example.com >> outAsyncClass.log &
    sleep 1
    #sfdx force:apex:execute -f test_apex/runQnaAsync.apex -u test-c9fg8etmazho@example.com >> outAsyncQna.log &
    #sleep 1
    echo 'Another 2 Sync runs that queue function invocations.' $c 'out of' $jobs 'batches started.' 
    c=$(($c+1))
    
done