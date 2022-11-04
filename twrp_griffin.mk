#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from griffin_docomo device
$(call inherit-product, device/sony/griffin/device.mk)

# Inherit some common twrp stuff.
$(call inherit-product-if-exists, vendor/twrp/config/gsm.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := griffin
PRODUCT_NAME := twrp_griffin
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia 1
PRODUCT_MANUFACTURER := Sony
