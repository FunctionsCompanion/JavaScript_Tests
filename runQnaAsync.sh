#!/bin/bash
# Ask users for count
echo "Enter the number of queued jobs you want to run"
read jobs
c=1
remain=50
rm outAsyncQna.log
while [ $c -le $jobs ]; do 
    sfdx force:apex:execute -f test_apex/runQnaAsync.apex -u test-c9fg8etmazho@example.com  >> outAsyncQna.log &
    sleep 1
    echo 'Another run of test_apex/runQnaAsync.apex invocations.' $c 'out of' $jobs 'runs.' 
    c=$(($c+1))
    
done