#!/bin/bash
# Create a Zendesk Dump using the Zendesk REST API
# Docs: https://developer.zendesk.com/rest_api


INSTANCE=""
USER=""
PASS=""


# Download Tickets
# Tickets are managed by an ID which is incremented with each ticket
# The StartID can be set / found in the administrator settings
# Depending on your plan the export of datasets is limited per minutes
# Adjust / delete the sleep accordingly
START=0
END=5000

for (( i=$START; i<=$END; i++ ))
do
curl -s https://$INSTANCE.zendesk.com/api/v2/tickets/$i/audits.json -v -u $USER:$PASS >> Ticket$i.json
sleep 6
echo "Ticket $i downloaded"
done

# Downloading Users
# Requests up to 100 Users per query
# Query can be adjusted to download Users based on organizsations

curl -s https://$INSTANCE.zendesk.com/api/v2/users.json -v -u $USER:$PASS >> Users.json 
