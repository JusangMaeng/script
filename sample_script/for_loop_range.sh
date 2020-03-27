#!/bin/sh

for i in {1..5}; do
	echo $i
done


for i in {5..1}; do
	echo $i
done

START=1
END=5
for i in $(eval echo "{$START..$END}"); do
	echo $i
done

arr1=(one two three)
for i in ${!arr1[@]}; do
	echo $i
	echo ${arr1[$i]}
done
