if [ -n "${CLEAN_DT_REPOS}" ]; then
    if [ "$CLEAN_DT_REPOS" = "True" ]; then
        echo "Cleaning old repos before cloning"
        rm -rf vendor/oneplus
        rm -rf kernel/oneplus
        rm -rf packages/apps/prebuilt-apps
        rm -rf device/mediatek/sepolicy_vndr
        rm -rf vendor/oneplus/denniz-firmware
        rm -rf device/oplus
        rm -rf packages/apps/OneplusParts
        rm -rf packages/apps/PocketMode
        rm -rf hardware/lineage/compat
        rm -rf hardware/mediatek
        rm -rf hardware/oplus
        rm -rf device/oneplus/denniz-kernel
        unset CLEAN_DT_REPOS
    fi
fi

# Clone dependencies
echo Cloning repositories
VT=vendor/oneplus/denniz
if ! [ -d $VT ]; then git clone https://github.com/Evolution-X-Devices/vendor_oneplus_denniz -b udc vendor/oneplus/denniz
fi
FW=vendor/oneplus/denniz-firmware
if ! [ -d $FW ]; then git clone https://gitlab.com/nattolecats/android_vendor_oneplus_denniz-firmware vendor/oneplus/denniz-firmware
fi
KERNEL=kernel/oneplus/denniz
if ! [ -d $KERNEL ]; then git clone --depth=1 https://github.com/Evolution-X-Devices/kernel_oneplus_denniz -b udc kernel/oneplus/denniz
fi
KERNEL_PREBUILT=device/oneplus/denniz-kernel
if ! [ -d $KERNEL_PREBUILT ]; then git clone https://github.com/nattolecats/android_device_oneplus_denniz-kernel device/oneplus/denniz-kernel
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
COMPACT=hardware/lineage/compat
if ! [ -d $COMPACT ]; then git clone https://github.com/LineageOS/android_hardware_lineage_compat -b lineage-20.0 hardware/lineage/compat
fi
CLANG17=prebuilts/clang/host/linux-x86/clang-r487747
if ! [ -d $CLANG17 ]; then git clone https://gitlab.com/projectelixiros/android_prebuilts_clang_host_linux-x86_clang-r487747 prebuilts/clang/host/linux-x86/clang-r487747
fi
PARTS=packages/apps/OneplusParts
if ! [ -d $PARTS ]; then git clone https://github.com/nattolecats/packages_apps_RealmeParts packages/apps/OneplusParts
fi
POCKET=packages/apps/PocketMode/pocket_mode.mk
if ! [ -a $POCKET ]; then git clone https://github.com/nishant6342/packages_apps_PocketMode packages/apps/PocketMode
fi
CAM=device/oplus/camera
if ! [ -d $CAM ]; then git clone --depth=1 https://gitlab.com/nattolecats/device_oplus_camera device/oplus/camera
fi
echo Done
