#!/bin/bash
# Ask users for prefix
echo 'Please provide the username for the target org you wish to install Functions Companion.'
echo -n 'username:'
read username

# Install the Functions Companion Package in the org
echo 'Installing Functions Companion'
echo 'sfdx force:package:install --wait 10 --package 04t8c000001AHeq -u' ${username}
sfdx force:package:install --wait 10 --package 04t8c000001AHeq -u "${username}"
echo ''
echo 'Configuring the package and installing a dummy API key: XXXXXXX-XXXXXXX-XXXXXXX-XXXXXXX.'
echo 'Be sure to update with a valide API key after you create your Connected App.'
echo ''
echo 'To uninstall this package go to the "Installed Packages" web interface in your Salesforce org.'

if [ $# -eq 1 ]
then
  echo === INSTALLING $1 ===
  echo 'sfdx force:data:tree:import -p ./data/FC_Settings__c-plan-$1.json -u' ${username}
  sfdx force:data:tree:import -p ./data/FC_Settings__c-plan-$1.json -u "${username}"
else
  echo 'sfdx force:data:tree:import -p ./data/FC_Settings__c-plan.json -u' ${username}
  sfdx force:data:tree:import -p ./data/FC_Settings__c-plan.json -u "${username}"
fi

echo 'sfdx force:data:tree:import -p ./data/fcConfig__c-plan.json -u' ${username}
sfdx force:data:tree:import -p ./data/fcConfig__c-plan.json -u "${username}"
