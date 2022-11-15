#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm outSyncSent.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute -f test_apex/runSentimentSync.apex -u test-c9fg8etmazho@example.com >> outSyncSent.log &
    sleep 1
    echo 'Another job queued with 1 different sync function invocations.' $c 'out of' $jobs 'jobs queued.' 
    c=$(($c+1))
    
done