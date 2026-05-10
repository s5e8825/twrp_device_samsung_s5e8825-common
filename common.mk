#
# Copyright (C) 2025 The Android Open Source Project
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

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += fastbootd

# Some useful binaries
PRODUCT_PACKAGES += shrink_common bxhsed_common

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

KERNEL_PREBUILT_PATH ?= device/samsung/s5e8825-kernel
KERNEL_MODULES_PATH := $(KERNEL_PREBUILT_PATH)/modules
ifneq ($(wildcard $(KERNEL_MODULES_PATH)/lib/modules),)
KERNEL_MODULES_PATH := $(KERNEL_MODULES_PATH)/lib/modules
endif
ifneq ($(wildcard $(KERNEL_MODULES_PATH)),)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(KERNEL_MODULES_PATH),recovery/root/lib/modules)
endif

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/s5e8825-common/recovery/root,recovery/root)
