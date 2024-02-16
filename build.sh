#!/bin/bash

set -e

# Initialize repo with specified manifest
 repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --no-patch -- "rm -rf .repo/local_manifests && \
# Initialize repo with specified manifest
repo init -u https://github.com/BlissRoms/platform_manifest.git -b universe --git-lfs ;\

# Clone taimen specific repos
git clone https://github.com/nitin1438/android_device_google_taimen -b universe device/google/taimen ;\
git clone https://github.com/nitin1438/android_vendor_google_taimen -b universe vendor/google/taimen ;\
git clone https://github.com/nitin1438/android_device_google_wahoo -b universe device/google/wahoo ;\
git clone https://github.com/nitin1438/android_kernel_google_wahoo -b universe kernel/google/wahoo ;\
git clone https://gitlab.com/asriadirahim/vendor_firmware -b udc vendor/firmware ;\
git clone https://gitlab.com/asriadirahim/packages_apps_googlecamera -b thirteen packages/apps/GoogleCamera ;\
git clone https://github.com/LineageOS/android_packages_apps_ElmyraService -b lineage-21.0 packages/apps/ElmyraService ;\

# Removals
# rm -rf system/libhidl prebuilts/clang/host/linux-x86 prebuilt/*/webview.apk platform/external/python/pyfakefs platform/external/python/bumble external/chromium-webview/prebuilt/x86_64 platform/external/opencensus-java && \

# Sync the repositories
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags && \ 

# bash patches/apply-patches.sh . && \

# Set up build environment
# cd device/phh/treble
# bash generate.sh matrixx && \

# source build/envsetup.sh && \

# Lunch configuration
# lunch treble_arm64_bgN-userdebug ;\
