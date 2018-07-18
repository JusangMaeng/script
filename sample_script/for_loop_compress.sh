#!/bin/sh

list=(3dmali bluez-tools commonapi gst-plugins-itapi gstreamer_mediaplay iptv kernel prebuilt  system-api tccbox tcc_launcher tclog tcresource tdd-prebuilt teleplayer tms-prebuilt u-boot tools docs simpleplayer)

for i in "${list[@]}"
do
	cd ${i}
	tar zcf ${i}.tar.gz git
	mv ${i}.tar.gz ../
	cd -
done

