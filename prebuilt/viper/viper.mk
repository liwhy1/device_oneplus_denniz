BUILD_PATH := device/oneplus/denniz/prebuilt/viper

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(BUILD_PATH)/,vendor)

PRODUCT_PACKAGES += \
    ViPER4AndroidFX

# Time to relax
RELAX_USES_LIBRARY_CHECK := true
