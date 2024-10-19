#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import extract_utils.tools

extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_17_2'

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

namespace_imports = [
    'hardware/xiaomi',
    'vendor/xiaomi/msm8998-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib/libmmcamera_chiron_imx386_semco_eeprom.so': blob_fixup()
        .binary_regex_replace(b'/data/misc/camera/camera_lsc_caldata.txt', b'/data/vendor/camera/camera_lsc_calib.txt'),
    'vendor/lib64/libgf_hal.so': blob_fixup()
        .remove_needed('libpowermanager.so'),
    'vendor/lib64/sensors.elliptic.so': blob_fixup()
        .binary_regex_replace(b'/etc/elliptic_sensor.xml', b'/vendor/etc/elliptic.xml')
        .remove_needed('libandroid.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'chiron',
    'xiaomi',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'msm8998-common', module.vendor
    )
    utils.run()
