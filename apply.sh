#!/bin/bash
#
# Copyright (C) 2022 penglezos <panagiotisegl@gmail.com>
#
# Apply Android patches 
#

echo $1
rootdirectory="$PWD"

dirs="frameworks/base build/make packages/apps packages/modules lineage-sdk"

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