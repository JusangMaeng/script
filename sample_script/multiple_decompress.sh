#!/bin/sh

find . -name '*.bz2' -exec tar xvf {} \;
find . -name '*.tar.gz' -exec tar xvf {} \;
