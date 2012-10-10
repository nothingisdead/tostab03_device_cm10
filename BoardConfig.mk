#
# Copyright (C) 2011 The Android Open-Source Project
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

USE_CAMERA_STUB := true

# Inherit from the proprietary version
-include vendor/toshiba/tostab03/BoardConfigVendor.mk

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board naming
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := antares

# Target arch settings
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Boot/Recovery image settings  
BOARD_KERNEL_CMDLINE := nvmem=128M@384M mem=1024M@0M vmalloc=256M video=tegrafb tegra_fbmem=0x3e8a00@0x1fbfa000 console=none debug_uartport=hsport usbcore.old_scheme_first=1 lp0_vec=8192@0x1fbee000 tegraboot=sdmmc board_info=4249:ff41:ff:ff:54 gpt androidboot.carrier=wifi-only
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE :=

# EGL settings
BOARD_EGL_CFG := device/toshiba/tostab03/prebuilt/egl.cfg
USE_OPENGL_RENDERER := true

# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

#ICS Camera - changed to match a100 
ICS_CAMERA_BLOB := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Support for dock battery
TARGET_HAS_DOCK_BATTERY := true

# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE := bcm4329
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0 firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/system/etc/nvram.txt"

# Todo fix these values to the specific sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5498880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 734003200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_VOLD_MAX_PARTITIONS := 8

# Try to build the kernel
TARGET_KERNEL_CONFIG := cyanogenmod_antares_defconfig

# Prebuilt Kernel Fallback
TARGET_PREBUILT_KERNEL := device/toshiba/tostab03/kernel

# Custom Tools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/toshiba/tostab03/releasetools/tostab03_ota_from_target_files

# Recovery Options
BOARD_CUSTOM_BOOTIMG_MK := device/toshiba/tostab03/recovery/recovery.mk
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_INITRC := device/toshiba/tostab03/recovery/init.rc
TARGET_RECOVERY_PRE_COMMAND := "setboot"
BOARD_HAS_SDCARD_INTERNAL := true

# Audio
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_AUDIO_LEGACY := false
