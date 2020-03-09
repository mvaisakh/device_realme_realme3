#
# Copyright 2020 ProjektEva
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

DEVICE_PATH := device/realme/realme3

BOARD_VENDOR := realme

# AVB
BOARD_AVB_ENABLE := false

# Bootloader
TARGET_BOARD_PLATFORM := mt6771
TARGET_BOOTLOADER_BOARD_NAME := mt6771
TARGET_NO_BOOTLOADER := true

# Architechture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Kernel
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_KERNEL_SEPARATED_DT := true
TARGET_NEEDS_DTBOIMAGE := true
BOARD_RAMDISK_OFFSET := 0x14f88000
TARGET_KERNEL_CONFIG := realme3_defconfig
TARGET_KERNEL_SOURCE := kernel/realme/realme3

TARGET_USES_64_BIT_BINDER := true

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USES_MKE2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor

BUILD_WITHOUT_VENDOR := true

# Props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6771

# Security patch level
VENDOR_SECURITY_PATCH := 2020-01-05

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_VNDK_VERSION := current

# Use the non-open-source parts, if they're present
-include vendor/realme/realme3/BoardConfigVendor.mk
