#!/bin/sh

# Memory the current directory
CUR_DIR=$(pwd)

croot && export ANDROID_BUILD_TOP=$(pwd)

# Hack MTK RIL libs for USSD and incoming calls
# see https://github.com/phhusson/treble_experimentations/issues/57#issuecomment-416998086
BLOB_ROOT="$ANDROID_BUILD_TOP"/vendor/oneplus/denniz/proprietary

for blob in $BLOB_ROOT/lib64/libmtk-ril.so; do
    sed -i \
        -e 's/AT+EAIC=2/AT+EAIC=3/g' \
        $blob
done

# Give ROM Build Type
export EVO_BUILD_TYPE=UNOFFICIAL

# Discard patches
source device/oneplus/denniz/patches/functions.sh
discardPatches

# Guard
if ! history | tail -n 1 | grep -q "denniz"; then return; fi

# Go to root of source
cd "$ANDROID_BUILD_TOP"

# Apply patches
applyPatches

# Return to saved directory
cd $CUR_DIR ; unset CUR_DIR

return
