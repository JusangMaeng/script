#!/bin/sh

list=(3dmali bluez-tools commonapi gst-plugins-itapi gstreamer_mediaplay iptv kernel prebuilt  system-api tccbox tcc_launcher tclog tcresource tdd-prebuilt teleplayer tms-prebuilt u-boot tools docs)

for i in "${list[@]}"
do
	cd $i/git
	rm -rf * ./!\(.git\)
	cd -
done
