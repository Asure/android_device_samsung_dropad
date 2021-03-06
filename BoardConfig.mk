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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_DROPAD_AUDIO  := true

# inherit from the proprietary version
-include vendor/samsung/dropad/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120
TARGET_BOOTLOADER_BOARD_NAME := dropad

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := true
ANDROID_ARM_LINKER := true

BOARD_NO_PAGE_FLIPPING := true
BOARD_USES_HGL := true
BOARD_USES_OVERLAY := true
DEFAULT_FB_NUM := 2

# Sec OMX Library
WITH_SEC_OMX := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
WIFI_DRIVER_MODULE_PATH     := "system/lib/modules/ar6000.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "ar6000"

BOARD_KERNEL_BASE := 0x20008000

#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_EGL_CFG := device/samsung/dropad/egl.cfg

# Internal SD card for recovery and such
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p1

# emmc storage (internal SD card partition, in fat32 format)
BOARD_EMMC_DEVICE := /dev/block/mmcblk0p1

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_SMALL_RECOVERY := true

#TARGET_RECOVERY_UI_LIB := librecovery_ui_dropad librecovery_ui_generic

#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic

TARGET_PREBUILT_KERNEL := device/samsung/dropad/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/dropad/recovery_kernel
