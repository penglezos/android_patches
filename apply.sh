#!/bin/bash
#
# Copyright (C) 2022-2023 penglezos <panagiotisegl@gmail.com>
#
# A script to apply patches to AOSP
#

echo $1
rootdirectory="$PWD"

dirs="frameworks/base packages/apps packages/modules lineage-sdk system/core"

for dir in $dirs ; do
	cd $dir
	echo "Applying $dir patches..."
	git am $rootdirectory/patches/$dir/*.patch
	git am --abort &> /dev/null
done