#!/bin/sh

echo -e -n "Do you want to continue? (y/n)?"
read answer
case ${answer:0:1} in
    y|Y )
		echo Yes
    ;;
    * )
        echo No
    ;;
esac

