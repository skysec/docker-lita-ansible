#!/bin/bash
HOME_BOT="/home/bot"
cd ${HOME_BOT}/lita
# Is there any update?
if [ -d ${HOME_BOT}/input ]; then
cp ${HOME_BOT}/input/* ${HOME_BOT}/lita
bundle
fi
export LITA_BOT_NAME
export LITA_ADMIN
export LITA_REDIS_HOST
export LITA_REDIS_PORT
export LITA_SLACK_TOKEN
export LITA_CMD_SCRIPTS_DIR 
lita start
