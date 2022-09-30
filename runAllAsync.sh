#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm *.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute --loglevel=DEBUG -f test_apex/runSentimentAsync.apex -u test-mzczhjcguvwk@example.com >> outAsyncClass.log &
    sleep .5
    #sfdx force:apex:execute -f test_apex/runQnaAsync.apex -u test-mzczhjcguvwk@example.com >> outAsyncQna.log &
    #sleep .5
    echo 'Another Aync runs that invokes 5 async functions.' $c 'out of' $jobs 'batches started.' 
    c=$(($c+1))
    
done