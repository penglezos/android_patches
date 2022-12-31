#!/bin/bash
#
# Copyright (C) 2022-2023 penglezos <panagiotisegl@gmail.com>
#
# Remove or apply Android patches
#

echo $1
rootdirectory="$PWD"

dirs="frameworks/base packages/apps packages/modules lineage-sdk system/core"

echo -e "\n1.Remove all patches\n2.Apply all patches"
read -p "Your choice: " num
case $num in 
    1|2|3|4)
esac

if [ $num = '1' ]; then
    for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Removing $dir patches..."
	git reset --hard
	git clean -f -d
done

cd $rootdirectory
    
elif [ $num = '2' ]; then
    for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/patches/$dir/*.patch
done

cd $rootdirectory
    
else echo "Invalid input, aborting!"

fi