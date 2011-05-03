# Inherit AOSP device configuration for passion.
$(call inherit-product, device/samsung/dropad/dropad.mk)

# Need to keep the rom small (108MB /system)
PRODUCT_SPECIFIC_DEFINES += SKIP_THEMES=true

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

#
# Setup device specific product configuration.
#

# Need to keep the rom small (108MB /system)
PRODUCT_SPECIFIC_DEFINES += SKIP_THEMES=true

PRODUCT_NAME := cyanogen_dropad
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := dropad
PRODUCT_MODEL := dropad
PRODUCT_MANUFACTURER := Samsung

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-Dropad
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC0-Dropad-Asure
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC0-Dropad-Asure-Kang
    endif
endif

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=FRG83D BUILD_DISPLAY_ID=GRI40 PRODUCT_NAME=voles TARGET_DEVICE=sholes BUILD_FINGERPRINT=verizon/voles/sholes/sholes:2.2.1/FRG83D/75603:user/release-keys PRODUCT_BRAND=verizon PRIVATE_BUILD_DESC="voles-user 2.2.1 FRG83D 75603 release-keys" BUILD_NUMBER=75603 BUILD_UTC_DATE=1289367602 TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys USER=android-build

# Extra overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/cyanogen/overlay/tablet

# Boot animation
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/dropad

# Add the Torch app
# PRODUCT_PACKAGES += Torch
PRODUCT_SPECIFIC_DEFINES += SKIP_THEMES=true