#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
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

# Init and startup stuff
PRODUCT_COPY_FILES += \
    device/samsung/dropad/prebuilt/root/init.smdkv210.rc:root/init.smdkv210.rc \
    device/samsung/dropad/prebuilt/root/init:root/init \
    device/samsung/dropad/prebuilt/root/ueventd.rc:root/ueventd.rc \
    device/samsung/dropad/prebuilt/root/ueventd.smdkv210.rc:root/ueventd.smdkv210.rc 

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Proprietary vendor stuff
$(call inherit-product, vendor/samsung/common/dropad/dropad-vendor.mk)


## prebuilt zImage
#PRODUCT_COPY_FILES += \
#    device/samsung/dropad/zImage:zImage

# Asound config files (note, need to fix up HDMI audio switching!)
PRODUCT_COPY_FILES += \
    device/samsung/dropad/prebuilt/etc/asound.conf:system/etc/asound.conf \
    device/samsung/dropad/prebuilt/etc/asound0.conf:system/etc/asound0.conf \
    device/samsung/dropad/prebuilt/etc/asound1.conf:system/etc/asound1.conf \
    device/samsung/dropad/prebuilt/etc/audio_sw.sh:system/etc/audio_sw.sh

# kernel modules and files for wifi
PRODUCT_COPY_FILES += \
    device/samsung/dropad/prebuilt/lib/modules/ar6000.ko:system/lib/modules/ar6000.ko \
    device/samsung/dropad/prebuilt/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/samsung/dropad/prebuilt/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin\
    device/samsung/dropad/prebuilt/wifi/fakeBoardData_AR6002.bin:system/wifi/fakeBoardData_AR6002.bin \
    device/samsung/dropad/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# PowerVR kernel modules and such
#PRODUCT_COPY_FILES += \
#    device/samsung/dropad/prebuilt/vendor/pvrsrvinit:system/vendor/pvrsrvinit \
#    device/samsung/dropad/prebuilt/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
#    device/samsung/dropad/prebuilt/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
#    device/samsung/dropad/prebuilt/vendor/lib/egl/libGLESv2_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_CM_POWERVR_SGX540_120.so \
#    device/samsung/dropad/prebuilt/vendor/lib/hw/gralloc.s5pc110.so:system/vendor/lib/hw/gralloc.s5pc110.so \
    

# Files for vold and such
PRODUCT_COPY_FILES += \
    device/samsung/dropad/prebuilt/etc/vold.conf:system/etc/vold.conf \
    device/samsung/dropad/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Files for misc items
PRODUCT_COPY_FILES += \
    device/samsung/dropad/prebuilt/usr/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/dropad/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/dropad/prebuilt/usr/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
    device/samsung/dropad/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin

