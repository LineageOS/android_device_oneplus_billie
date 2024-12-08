#! /vendor/bin/sh
#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

model=$(getprop ro.boot.product.hardware.sku)

# Switch based on the model value
case "$model" in
    8)
        # billie8/billie8t
        setprop vendor.radio.multisim.config "ssss"
        ;;
    9)
        # billie
        setprop vendor.radio.multisim.config "dsds"
        setprop persist.vendor.radio.uicc_se_enabled "true"
        ;;
    *)
        # Default for other models
        setprop vendor.radio.multisim.config "dsds"
        ;;
esac
