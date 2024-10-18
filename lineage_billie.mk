#
# Copyright (C) 2020 The LineageOS Project
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

#
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

#
# All components inherited here go to LineageOS image
#
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Set shipping API level (Indicates the first api level, device has been commercially launched on)
PRODUCT_SHIPPING_API_LEVEL := 29

# Inherit from billie device
$(call inherit-product, device/oneplus/billie/device.mk)

# Device identifiers.
PRODUCT_NAME := lineage_billie
PRODUCT_DEVICE := billie
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := Nord N10 5G

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="OnePlusN10-user 11 RKQ1.201217.002 2311081107 release-keys" \
    BuildFingerprint=OnePlus/OnePlusN10/OnePlusN10:11/RKQ1.201217.002/2311081107:user/release-keys \
    DeviceName=OnePlusN10 \
    DeviceProduct=OnePlusN10 \
    SystemDevice=OnePlusN10 \
    SystemName=OnePlusN10
