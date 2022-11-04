#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/sony/griffin

# define hardware platform
PRODUCT_PLATFORM := msmnile
PRODUCT_RELEASE_NAME := griffin

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Include GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Encryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl-wrapper.recovery \
    android.hardware.boot@1.0-impl-wrapper \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery

PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

PRODUCT_HOST_PACKAGES += \
    libandroidicu

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Apex libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Api
PRODUCT_SHIPPING_API_LEVEL := 28

PRODUCT_PROPERTY_OVERRIDES += \
    fbe.data.wrappedkey=true
