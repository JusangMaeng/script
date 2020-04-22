#!/bin/sh

argc=$#
args=$@
echo "number of arguments : $argc"
echo "arguments are : $args"

for i in $*; do 
	echo $i 
done

