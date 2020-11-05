#!/bin/bash
#
# Copyright (C) 2017 The LineageOS Project
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

function blob_fixup() {
    case "${1}" in
    vendor/lib/libmmcamera_chiron_imx386_semco_eeprom.so)
        sed -i 's|/data/misc/camera/camera_lsc_caldata.txt|/data/vendor/camera/camera_lsc_calib.txt|g' "${2}"
        ;;
    vendor/lib64/com.fingerprints.extension@1.0.so)
        "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
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
