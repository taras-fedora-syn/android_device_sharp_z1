LOCAL_PATH := device/sharp/sharp_z2

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Configure jemalloc for low memory
MALLOC_SVELTE := true

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := Sharp Z2,Sharp A1,FS8200

# Audio policy & codec
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/audio/audio_device.xml:system/etc/audio_device.xml \
	$(LOCAL_PATH)/audio/audio_em.xml:system/etc/audio_em.xml \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media/media_codecs_c2.xml:system/etc/media_codecs_c2.xml \
	$(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	$(LOCAL_PATH)/media/media_profiles_V1_0.xml:system/etc/media_profiles_V1_0.xml \
	$(LOCAL_PATH)/media/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
	$(LOCAL_PATH)/media/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
	$(LOCAL_PATH)/media/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	$(LOCAL_PATH)/media/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# MTK Helpers
PRODUCT_PACKAGES += \
	libccci_util \
	libgralloc_extra \
	libgui_ext \
	libion \
	lights.mt6797 \
	libui_ext \
	libmtk_symbols

# GPS
PRODUCT_PACKAGES += \
	gps.mt6797 \
	libcurl \
	YGPS

# Extra packages
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio_policy.default \
	audio.r_submix.default \
	audio.usb.default \
	libaudio-resampler \
	libemoji \
	com.android.future.usb.accessory \
	libnl_2 \
	libtinyalsa \
	libtinycompress \
	libtinymix \
	libtinyxml

PRODUCT_TAGS += dalvik.gc.type-precise

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
	$(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/rootdir/fstab.mt6797:root/fstab.mt6797 \
	$(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/rootdir/init.mt6797.rc:root/init.mt6797.rc \
	$(LOCAL_PATH)/rootdir/init.mt6797.usb.rc:root/init.mt6797.usb.rc \
	$(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/rootdir/init.recovery.mt6797.rc:root/init.recovery.mt6797.rc \
	$(LOCAL_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
	$(LOCAL_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
	$(LOCAL_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
	$(LOCAL_PATH)/rootdir/init.volte.rc:root/init.volte.rc \
	$(LOCAL_PATH)/rootdir/init.mal.rc:root/init.mal.rc \
	$(LOCAL_PATH)/rootdir/ueventd.mt6797.rc:root/ueventd.mt6797.rc \
	$(LOCAL_PATH)/rootdir/file_contexts:root/file_contexts \
	$(LOCAL_PATH)/rootdir/service_contexts:root/service_contexts \
	$(LOCAL_PATH)/rootdir/property_contexts:root/property_contexts \
	$(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	ro.telephony.ril_class=MediaTekRIL \
	ro.telephony.ril.config=fakeiccid \
	ro.com.android.mobiledata=false
	
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)

# WiFi
PRODUCT_PACKAGES += \
	lib_driver_cmd_mt66xx \
	hostapd \
	libwpa_client \
	wpa_supplicant

# Default.prop
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	security.perf_harden=1 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.service.acm.enable=0 \
	ro.mount.fs=EXT4 \
	camera.disable_zsl_mode=1 \
	persist.sys.usb.config=adb

# build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true

# extra log controls prop
PRODUCT_PROPERTY_OVERRIDES += \
	persist.ril.log=0 \
	ro.disable.xlog=0
    
# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
   $(LOCAL_KERNEL):kernel

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml
	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# TWRP
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Device product elements
include $(LOCAL_PATH)/product/*.mk

# Fingerprint
PRODUCT_PACKAGES += \
	fingerprintd

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Vulkan
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

PRODUCT_PACKAGES += \
	fs_config_files

# Power
PRODUCT_PACKAGES += \
	power.default \
	power.mt6797

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	fibmap.f2fs \
	fsck.f2fs \
	mkfs.f2fs \
	make_ext4fs \
	resize2fs \
	setup_fs \
	ext4_resize \
	libext2_blkid \
	libext2_uuid_static \
	superumount

# exFAT
PRODUCT_PACKAGES += \
	mount.exfat \
	fsck.exfat \
	mkfs.exfat
	
# NTFS
PRODUCT_PACKAGES += \
	fsck.ntfs \
	mkfs.ntfs \
	mount.ntfs
	
# Thermal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/thermal/.ht120.mtc:system/etc/.tp/.ht120.mtc \
	$(LOCAL_PATH)/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
	$(LOCAL_PATH)/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf \
	$(LOCAL_PATH)/configs/thermal/.thermal_policy_00:system/.tp/.thermal_policy_00 \
	$(LOCAL_PATH)/configs/thermal/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 \
	$(LOCAL_PATH)/configs/thermal/.thermal_policy_02:system/etc/.tp/.thermal_policy_02 \
	$(LOCAL_PATH)/configs/thermal/.thermal_policy_03:system/etc/.tp/.thermal_policy_03

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-hwui-memory.mk)

TARGET_HAS_FOD := true

# Common stuff
$(call inherit-product, vendor/sharp/sharp_z2/config/common.mk)

# Vendor
$(call inherit-product, vendor/sharp/sharp_z2/sharp_z2-vendor.mk)
