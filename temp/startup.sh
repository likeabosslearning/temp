#!/bin/bash

cd /home/site/wwwroot
SERVERNAME=$(hostname)

if [ -f "$SERVERNAME" ]; then
    echo "Npm was executed"
else
    echo "Running npm install & npm run build"
    npm install
    npm run build
    touch "$SERVERNAME"
fi

yarn run start
