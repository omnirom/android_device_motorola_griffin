# Copyright (C) 2010 The Android Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/motorola/griffin/device.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/motorola/griffin/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_NAME := omni_griffin
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := griffin
PRODUCT_MODEL := Moto Z
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

TARGET_VENDOR_PRODUCT_NAME := griffin_retail
TARGET_VENDOR_DEVICE_NAME := griffin

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="griffin-user 8.0.0 OPL27.76-51 58 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := motorola/griffin/griffin:8.0.0/OPL27.76-51/58:user/release-keys
