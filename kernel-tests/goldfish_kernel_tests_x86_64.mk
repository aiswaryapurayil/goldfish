PRODUCT_NAME := goldfish_kernel_tests_x86_64
PRODUCT_DEVICE := generic_x86_64
PRODUCT_BRAND := Android
PRODUCT_MODEL := Kernel tests for goldfish kernel
PRODUCT_FULL_TREBLE_OVERRIDE := true

BUILD_EMULATOR := false

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_HAVE_BLUETOOTH := false

THIS_DIR := device/generic/goldfish/kernel-tests

# android.hardware.
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.drm@1.1-service.clearkey \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \

# android.hidl.
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0-service \
    android.hidl.base-V1.0-java \
    android.hidl.manager-V1.0-java \
    android.hidl.memory@1.0-impl \
    android.hidl.memory@1.0-impl.vendor \

# libXYZ
PRODUCT_PACKAGES += \
    libc.bootstrap \
    libdl.bootstrap \
    libm.bootstrap \
    libc \
    libstdc++ \
    libm \
    libdl \
    libutils \
    libsysutils \
    libbinder \
    libhardware \
    libhardware_legacy \
    linker \
    linker64 \

# logs
PRODUCT_PACKAGES += \
    liblog \
    logd \
    logcat \
    logwrapper \

# debugger
PRODUCT_PACKAGES += \
    debuggerd \
    debuggerd64 \
    dumpstate \
    dumpsys \
    crash_dump \
    adbd \

PRODUCT_HOST_PACKAGES += \
    adb \

# QEMU
PRODUCT_PACKAGES += \
    qemu-props \

# Graphics
PRODUCT_PACKAGES += \

# Device modules
PRODUCT_PACKAGES += \
    android.system.suspend@1.0-service \
    ashmemd \
    libashmemd_client \
    keymaster@3.0-impl \
    gralloc.goldfish \
    gralloc.goldfish.default \
    gralloc.ranchu \
    servicemanager \
    hwservicemanager \
    vndservice \
    vndservicemanager \
    toolbox \
    toybox \
    vold \
    init \
    init.environ.rc \
    init.rc \
    reboot \
    service \
    cmd \
    sh \
    su \
    e2fsck \
    gzip \

PRODUCT_HOST_PACKAGES += \
    e2fsck \
    mke2fs \

# SELinux
PRODUCT_PACKAGES += \
    sepolicy \
    selinux_policy_system \
    selinux_policy \
    file_contexts \
    seapp_contexts \
    property_contexts \
    mac_permissions.xml \

PRODUCT_COPY_FILES += \
    $(THIS_DIR)/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml \
    $(THIS_DIR)/init.ranchu-core.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.ranchu-core.sh \
    $(THIS_DIR)/init.ranchu.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.ranchu.rc \
    $(THIS_DIR)/fstab.ranchu:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.ranchu \
    $(THIS_DIR)/config.ini:config.ini \
    device/generic/goldfish/data/etc/encryptionkey.img:encryptionkey.img \
    development/sys-img/advancedFeatures.ini:advancedFeatures.ini \
    prebuilts/qemu-kernel/x86_64/4.14/kernel-qemu2:kernel-ranchu \

# The set of packages we want to force 'speed' compilation on.
PRODUCT_DEXPREOPT_SPEED_APPS := \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.zygote=zygote32

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown