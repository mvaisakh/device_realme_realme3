#
# Copyright 2020 The Android Open-Source Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

DEVICE_PATH := device/realme/realme3

PRODUCT_TARGET_VNDK_VERSION := 28

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/realme/realme3-kernel/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# Audio configs
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration_stub.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_stub.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/configs/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/usb_audio_policy_configuration.xml \
        
# Audio packages
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio@4.0 \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@4.0-impl

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth.a2dp@1.0

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Media
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/configs/media_profiles_V1_0.dtd:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_V1_0.dtd

# Power Profiles
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/configs/power_profile.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/power_profile/power_profile.xml

# Priv-app perms
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/configs/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Seccomp
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_SYSTEM)/etc/seccomp_policy/mediacodec.policy \
    $(DEVICE_PATH)/configs/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_SYSTEM)/etc/seccomp_policy/mediaextractor.policy \

$(call inherit-product-if-exists, vendor/realme/realme3/realme3-vendor.mk)
