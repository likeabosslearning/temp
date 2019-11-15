#!/bin/bash

cd /home/site/wwwroot
INSTALL_DIR=/home/site/wwwroot/install.txt

if [ -f "$INSTALL_DIR" ]; then
    echo "Npm was executed"
else
    echo "Running npm install & npm run build"
    npm install
    npm run build
    touch install.txt
fi

yarn run start