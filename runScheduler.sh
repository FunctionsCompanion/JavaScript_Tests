#!/bin/bash
# Ask users for count
echo "Starting the job scheduler"

sfdx force:apex:execute -f test_apex/runScheduleJobs.apex -u test-c9fg8etmazho@example.com >> runScheduleJobs.log &

