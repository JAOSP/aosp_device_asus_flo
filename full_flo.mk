#
# Copyright 2013 The Android Open-Source Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=razor BUILD_FINGERPRINT=google/razor/flo:5.0/LRX21P/1570855:user/release-keys PRIVATE_BUILD_DESC="razor-user 5.0 LRX21P 1570855 release-keys"

PRODUCT_NAME := full_flo
PRODUCT_DEVICE := flo
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus
PRODUCT_RESTRICT_VENDOR_FILES := true

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/flo/device.mk)
$(call inherit-product-if-exists, vendor/asus/flo/device-vendor.mk)
#$(call inherit-product-if-exists, vendor/qcom/proprietary/common/config/device-vendor.mk)

#AOSP
$(call inherit-product-if-exists, vendor/aosp/asus/flo/full.mk)
$(call inherit-product, device/aosp/common/full.mk)
