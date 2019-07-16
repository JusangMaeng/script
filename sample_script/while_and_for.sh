#!/bin/sh

while [ TRUE ] ; do
	for i in {1..5}; do
		echo $i
		sleep 2
	done

	for i in {5..1}; do
		echo $i
		sleep 2
	done
done
