#!/bin/sh

NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'

echo -e "${GREEN}command : \"ls\"${NC}"
ls 
if [ $? -eq 0 ]; then
	echo -e "${BLUE}success!!${NC}"
else
	echo -e "${RED}fail!!${NC}"
fi

echo -e "${GREEN}command : \"dump\"${NC}"
ls /asdfasdf
if [ $? -eq 0 ]; then
	echo -e "${BLUE}success!!${NC}"
else
	echo -e "${RED}fail!!${NC}"
fi
