#!/bin/bash

# Move to source root
cd "$ANDROID_BUILD_TOP"

# Clone dependencies
echo Cloning repositories
VT=vendor/oneplus/denniz
if ! [ -a $VT ]; then git clone https://github.com/nattolecats/proprietary_vendor_oneplus_denniz vendor/oneplus/denniz
fi
FW=vendor/oneplus/denniz-firmware
if ! [ -d $FW ]; then git clone https://github.com/nattolecats/android_vendor_oneplus_denniz-firmware vendor/oneplus/denniz-firmware
fi
KERNEL=device/oneplus/denniz-kernel
if ! [ -d $KERNEL ]; then git clone https://github.com/nattolecats/android_device_oneplus_denniz-kernel device/oneplus/denniz-kernel
fi
MTK_SEPOLICY=device/mediatek/sepolicy_vndr
if ! [ -d $MTK_SEPOLICY ]; then git clone https://github.com/Project-Elixir/device_mediatek_sepolicy_vndr -b UNO device/mediatek/sepolicy_vndr
fi
MTK=hardware/mediatek
if ! [ -d $MTK ]; then git clone https://github.com/nishant6342/android_hardware_mediatek -b lineage-20 hardware/mediatek
fi
WLAN=hardware/mediatek/wlan
if ! [ -d $WLAN ]; then git clone https://github.com/nishant6342/android_hardware_mediatek_wlan hardware/mediatek/wlan
fi
OPLUS=hardware/oplus
if ! [ -d $OPLUS ]; then git clone https://github.com/nishant6342/android_hardware_oplus hardware/oplus
fi
COMPACT=hardware/lineage
if ! [ -d $COMPACT ]; then git clone https://github.com/LineageOS/android_hardware_lineage_compat -b lineage-20.0 hardware/lineage/compat
fi
CLANG17=prebuilts/clang/host/linux-x86/clang-r487747
if ! [ -d $CLANG17 ]; then git clone https://gitlab.com/projectelixiros/android_prebuilts_clang_host_linux-x86_clang-r487747 prebuilts/clang/host/linux-x86/clang-r487747
fi
PARTS=packages/apps/RealmeParts
if ! [ -d $PARTS ]; then git clone https://github.com/nishant6342/packages_apps_RealmeParts packages/apps/RealmeParts
fi
POCKET=packages/apps/PocketMode
if ! [ -d $POCKET ]; then git clone https://github.com/nishant6342/packages_apps_PocketMode packages/apps/PocketMode
fi
echo Done
