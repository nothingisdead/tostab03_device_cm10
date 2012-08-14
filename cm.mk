# Inherit device configuration for tf101.
$(call inherit-product, device/toshiba/tostab03/full_tostab03.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_tostab03
PRODUCT_BRAND := toshiba
PRODUCT_DEVICE := tostab03
PRODUCT_MODEL := THRiVE
PRODUCT_MANUFACTURER := toshiba
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=US_epad BUILD_FINGERPRINT=asus/US_epad/EeePad:4.0.3/IML74K/US_epad-9.2.1.11-20120221:user/release-keys PRIVATE_BUILD_DESC="US_epad-user 4.0.3 IML74K US_epad-9.2.1.11-20120221 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := tostab03
