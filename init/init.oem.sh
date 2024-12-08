#! /vendor/bin/sh
#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Get the value of ro.boot.product.hardware.sku, default to 0 if not found
model=$(getprop ro.boot.product.hardware.sku)

# If the property is not set or is empty, default to 0
if [ -z "$model" ]; then
    model=0
fi

# Switch based on the model value
case "$model" in
    8)
        # Override properties for model 8
        setprop vendor.radio.multisim.config "ssss"
        ;;
    9)
        # Override properties for model 9
        setprop vendor.radio.multisim.config "dsds"
        setprop persist.vendor.radio.uicc_se_enabled "true"
        ;;
    *)
        # Default override for other models
        setprop vendor.radio.multisim.config "dsds"
        ;;
esac
