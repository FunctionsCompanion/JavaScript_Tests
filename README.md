# JavaScript Test Project

This repo contains a Salesforce Project for testing Functions Companion that includes JavaScript functions. It also
includes an installation and setup script to install Functions Companion into an org.

The Project includes two JavaScript functions. Pre-trained TensorFlow.js models
for [Sentiment Analysis](https://github.com/tensorflow/tfjs-examples/tree/master/sentiment)
and [Question and Answer](https://github.com/tensorflow/tfjs-models/tree/master/qna).

## Prerequsites

1. A Salesforce DevHub
   with [Functions enabled](https://developer.salesforce.com/docs/platform/functions/guide/configure_your_org.html).
2. DevHub Org permissions to create Scratch Orgs
   and [Connected Apps](https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5).
3. A Sandbox or Scratch org and the username for the target org where Functions Companion will be installed.
3. A user account for [Functions Companion](https:app.lastmileops.ai).

If a Sandbox or Scratch org is not yet available, a `build.sh` script is provided to build a scratch org for testing.

## Functions Companion Setup and Configuration

See [Installation and Cofiguration](https://github.com/FunctionsCompanion/docs/blob/main/InstallAndConfig.md)
documentation for details on how to install and configure Functions Companion.
The [Getting Started Guide]((https://github.com/FunctionsCompanion/docs/blob/main/GettingStarted.md) ) will show you how
to set up your Connecteced App for Functions Companion and begin observing the performance of your functions
deployments.

## JavaScript Test Deployment and Invocation

Once Functions Companion is installed in your org, you can deploy this project by running `deployTestFunctions.sh`. This
script asks for a name for the compute environment it will create and reqires the username of the target org that has
Functions Commander installed. The script also configures a logdrain that points to the Functions Companion platform
syslog endpoint and deploys the two JavaScript functions in this project.

Once the Project is deployed, before you run any tests, update the invocation test scripts with the scratch org username
used for anonomyous Apex invocation.

### Test Scripts

The table below includes the list of available test scripts, the functions they run, and how they are invoked.

| Test | QnA | Sentiment | Status |
|------|-----|-----------|--------|
|[runQnaSync.sh](runQnaSync.sh)        |Sync| | All Tests Pass |
|[runQnaAsync.sh](runQnaAsync.sh)        |Async| | All Tests Pass |
|[runQnaSyncAndAsync.sh](runQnaSyncAndAsync.sh)       |Sync and Async| | All Tests Pass |
|[runSentimentSync.sh](runSentimentSync.sh)        | |Sync| All Tests Pass |
|[runSentimentAsync.sh](runSentimentAsync.sh)        | |Async| All Tests Pass |
|[runSentimentSyncAndAsync.sh](runSentimentSyncAndAsync.sh)       ||Sync and Async| All Tests Pass |
|[runBothSync.sh](runBothSync.sh)        |Sync|Sync| All Tests Pass |
|[runBothAsync.sh](runBothAsync.sh)       |Async|Async| All Tests Pass |
|[runAll.sh](runAllFC.sh)       |Sync and Async|Sync and Async| All Tests Pass |

Each script asks for an itteration count so performance and capacity tests can be performed. The QnA function is very
memory intensive and will consume more than 3GB of memory, which can be used to veryify error logging of Functions
Companion.
