#!/bin/bash

curl -u <PUSHBULLET_API_KEY> https://api.pushbullet.com/v2/pushes -d type=note -d title="$(hostname)" -d body='Hi Master, I am here to serve you!!'
