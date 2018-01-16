$(call inherit-product, device/xiaomi/chiron/full_chiron.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := lineage_chiron
PRODUCT_DEVICE := chiron
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi MIX 2
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
