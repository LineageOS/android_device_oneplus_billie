/*
 * Copyright (C) 2020-2023 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/logging.h>
#include <android-base/properties.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

using android::base::GetProperty;

/*
 * SetProperty does not allow updating read only properties and as a result
 * does not work for our use case. Write "OverrideProperty" to do practically
 * the same thing as "SetProperty" without this restriction.
 */
void OverrideProperty(const char* name, const char* value) {
    size_t valuelen = strlen(value);

    prop_info* pi = (prop_info*)__system_property_find(name);
    if (pi != nullptr) {
        __system_property_update(pi, value, valuelen);
    } else {
        __system_property_add(name, strlen(name), value, valuelen);
    }
}

void vendor_load_properties()
{
    auto model = std::stoi(GetProperty("ro.boot.product.hardware.sku", "0"));

    switch (model) {
        case 8:
            OverrideProperty("persist.radio.multisim.config", "ssss");
            break;
        case 9:
            OverrideProperty("persist.radio.multisim.config", "dsds");
            OverrideProperty("persist.vendor.radio.uicc_se_enabled", "true");
            break;
        default:
            OverrideProperty("persist.radio.multisim.config", "dsds");
    }
}
