#!/bin/sh

list=(\
	3dmali \
	bluez-tools \
	commonapi \
	gst-plugins-itapi \
	gstreamer_mediaplay \
	iptv \
	kernel \
	prebuilt \
	system-api \
	tccbox \
	tcc_launcher \
	tclog tcresource \
	tdd-prebuilt \
	teleplayer \
	tms-prebuilt \
	u-boot \
	tools \
	docs \
	simpleplayer \
	jp-factory \
	mediafx \
	tc_bluetooth \
	)

for i in "${list[@]}"
do
	cd $i/git
	rm -rf * ./!\(.git\)
	cd -
done
