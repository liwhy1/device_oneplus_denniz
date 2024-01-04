#!/bin/bash

# Move to source root
cd "$ANDROID_BUILD_TOP"

# Clone dependencies
KERNEL=kernel/oneplus/denniz
if ! [ -d "$KERNEL" ]; then git clone --depth=1 https://github.com/liwhy1/kernel_oneplus_denniz -b main kernel/oneplus/denniz
fi
VENDOR=vendor/oneplus/denniz
if ! [ -d "$VENDOR" ]; then git clone --depth=1 https://github.com/liwhy1/vendor_oneplus_denniz -b main vendor/oneplus/denniz
fi
IMS=vendor/oneplus/IMS-denniz
if ! [ -d "$IMS" ]; then git clone --depth=1 https://github.com/liwhy1/vendor_oneplus_IMS-denniz -b main vendor/oneplus/IMS-denniz
fi
FIRMWARE=vendor/firmware/denniz
if ! [ -d "$FIRMWARE" ]; then git clone --depth=1 https://github.com/liwhy1/vendor_firmware_denniz -b main vendor/firmware/denniz
fi
PROTON=prebuilts/clang/host/linux-x86/proton
if ! [ -d "$PROTON" ]; then git clone --depth=1 https://github.com/kdrag0n/proton-clang -b master prebuilts/clang/host/linux-x86/proton
fi
PARTS=packages/apps/OneplusParts
if ! [ -d "$PARTS" ]; then git clone --depth=1 https://github.com/liwhy1/packages_apps_OneplusParts -b tiramisu packages/apps/OneplusParts
fi
EXTRAS=packages/apps/OPlusExtras
if ! [ -d "$EXTRAS" ]; then git clone --depth=1 https://github.com/liwhy1/packages_apps_OPlusExtras -b udc packages/apps/OPlusExtras
fi
POCKET=packages/apps/PocketMode
if ! [ -d "$POCKET" ]; then git clone --depth=1 https://github.com/nishant6342/packages_apps_PocketMode.git packages/apps/PocketMode
fi

# Move to source root
cd "$ANDROID_BUILD_TOP"
