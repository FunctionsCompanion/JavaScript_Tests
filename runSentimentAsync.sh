#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm outAsyncSent.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute -f test_apex/runSentimentAsync.apex -u test-uet4cvemcwup@example.com >> outAsyncSent.log &
    sleep .5
    echo 'Another job queued with  different async function invocations.' $c 'out of' $jobs 'jobs queued.' 
    c=$(($c+1))
    
done