#!/bin/bash

echo "
========================================================

Starting inject.sh

========================================================
"

echo "
========================================================

Waiting for NiFi to start..

========================================================
"

token=$(curl -s --location --request POST "https://draco:${NIFI_WEB_HTTPS_PORT}/nifi-api/access/token" \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode "username=${SINGLE_USER_CREDENTIALS_USERNAME}" \
--data-urlencode "password=${SINGLE_USER_CREDENTIALS_PASSWORD}" \
--insecure
)

LOOPS=15
while [ -z "$token" ]; do

echo "
========================================================

Fetching NiFi Access Token..

========================================================
"

  sleep 15
  let LOOPS--
  if [ $LOOPS -eq 0 ] ; then
    echo 'NiFi has not started :( :('
    exit 1
  fi

  token=$(curl -s --location --request POST "https://draco:${NIFI_WEB_HTTPS_PORT}/nifi-api/access/token" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode "username=${SINGLE_USER_CREDENTIALS_USERNAME}" \
  --data-urlencode "password=${SINGLE_USER_CREDENTIALS_PASSWORD}" \
  --insecure
  )

done

echo "
========================================================

NiFi Started!

========================================================
"

echo "
========================================================

Token : $token

========================================================
"

echo "
========================================================

Fetching Process Group ID..

========================================================
"

process_groups_root=$(curl -s --location --request GET "https://draco:${NIFI_WEB_HTTPS_PORT}/nifi-api/process-groups/root" \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header "Authorization: Bearer ${token}" \
--insecure
)

process_group_id=$(echo $process_groups_root | jq '.id' | sed s/\"//g)

echo "
========================================================

Process Group ID : $process_group_id

========================================================
"

echo "
========================================================

Uploading NiFi Template

========================================================
"

template_data=$(curl -s --location --request POST "https://draco:${NIFI_WEB_HTTPS_PORT}/nifi-api/process-groups/${process_group_id}/templates/upload" \
--header 'Accept: application/xml' \
--header 'Content-Type: multipart/form-data' \
--header "Authorization: Bearer ${token}" \
-F template=@"/opt/nifi/nifi-current/templates/template.xml" \
--insecure)

echo "
========================================================

Uploaded Template succesfully!

========================================================
"

template_id=$(echo $template_data | awk '{split($0,temp,"<id>"); print temp[2]}' | awk '{split($0,temp,"</id>"); print temp[1]}')

echo "
========================================================

Template ID: ${template_id}

========================================================
"

echo "
========================================================

Loading Template into NiFi UI

========================================================
"

template_loaded=$(curl -s --location --request POST "https://draco:${NIFI_WEB_HTTPS_PORT}/nifi-api/process-groups/${process_group_id}/template-instance" \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer ${token}" \
--data '{"templateId":"'${template_id}'","originX":417,"originY":126,"disconnectedNodeAcknowledged":false}' \
--insecure)

echo "
========================================================

Loaded Template into NiFi UI succefully!

========================================================
"