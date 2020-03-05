#
#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from RMX1821 device
$(call inherit-product, device/realme/realme3/device.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1520
TARGET_SCREEN_WIDTH := 720

PRODUCT_NAME := lineage_realme3
PRODUCT_DEVICE := realme3
PRODUCT_BRAND := Realme
PRODUCT_MODEL := RMX1821
PRODUCT_MANUFACTURER := Realme

PRODUCT_GMS_CLIENTID_BASE := android-realme
TARGET_VENDOR := realme
TARGET_VENDOR_PRODUCT_NAME := RMX1821
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_oppo6771_18601-user 9 PPR1.180610.011 eng.root.20200113.215852 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := full_oppo6771_18601-user-9-PPR1.180610.011-eng.root.20200113.215852-release-keys
