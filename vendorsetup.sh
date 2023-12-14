#!/bin/sh

# Save current directory
CUR_DIR=$(pwd)

croot && export ANDROID_BUILD_TOP=$(pwd)

# Guard
if ! history | tail -n 1 | grep -q "denniz"; then return; fi

# Go to root of source
cd "$ANDROID_BUILD_TOP"

# Hack MTK RIL libs for USSD and incoming calls
# see https://github.com/phhusson/treble_experimentations/issues/57#issuecomment-416998086
BLOB_ROOT="$ANDROID_BUILD_TOP"/vendor/oneplus/denniz/proprietary

for blob in $BLOB_ROOT/lib64/libmtk-ril.so; do
    sed -i \
        -e 's/AT+EAIC=2/AT+EAIC=3/g' \
        $blob
done

# Apply denniz patches
bash device/oneplus/denniz/patches/patch.sh

# Clone dependencies
if [ -a "$ANDROID_BUILD_TOP/packages/apps/PocketMode" ]; then
    git clone https://github.com/nishant6342/packages_apps_PocketMode.git packages/apps/PocketMode
fi

if [ -a "$ANDROID_BUILD_TOP/packages/apps/OneplusParts" ]; then
    git clone https://github.com/2by2-Project-Devices/packages_apps_OneplusParts.git packages/apps/OneplusParts
fi

if [ -a "$ANDROID_BUILD_TOP/kernel/oneplus/denniz" ]; then
    git clone https://github.com/2by2-Project-Devices/kernel_oneplus_denniz.git kernel/oneplus/denniz
fi

if [ -a "$ANDROID_BUILD_TOP/vendor/oneplus/denniz" ]; then
    git clone https://github.com/2by2-Project-Devices/vendor_oneplus_denniz.git vendor/oneplus/denniz
fi

if [ -a "$ANDROID_BUILD_TOP/vendor/oneplus/IMS-denniz" ]; then
    git clone https://github.com/2by2-Project-Devices/vendor_oneplus_IMS-denniz.git vendor/oneplus/IMS-denniz
fi

if [ -a "$ANDROID_BUILD_TOP/vendor/firmware/denniz" ]; then
    git clone https://github.com/2by2-Project-Devices/vendor_firmware_denniz.git vendor/firmware/denniz
fi

if [ -a "$ANDROID_BUILD_TOP/prebuilts/clang/host/linux-x86/proton" ]; then
    git clone https://github.com/kdrag0n/proton-clang.git prebuilts/clang/host/linux-x86/proton
fi

# Return to saved directory
cd $CUR_DIR ; unset CUR_DIR

return
