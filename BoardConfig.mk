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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

USE_CAMERA_STUB := true
#BOARD_OVERLAY_FORMAT_YCbRc_420_SP := true
BUILD_PV_VIDEO_ENCODERS := 1

# inherit from the proprietary version
-include vendor/samsung/common/dropad/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
# TARGET_NO_KERNEL := true
# (needed, or else no otapackage build..)
TARGET_PREBUILT_KERNEL := device/samsung/dropad/zImage
BOARD_KERNEL_CMDLINE := console=ttySAC0
BOARD_KERNEL_BASE := 0x40000000
BOARD_PAGE_SIZE := 0x00001000
BOARD_KERNEL_BASE := 0x40000000
BOARD_PAGE_SIZE := 0x00001000

# We still need to verify actual max sizes versus real rom.
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := true

TARGET_PROVIDES_INIT_RC := true

TARGET_BOARD := Dropad
TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120

# ARMv7-A Cortex-A8 architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
ANDROID_ARM_LINKER := true

# Sound related defines
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
#ALSA_DEFAULT_SAMPLE_RATE := 44100

BOARD_USES_NEXUS_S_LIBS := false
BOARD_USES_OVERLAY := true

# For the FM Radio
BOARD_HAVE_FM_RADIO := false

# WiFi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT

BOARD_HAVE_WIFI := true
BOARD_WPA_SUPPLICANT_DRIVER :=WEXT
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ar6000.ko"
WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_MODULE_NAME := "ar6000"
WIFI_FIRMWARE_LOADER := ""
WIFI_IFACE_DIR  := "/data/misc/wifi"
CONFIG_DRIVER_WEXT := true

#WPA_SUPPLICANT_VERSION := VER_0_6_X
#BOARD_WLAN_DEVICE := bcm4329
#WIFI_DRIVER_MODULE_PATH := "/lib/modules/dhd.ko"
#WIFI_DRIVER_FW_STA_PATH := "/system/etc/wifi/bcm4329_sta.bin"
#WIFI_DRIVER_FW_AP_PATH := "/system/etc/wifi/bcm4329_aps.bin"
#WIFI_DRIVER_MODULE_ARG := "fm_path=/system/etc/wifi/bcm4329_sta.bin eeprom_file= softmac_file=" ??
#WIFI_DRIVER_MODULE_NAME := "dhd"
#WIFI_SUPP_CONFIG_FILE :=  "/data/wifi/bcm_supp.conf"


# Bluetooth related defines
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_BCM := false

#USB tethering

# egl
BOARD_EGL_CFG := /vendor/samsung/common/dropad/proprietary/egl/egl.cfg

# emmc storage
# BOARD_EMMC_DEVICE := /dev/block/mmcblk0p1

# Device related defines
TARGET_PREBUILT_KERNEL := device/samsung/dropad/zImage
TARGET_NO_BUILD_WIFI := true
#TARGET_PREBUILT_MODULES := device/samsung/galaxytab/prebuilt/lib/modules/2.6.32.9

#BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_HAS_NO_MISC_PARTITION := true
#BOARD_HAS_NO_RECOVERY_PARTITION := true
#BOARD_USES_FFORMAT := true
#BOARD_RECOVERY_IGNORE_BOOTABLES := true

#BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00780000)
#BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00780000)
#BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x14A00000)
#BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BOOT_DEVICE := /dev/block/bml7
BOARD_DATA_DEVICE := /dev/block/mmcblk0p2
BOARD_DATA_FILESYSTEM := rfs
BOARD_DATA_FILESYSTEM_OPTIONS := check=no,nosuid,nodev
BOARD_HAS_DATADATA := true
BOARD_DATADATA_DEVICE := /dev/block/stl10
BOARD_DATADATA_FILESYSTEM := rfs
BOARD_DATADATA_FILESYSTEM_OPTIONS := check=no,nosuid,nodev
BOARD_SYSTEM_DEVICE := /dev/block/stl9
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
BOARD_CACHE_DEVICE := /dev/block/stl11
BOARD_CACHE_FILESYSTEM := rfs
BOARD_CACHE_FILESYSTEM_OPTIONS := check=no,nosuid,nodev
BOARD_SDEXT_FILESYSTEM := auto
BOARD_HAS_PARAMFS := true
BOARD_PARAMFS_DEVICE := dev/block/stl3
BOARD_PARAMFS_FILESYSTEM := rfs

# BOARD_USES_BMLUTILS := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p1
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p1
