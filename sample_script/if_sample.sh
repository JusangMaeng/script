#!/bin/sh

#compare number
num=1

if [ $num == 1 ]; then
	echo "result $num is 1"
else
	echo $num is not 1
fi

if [ $num -eq 1 ]; then
	echo $num eq 1
fi

if [ $num -gt 0 ]; then
	echo "$num > 0"
fi

if [ $num -ge 1 ]; then
	echo "$num >= 1"
fi

if [ $num -lt 2 ]; then
	echo "$num < 2"
fi

if [ $num -le 1 ]; then
	echo "$num <= 1"
fi

#compare string
str="helloworld"
if [ $str != "hello" ]; then
	echo $str is not hello
else
	echo $str is hello
fi

str=""
if [ -z $str ]; then
	echo "str size is 0"
fi

str="s"
if [ -n $str ]; then
	echo "str size is not 0"
fi

#file and folder
dir="sample"
if [ ! -d $dir ]; then
	echo "There is not directory $PWD/$dir"
fi

file="if_sample.sh"
if [ -e $file ]; then
	echo "There is file : $file"
fi

