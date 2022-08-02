#!/bin/bash
# Ask users for prefix
echo 'Please provide the username for the target org you wish to install Functions Companion.'
echo -n 'username:'
read username
# Install the Functions Companion Package in the org
echo 'Installing v1.20 of Functions Companion'
echo 'sfdx force:package:install --wait 10 --package 04t8c000001AHeq -u' ${username}
sfdx force:package:install --wait 10 --package 04t8c000001AHeq -u "${username}"
echo ''
echo 'Configuring the package and installing a dummy API key: XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX.'
echo 'Be sure to update with a valide API key after you create your Connected App.'
echo 'sfdx force:data:tree:import -p ./data/FC_Settings__c-plan.json -u' ${username}
sfdx force:data:tree:import -p ./data/FC_Settings__c-plan.json -u "${username}"
echo 'sfdx force:data:tree:import -p ./data/fcConfig__c-plan.json -u' ${username}
sfdx force:data:tree:import -p ./data/fcConfig__c-plan.json -u "${username}"