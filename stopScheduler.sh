#!/bin/bash
# Ask users for count
echo "Stoping the job scheduler"

sfdx force:apex:execute -f test_apex/stopScheduleJobs.apex -u test-c9fg8etmazho@example.com >> stopScheduleJobs.log &

