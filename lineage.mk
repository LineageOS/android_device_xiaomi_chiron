$(call inherit-product, device/xiaomi/chiron/full_chiron.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_chiron
PRODUCT_DEVICE := chiron
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi MIX 2
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Xiaomi/chiron/chiron:7.1.1/NMF26X/V9.2.3.0.NDEMIEK:user/release-keys \
    PRIVATE_BUILD_DESC="chiron-user 7.1.1 NMF26X V9.2.3.0.NDEMIEK release-keys"
