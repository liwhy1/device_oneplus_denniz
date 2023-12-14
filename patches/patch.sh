#!/bin/bash

DEVICE=denniz
VENDOR=oneplus

export originalPath=$(pwd)
export branch="evo/tiramisu"

if [ $(pwd) == "${ANDROID_BUILD_TOP}" ] ; then export originalPath=$(pwd)/device/$VENDOR/$DEVICE/patches/ ; fi

applyPatches() {
    export counter=0

    cd $originalPath
    for i in $(ls -d */); do
        path=$(tr _ / <<< "$i")
        cd $originalPath
        cd ./../../../../"$path"
        git am "$originalPath"/"$i"*.patch
        [[ $? -ne 0 ]] && (( counter++ ))
        git am --abort &> /dev/null
    done
    
    echo "* Missed patches: $counter"
}

discardPatches() {
    cd $originalPath
    for i in $(ls -d */); do
        cd $originalPath
        path=$(tr _ / <<< "$i")
        cd ./../../../../"$path"
        
        git reset --hard $branch 2>/dev/null
    done
}

discardPatches

echo -e "\e[36m* Discard patches done!\e[m"

sleep 1

applyPatches

echo -e "\e[36m* Apply patches done!\e[m"

sleep 2

cd "$ANDROID_BUILD_TOP"
