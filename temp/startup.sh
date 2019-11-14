#!/bin/bash

cd /home/site/wwwroot
INSTALL_DIR=/home/site/wwwroot/install.txt

if [-d "$INSTALL_DIR"]; then
    echo "Npm was executed"

else
    echo "Building app"
    npm install
    npm run build
    touch install.txt
fi

yarn run start