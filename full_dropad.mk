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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=200 \
    ro.sf.hwrotation=90 \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d[SPACE]/dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.wifi.channels=13 \
    ro.url.safetylegal=

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# we have enough storage space to hold precise GC data
# PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit

# Galaxy S uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# For emmc phone storage
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.phone_storage = 1 \
#    ro.additionalmounts=/mnt/emmc

# For mobiledatainterfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces = eth0,pdp0,wlan0

# For GPS
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.gps.socket = /data/gpspipe

# For FM-Radio
#PRODUCT_PROPERTY_OVERRIDES += \
#    fmradio.device = fmradio

#For RIL
#PRODUCT_PROPERTY_OVERRIDES += \
#    phone.ril.classname = com.android.internal.telephony.SamsungRIL


DEVICE_PACKAGE_OVERLAYS += device/samsung/dropad/overlay

# media profiles and capabilities spec
#$(call inherit-product-if-exists, device/samsung/dropad/media_a1026.mk)

# media config xml file
#PRODUCT_COPY_FILES += \
#    device/samsung/dropad/media_profiles.xml:system/etc/media_profiles.xml

# additional postinit scripts
#PRODUCT_COPY_FILES += \
#    device/samsung/dropad/prebuilt/etc/init.d/10htccopyright:system/etc/init.d/10htccopyright

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_dropad
PRODUCT_DEVICE := DROPAD-A8
PRODUCT_MODEL := DROPAD-A8
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
#TARGET_IS_GALAXYS := true

# All device-related items called here
$(call inherit-product, device/samsung/dropad/device.mk)
