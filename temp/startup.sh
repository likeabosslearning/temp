#!/bin/bash

cd /home/site/wwwroot
pm2 start ecosystem.config.js --no-daemon
