#!/bin/bash

export originalPath="$ANDROID_BUILD_TOP"/device/oneplus/denniz/patches
export branch="evo/tiramisu"

applyPatches() {
    export counter=0
    
    cd $originalPath
    
    for i in $(ls -d */); do
        path=$(tr _ / <<< "$i")
        cd "$ANDROID_BUILD_TOP"/"$path"
        git am "$originalPath"/"$i"*.patch
        [[ $? -ne 0 ]] && (( counter++ ))
        git am --abort &> /dev/null
    done
    
    echo "* Missed patches: $counter"
}

discardPatches() {
    cd $originalPath
    
    for i in $(ls -d */); do
        path=$(tr _ / <<< "$i")
        cd "$ANDROID_BUILD_TOP"/"$path"
        
        git reset --hard $branch
    done
}
