#!/bin/sh

NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'


while [ TRUE ] ; do
	ifconfig | grep wlan

	if [ $? -eq 0 ]; then
		echo -e "${GREEN}disable wlan!!${NC}"
		ifconfig wlan0 down
		exit 1
	else
		echo -e "${BLUE}there is no wlan!!${NC}"
	fi

	sleep 3
done
