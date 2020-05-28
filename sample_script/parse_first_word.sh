#!/bin/sh

# print from tail to 2nd line.
#   $ tail -n +2 /proc/cgroups
# cut off
#   $ cut -f1
tail -n +2 /proc/cgroups | cut -f1


