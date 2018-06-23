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

set -e

export DEVICE=chiron
export DEVICE_COMMON=msm8998-common
export VENDOR=xiaomi

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh $@

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

DEVICE_BLOB_ROOT="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

#
# Load elliptic config from vendor
#
ELLIPTIC_SENSOR_MODULE="$DEVICE_BLOB_ROOT"/vendor/lib64/sensors.elliptic.so
sed -i "s|/etc/elliptic_sensor.xml|/vendor/etc/elliptic.xml|g" "$ELLIPTIC_SENSOR_MODULE"
