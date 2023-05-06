#!/bin/bash
#
# Copyright (C) 2022-2023 penglezos <panagiotisegl@gmail.com>
#
# A script to apply patches to AOSP
#

echo $1
rootdirectory="$PWD"

dirs="build/make build/soong frameworks/base packages/apps/Settings packages/apps/Updater packages/modules/Wifi packages/modules/Connectivity lineage-sdk system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git am $rootdirectory/patches/$dir/*.patch
	git am --abort &> /dev/null
done