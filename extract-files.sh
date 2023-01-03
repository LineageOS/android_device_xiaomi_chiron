#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libmmcamera_chiron_imx386_semco_eeprom.so)
            sed -i 's|/data/misc/camera/camera_lsc_caldata.txt|/data/vendor/camera/camera_lsc_calib.txt|g' "${2}"
            ;;
        vendor/lib64/com.fingerprints.extension@1.0.so)
            "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
            ;;
        vendor/lib64/libgf_hal.so)
            "${PATCHELF}" --remove-needed "libpowermanager.so" "${2}"
            ;;
        vendor/lib64/libultrasound.so)
            "${PATCHELF}" --remove-needed "libmedia.so" "${2}"
            ;;
        vendor/lib64/sensors.elliptic.so)
            sed -i "s|/etc/elliptic_sensor.xml|/vendor/etc/elliptic.xml|g" "${2}"
            "${PATCHELF}" --remove-needed "libandroid.so" "${2}"
            ;;
        vendor/lib64/vendor.goodix.hardware.fingerprintextension@1.0.so)
            "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=chiron
export DEVICE_COMMON=msm8998-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
