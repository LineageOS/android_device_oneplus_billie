#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
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
