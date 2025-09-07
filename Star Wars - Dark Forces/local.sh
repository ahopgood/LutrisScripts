#!/usr/bin/env bash

# This script generates a local version of the lutris script pointing to http://localhost:8080 if no parameter is provided

FILENAME="Star Wars - Dark Forces - GOG - TFE"
HOST=$1

if [ -z $HOST ];then
   HOST="http://localhost:8080"
fi

GITHUB=https://github.com/ahopgood/LutrisScripts/raw/master/Star%20Wars%20-%20Dark%20Forces

# Escape forward slashes before calling sed
#HOST=${HOST/http:\/\//http:\\/\\/}
GITHUB=$(echo $GITHUB | sed 's/\//\\\//g')
HOST=$(echo $HOST | sed 's/\//\\\//g')

cat "${FILENAME}".yaml | sed "s/${GITHUB}/${HOST}/" > "local.${FILENAME}".yaml

