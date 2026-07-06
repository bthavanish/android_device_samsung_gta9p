#
# Copyright (C) 2024 The LineageOS Project
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

# inherit from common gta9p-common
-include device/samsung/gta9p-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gta9p

# Assert
TARGET_OTA_ASSERT_DEVICE := gta9p

# Board
BOARD_API_LEVEL := 36
TARGET_BOARD_NAME := SRPWD25B009
TARGET_BOOTIMAGE_BOARD_NAME := SRPWD25B009

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
BOARD_MKBOOTIMG_ARGS += --board $(TARGET_BOOTIMAGE_BOARD_NAME)

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard $(DEVICE_PATH)/prebuilt/modules/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))

# Partitions
BOARD_GTA9P_DYNAMIC_PARTITIONS_SIZE := 5750390784 # (BOARD_SUPER_PARTITION_SIZE - "Reasonable Overhead of 4 MiB" 4194304)
BOARD_SUPER_PARTITION_SIZE := 5754585088

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
include vendor/samsung/gta9p/BoardConfigVendor.mk
