#!/bin/bash
#
# Copyright (C) 2022-2023 penglezos <panagiotisegl@gmail.com>
#
# Apply Android patches 
#

echo $1
rootdirectory="$PWD"

dirs="frameworks/base packages/apps packages/modules lineage-sdk system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Cleaning $dir patches..."
	git reset --hard
	git clean -f -d
	echo "Applying $dir patches..."
	git apply $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory