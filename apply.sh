#!/bin/bash
#
# Copyright (C) 2022 penglezos <panagiotisegl@gmail.com>
#
# Apply Android patches 
#

echo $1
rootdirectory="$PWD"

dirs="frameworks/base build/make"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/patches/$dir/*.patch
done

echo "Patches applied. Changing to root directory."
cd $rootdirectory