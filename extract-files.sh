#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=billie
VENDOR=oneplus

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

# If XML files don't have comments before the XML header, use this flag
# Can still be used with broken XML files by using blob_fixup
export TARGET_DISABLE_XML_FIXING=true

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

ONLY_FIRMWARE=
KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        --only-firmware)
            ONLY_FIRMWARE=true
            ;;
        -n | --no-cleanup)
            CLEAN_VENDOR=false
            ;;
        -k | --kang)
            KANG="--kang"
            ;;
        -s | --section)
            SECTION="${2}"
            shift
            CLEAN_VENDOR=false
            ;;
        *)
            SRC="${1}"
            ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/etc/libnfc-nci.conf)
            [ "$2" = "" ] && return 0
            sed -i "s/\/data\/nfc/\/data\/vendor\/nfc/g" "${2}"
            ;;
        vendor/etc/libnfc-nxp.conf)
            [ "$2" = "" ] && return 0
            sed -i "/NXP_NFC_DEV_NODE/ s/pn553/nq-nci/" "${2}"
            ;;
        vendor/etc/msm_irqbalance.conf)
            [ "$2" = "" ] && return 0
            sed -i "s/IGNORED_IRQ=19,21,38$/&,115,332/" "${2}"
            ;;
        vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so|vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.bitra.so)
            [ "$2" = "" ] && return 0
            "${SIGSCAN}" -p "CF 0A 00 94" -P "1F 20 03 D5" -f "${2}"
            ;;
        vendor/lib64/libaps_frame_registration.so|vendor/lib64/libyuv2.so)
            [ "$2" = "" ] && return 0
            "${PATCHELF}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;
        system_ext/lib64/lib-imsvideocodec.so)
            [ "$2" = "" ] && return 0
            grep -q libgui_shim.so "${2}" || "${PATCHELF}" --add-needed libgui_shim.so "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

if [ -z "${ONLY_FIRMWARE}" ]; then
    extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

fi

if [ -z "${SECTION}" ]; then
    extract_firmware "${MY_DIR}/proprietary-firmware.txt" "${SRC}"
fi

"${MY_DIR}/setup-makefiles.sh"
