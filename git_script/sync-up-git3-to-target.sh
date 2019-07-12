#!/bin/sh

#if you want to tag in dev server, write tag name.
TAG_DEV_SERVER="cls_ktfhd_20190712"
COMMIT="sync up from dev server tag in devserver : ${TAG_DEV_SERVER}"

#repo download
GIT3_URL="ssh://192.168.3.228:29422/home/git3/linux/platform/manifest.git -m cls/cls_v2_0/cls_source.xml"
GIT3_FOLDER=git3
GIT3_FOLDER_BACKUP=git3_origin
TARGET_URL="ssh://sgit.telechips.com/stb_kt_fhd/manifest.git -m cls/cls_v2_0/cls_source.xml"
TARGET_FOLDER=sgit

LIST=(\
	3dmali \
	app-bridge \
	bluez-tools \
	cobalt-browser \
	commonapi \
	docs \
	fwdn \
	gst-plugins-itapi \
	gst-plugins-telechips \
	gstreamer_mediaplay \
	gst-telechips-cdk \
	iptv \
	jp-factory \
	kernel \
	mediafx \
	simpleplayer \
	system-api \
	tc_bluetooth \
	tc-bt-module \
	tcc_launcher \
	tclog \
	tcresource \
	tc-wifi-module \
	tdd-prebuilt \
	teleplayer \
	tms-prebuilt \
	tools \
	u-boot \
	ufsd \
	vpu \
	)

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

use_backup_sources() {
	echo -e "${BLUE}start download sources${NC}"
	
	if [ -d ${GIT3_FOLDER} ]; then
		echo -e "${RED}remove '${GIT3_FOLDER}' folder ${NC}"
		rm -rf ${GIT3_FOLDER}
	fi
	
	if [ -d ${GIT3_FOLDER_BACKUP} ]; then
		echo -e "${RED}there are sources that has been downloaded in '${GIT3_FOLDER_BACKUP}' folder ${NC}"
		cd ${GIT3_FOLDER_BACKUP}
		echo -e "${RED}repo sync in '${GIT3_FOLDER_BACKUP}' ${NC}"
		repo sync
		cd -
		echo -e "${RED}recovery sources from '${GIT3_FOLDER_BACKUP}' to '${GIT3_FOLDER}' ${NC}"
		cp ${GIT3_FOLDER_BACKUP} ${GIT3_FOLDER} -rf
	fi
	
	if [ -d ${TARGET_FOLDER} ]; then
		echo -e "${RED}sources which is from sgit is already exist, try to sync withoud download{NC}"
		cd ${TARGET_FOLDER}
		repo sync
		cd -
	fi
}

download_sources() {
	if [ ! -d ${GIT3_FOLDER} ]; then
		mkdir ${GIT3_FOLDER}
		echo -e "${BLUE}try to download git3${NC}"
		cd ${GIT3_FOLDER}
		repo init -u ${GIT3_URL}
		repo sync
		cd -
	fi
	#back-up origin
	if [ ! -d ${GIT3_FOLDER_BACKUP} ]; then
		echo -e "${BLUE}copy sources to back up${NC}"
		cp ${GIT3_FOLDER} ${GIT3_FOLDER_BACKUP} -rf
	fi
	
	if [ ! -d ${TARGET_FOLDER} ]; then
		mkdir ${TARGET_FOLDER}
		echo -e "${BLUE}try to download target${NC}"
		cd ${TARGET_FOLDER}
		repo init -u ${TARGET_URL}
		repo sync
		cd -
	fi
	
	echo -e "${BLUE}end download sources${NC}"
}

prepare_sources() {
	echo -e "${BLUE}prepare sources remove .git in git3 ${NC}"
	#remove .git in git3
	for i in "${LIST[@]}"
	do
		echo -e "${BLUE} $PWD remove .git ${NC}"
		cd ${GIT3_FOLDER}/$i/git
		rm -rf .git
		cd -
	done
	
	echo -e "${BLUE}prepare sources remove exceipt .git in target ${NC}"
	#remove source except .git in target
	for i in "${LIST[@]}"
	do
		echo -e "${BLUE} $PWD remove sources ${NC}"
		cd ${TARGET_FOLDER}/$i/git
		rm -rf * ./!\(.git\)
		cd -
	done
}

copy_sources() {
	echo -e "${BLUE}copy sources git3 to target ${NC}"
	cp -rf ${GIT3_FOLDER}/* ${TARGET_FOLDER}
}

push_sources() {
	echo -e "${BLUE}push sources to target ${NC}"
	
	cd ${TARGET_FOLDER}
	repo forall -c git add -A
	repo forall -c git commit -m "${COMMIT}"
	repo forall -c git push origin HEAD:master
	echo -e "${BLUE}push done ${NC}"
	cd -
	
	cd ${GIT3_FOLDER_BACKUP}
	if [ -n $TAG_DEV_SERVER ]; then
		echo -e "${BLUE}push tag to git3 ${NC}"
		repo forall -c git tag $TAG_DEV_SERVER
		repo forall -c git push origin $TAG_DEV_SERVER
	fi
	cd -
}

######main
use_backup_sources
download_sources
prepare_sources
copy_sources
push_sources
