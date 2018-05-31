#!/bin/bash

list=(3dmali bluez-tools commonapi gst-plugins-itapi gstreamer_mediaplay iptv kernel prebuilt  system-api tccbox tcc_launcher tclog tcresource tdd-prebuilt teleplayer tms-prebuilt u-boot)

for i in "${list[@]}"
do
	cd $i
	rm -rf "./!(.git)"
	cd -
done
