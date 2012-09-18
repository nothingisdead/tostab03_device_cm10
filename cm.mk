# Inherit device configuration for tf101.
$(call inherit-product, device/toshiba/tostab03/full_tostab03.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_tostab03
PRODUCT_BRAND := TOSHIBA
PRODUCT_DEVICE := tostab03
PRODUCT_MODEL := AT100
PRODUCT_MANUFACTURER := TOSHIBA
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=tostab03 BUILD_FINGERPRINT=TOSHIBA/tostab03/THRiVE:4.1.1/IML74K/US_epad-9.2.1.11-20120221:user/release-keys PRIVATE_BUILD_DESC="tostab03-userdebug 4.1.1 IML74K US_epad-9.2.1.11-20120221 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := tostab03
