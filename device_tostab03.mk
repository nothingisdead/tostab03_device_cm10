# Copyright (C) 2011 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/toshiba/tostab03/tostab03-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/toshiba/tostab03/overlay

# Prebuilt kernel location
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/toshiba/tostab03/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init.antares.rc:root/init.antares.rc \
    $(LOCAL_PATH)/ramdisk/init.antares.usb.rc:root/init.antares.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.antares.rc:root/ueventd.antares.rc \

# Boot Animation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bootanimation.zip:system/media/bootanimation.zip

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Extra packages to build for this device
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory \
	make_ext4fs \
	audio.primary.tegra \
	audio.a2dp.default \
	libaudioutils \
	tinyplay \
	tinycap \
	tinymix \
	liba2dp \
	libinvensense_hal

# Properties specific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    	wifi.interface=wlan0 \
    	wifi.supplicant_scan_interval=15 \
    	ro.opengles.version=131072 \
	ro.ethernet.interface=eth0 \
	ro.ethernet.autoEnable=yes \
	ro.sf.lcd_density=140 \
	dalvik.vm.dexopt-data-only=1 \
	mbm.gps.config.gps_ctrl=/dev/cdc-wdm0 \
	mbm.gps.config.gps_nmea=/dev/ttyACM2 \
	mbm.gps.config.gps_pref_mode=MEGPS \
	mbm.gps.config.supl.enable_ni=yes \
	mbm.gps.config.supl.allow_uncert=yes \
	mbm.gps.config.supl.username=test \
	mbm.gps.config.supl.password=test

ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

# This device has enough room for precise dalvik
PRODUCT_TAGS += dalvik.gc.type-precise

# Build characteristics settings
PRODUCT_CHARACTERISTICS := tablet

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

# Call the vendor to setup proprietary files
$(call inherit-product-if-exists, vendor/toshiba/tostab03/tostab03-vendor.mk)

# Device naming
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_tostab03
PRODUCT_DEVICE := tostab03
PRODUCT_MODEL := tostab03
PRODUCT_BRAND := toshiba
PRODUCT_MANUFACTURER := toshiba
