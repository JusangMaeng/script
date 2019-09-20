#!/bin/sh

num=0

if [ $num == 1 ]; then
	echo "succ : result $num is 1"
	echo "ret val 0"
	exit 0
else
	echo "error : $num is not 1"
	echo "ret val 1"
	exit 1
fi


