#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm *.log
while [ $c -le $jobs ]; do 
    #sleep 1
    sfdx force:apex:execute -f test_apex/runQnaSync.apex -u test-xvhrq0xabalz@example.com  >> outSyncQna.log &
    sleep 1
    #sleep 1
    sfdx force:apex:execute -f test_apex/runSentimentSync.apex -u test-xvhrq0xabalz@example.com >> outSyncClass.log &
    sleep 1
    echo 'Another 2 Sync runs that queue function invocations.' $c 'out of' $jobs 'batches started.' 
    c=$(($c+1))
    
done