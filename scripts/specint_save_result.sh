#!/bin/bash

TODAY=$(date +%Y%m%d)
echo "Today is: ${TODAY}"

SPECINT_DIR=/opt/specint12
CONFIG_FILE=${SPECINT_DIR}/config/centos_arm64_xgene_specint_peak.cfg
TEMP_FILE=${SPECINT_DIR}/temp.txt

TARGET_DIR=~/result-history/result-${TODAY}

cp -rv ${SPECINT_DIR}/result ${TARGET_DIR}

cp -rv ${CONFIG_FILE} ${TARGET_DIR}
cp -rv ${TEMP_FILE} ${TARGET_DIR}



