#!/bin/bash

Blue='\033[0;34m'
NC='\033[0m' # No Color

TAG_NAMING="cls_v2.0_sgit_update_20180801"

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

check_tag()
{
	latest_tag=`git tag -l --points-at HEAD | grep cls_v2.0_sgit`
	if [ $? == 0 ]; then
		echo "This is \"$i\", sgit tag exist"
		return 1;
	fi
	
	return 0;
}

for i in "${list[@]}"
do
	cd $i/git
	check_tag
	if [ $? == 0 ]; then
		next_tag="$TAG_NAMING"
		git tag $next_tag
		git push origin $next_tag
		echo -e "${Blue}This is \"$i\", next tag : $next_tag${NC}"
	fi

	cd -
done





