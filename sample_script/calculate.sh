#!/bin/sh

x=50
y=2

echo "Need spaces around sign."
echo "correct ex) expr \$x + \$y"
echo "wrong ex) expr \$x+\$y"

var=`expr $x + $y`
echo "$x + $y = $var"

var=`expr $x - $y`
echo "$x - $y = $var"

var=`expr $x / $y`
echo "$x / $y = $var"

var=`expr $x \* $y`
echo "$x * $y = $var"

