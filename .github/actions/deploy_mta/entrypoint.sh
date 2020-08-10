#!/bin/sh -l
cd ${GITHUB_WORKSPACE}
echo 'Connect to CF'
cf login -a ${INPUT_HOST} -o ${INPUT_ORG} -u ${INPUT_USER} -s ${INPUT_SPACE} -p ${INPUT_PASSWORD}
echo 'Running the mtabuilder...'
npm config set @sap:registry https://npm.sap.com
mbt build -p=cf -t=../ --mtar=myportal.mtar 

echo 'Deploy'
cf install-plugin multiapps -f
cf deploy ../myportal.mtar -f 
