#
# Copyright 2020 The LineageOS Project
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

DEVICE_PATH := device/oneplus/billie

# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lito
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 2

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.memcg=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3 skip_override
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE :=  4096
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/billie-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/sm6350

# Kernel modules - Audio
TARGET_MODULE_ALIASES += \
    tfa98xx_dlkm.ko:audio_tfa98xx.ko \
    snd_event_dlkm.ko:audio_snd_event.ko \
    bolero_cdc_dlkm.ko:audio_bolero_cdc.ko \
    wcd937x_slave_dlkm.ko:audio_wcd937x_slave.ko \
    wcd938x_slave_dlkm.ko:audio_wcd938x_slave.ko \
    q6_pdr_dlkm.ko:audio_q6_pdr.ko \
    hdmi_dlkm.ko:audio_hdmi.ko \
    q6_notifier_dlkm.ko:audio_q6_notifier.ko \
    va_macro_dlkm.ko:audio_va_macro.ko \
    swr_ctrl_dlkm.ko:audio_swr_ctrl.ko \
    adsp_loader_dlkm.ko:audio_adsp_loader.ko \
    swr_dlkm.ko:audio_swr.ko \
    wcd_core_dlkm.ko:audio_wcd_core.ko \
    wsa883x_dlkm.ko:audio_wsa883x.ko \
    pinctrl_lpi_dlkm.ko:audio_pinctrl_lpi.ko \
    wsa881x_dlkm.ko:audio_wsa881x.ko \
    wsa_macro_dlkm.ko:audio_wsa_macro.ko \
    platform_dlkm.ko:audio_platform.ko \
    usf_dlkm.ko:audio_usf.ko \
    stub_dlkm.ko:audio_stub.ko \
    wcd9xxx_dlkm.ko:audio_wcd9xxx.ko \
    wcd937x_dlkm.ko:audio_wcd937x.ko \
    q6_dlkm.ko:audio_q6.ko \
    mbhc_dlkm.ko:audio_mbhc.ko \
    wcd938x_dlkm.ko:audio_wcd938x.ko \
    machine_dlkm.ko:audio_machine_lito.ko \
    native_dlkm.ko:audio_native.ko \
    apr_dlkm.ko:audio_apr.ko \
    rx_macro_dlkm.ko:audio_rx_macro.ko \
    tx_macro_dlkm.ko:audio_tx_macro.ko

# Asserts
TARGET_OTA_ASSERT_DEVICE := billie,OnePlusN10

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Build
BUILD_BROKEN_DUP_RULES := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_SCREEN_DENSITY := 440
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

ODM_MANIFEST_2_FILES := $(DEVICE_PATH)/manifest_2.xml
ODM_MANIFEST_8_FILES := $(DEVICE_PATH)/manifest_8.xml
ODM_MANIFEST_10_FILES := $(DEVICE_PATH)/manifest_10.xml
ODM_MANIFEST_SKUS += 2 8 10

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_billie
TARGET_RECOVERY_DEVICE_MODULES := libinit_billie

# Partitions - Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions - Boot
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Partitions - DTBO
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Partitions - ODM
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 999424
TARGET_COPY_OUT_ODM := odm

# Partitions - Oneplus
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system vendor
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 7511998464

BOARD_ROOT_EXTRA_FOLDERS := op1

# Partitions - Product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 2115985408
TARGET_COPY_OUT_PRODUCT := product

# Partitions - Recovery
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 80

# Partitions - Super
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 15032385536

# Partitions - System
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 2079678464

# Partitions - Userdata
BOARD_USERDATAIMAGE_PARTITION_SIZE := 236009631744

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_USES_MKE2FS := true

# Partitions - Vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORTIMAGE_PARTITION_RESERVED_SIZE := 1374347264
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := lito
TARGET_BOARD_PLATFORM_GPU := qcom-adreno619L

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Sepolicy - Common
include device/qcom/sepolicy/sepolicy.mk

# Sepolicy - billie
include device/oneplus/billie/sepolicy/billie-sepolicy.mk

# Treble
BOARD_VNDK_VERSION := current

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-03-05

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_VBMETA_SYSTEM := product system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
include vendor/oneplus/billie/BoardConfigVendor.mk
