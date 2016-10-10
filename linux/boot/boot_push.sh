#!/bin/bash
APIKEY=<API_KEY>
URL=https://api.pushbullet.com/v2/pushes
MESSAGE="Hi Master, I am here to serve you!!"
TYPE="note"
TITLE="*-Server"

curl -u $APIKEY $URL -d type=$TYPE -d title="$TITLE" -d body="$MESSAGE"
