#!/bin/sh

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

list2=(\
	cls/yocto/meta-telechips.git:stable \
	cls/yocto/meta-telechips-bsp-897x.git:stable \
	cls/yocto/meta-telechips-multimedia.git:stable \
	cls/yocto/meta-telechips-gstreamer.git:master \
	cls/yocto/meta-telechips-gstreamer-app.git:stable \
	cls/yocto/meta-telechips-cobalt-browser.git:stable \
	cls/yocto/meta-telechips-qt5.git:stable \
	cls/yocto/meta-telechips-secure.git:master \
	cls/yocto/meta-telechips-skeleton.git:stable \
	)

for i in "${list2[@]}"
do
	git_repo=$(echo $i | cut -d: -f1)
	git_branch=$(echo $i | cut -d: -f2)
	echo git: $git_repo
	echo branch: $git_branch
	
	echo -e "${BLUE}try clone $git_repo ${NC}"
	
	git clone ssh://192.168.3.228:29422/home/git3/linux/$git_repo
	if [ $? -ne 0 ]; then
		echo -e "${RED}fail to clone${NC}"
		exit 0
	fi
	
	echo -e "${BLUE}complete clone $git_repo.git ${NC}"
	
	##parsing folder name
	folder=$(echo $git_repo | rev | cut -d/ -f1 | rev | sed -e "s/\.git//g")
	echo $folder
	cd $folder
	git checkout origin/$git_branch
	
	echo -e "${BLUE}try push to release server $i.git ${NC}"
	git remote add release ssh://git.telechips.com/linuxplatform/linux/$git_repo
	git fetch release
	git push release +HEAD:$git_branch
	if [ $? -ne 0 ]; then
		echo -e "${RED}fail to push${NC}"
		exit 0
	fi
	git push release --tags
	
	cd -
	rm -rf $folder
done
