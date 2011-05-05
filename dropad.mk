#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/samsung/dropad/init.smdkv210.rc:root/init.smdkv210.rc \
    device/samsung/dropad/init.rc:root/init.rc \
    device/samsung/dropad/ueventd.smdkv210.rc:root/ueventd.smdkv210.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/dropad/dropad-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	ro.sf.lcd_density=200 \
#	ro.sf.hwrotation=90 \
	wifi.interface=wlan0 \
	dalvik.vm.heapsize=32m

DEVICE_PACKAGE_OVERLAYS += device/samsung/dropad/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs
        
# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
        libSEC_OMX_Core \
        libOMX.SEC.AVC.Decoder \
        libOMX.SEC.M4V.Decoder \
        libOMX.SEC.M4V.Encoder \
        libOMX.SEC.AVC.Encoder

# OpenMAX IL media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/dropad/media_profiles.xml:system/etc/media_profiles.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/samsung/dropad/vold.fstab:system/etc/vold.fstab\
    device/samsung/dropad/apns-conf.xml:system/etc/apns-conf.xml

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/samsung/dropad/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/dropad/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# copy kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#$(call inherit-product-if-exists, vendor/samsung/dropad/dropad-vendor.mk)

# media profiles and capabilities spec
# $(call inherit-product, device/samsung/dropad/media_a1026.mk)

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/small_base.mk)

#Add additional locales and set the en_US as default
PRODUCT_DEFAULT_LANGUAGE := en_US

PRODUCT_NAME := generic_dropad
PRODUCT_DEVICE := dropad
