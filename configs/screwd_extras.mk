# Copyright (C) 2014 ParanoidAndroid Project
# Copyright (C) 2015 Screw'd AOSP
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

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable multithreaded dexopt by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dalvik.multithread=false
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
endif
# Extra packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    LockClock \
    OmniSwitch \
    KernelAdiutor \
    WallpaperPicker

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

# V4A files
PRODUCT_COPY_FILES += \
    vendor/screwd/proprietary/V4A/etc/audio_effects.conf:system/etc/audio_effects.conf \
    vendor/screwd/proprietary/V4A/etc/audio_policy.conf:system/etc/audio_policy.conf \
    vendor/screwd/proprietary/V4A/lib/soundfx/libaudiopreprocessing.so:system/lib/soundfx/libaudiopreprocessing.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libbundlewrapper.so:system/lib/soundfx/libbundlewrapper.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libdownmix.so:system/lib/soundfx/libdownmix.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libeffectproxy.so:system/lib/soundfx/libeffectproxy.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libfmas.so:system/lib/soundfx/libfmas.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libldnhncr.so:system/lib/soundfx/libldnhncr.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libqcomvoiceprocessing.so:system/lib/soundfx/libqcomvoiceprocessing.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libreverbwrapper.so:system/lib/soundfx/libreverbwrapper.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libv4a_fx_ics.so:system/lib/soundfx/libv4a_fx_ics.so \
    vendor/screwd/proprietary/V4A/lib/soundfx/libvisualizer.so:system/lib/soundfx/libvisualizer.so \
    vendor/screwd/proprietary/V4A/priv-app/ViPER4Android/ViPER4Android.apk:system/priv-app/ViPER4Android/ViPER4Android.apk \
    vendor/screwd/proprietary/V4A/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf
    
 # V4A build.prop
 PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false \
    lpa.releaselock=false \
    lpa.use-stagefright=false \
    tunnel.decode=false   
    

