#-------------------------------------------------------------------------------
# Copyright (c) 2020-2021, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------


set(TFM_CRYPTO_TEST_ALG_CFB             OFF         CACHE BOOL      "Test CFB cryptography mode")

if (NOT FORWARD_PROT_MSG)
    set(CRYPTO_HW_ACCELERATOR               ON          CACHE BOOL      "Whether to enable the crypto hardware accelerator on supported platforms")
    set(CRYPTO_NV_SEED                      OFF         CACHE BOOL      "Use stored NV seed to provide entropy")
    set(MCUBOOT_DATA_SHARING                ON         CACHE BOOL      "Add sharing of application specific data using the same shared data area as for the measured boot")
    set(TFM_PARTITION_FIRMWARE_UPDATE       ON         CACHE BOOL      "Enable firmware update partition")
    set(BL0 OFF)
else()
    set(MCUBOOT_IMAGE_NUMBER                1           CACHE STRING    "Whether to combine S and NS into either 1 image, or sign each seperately")
    set(MCUBOOT_MEASURED_BOOT               OFF         CACHE BOOL      "Add boot measurement values to boot status. Used for initial attestation token")
    set(TFM_PARTITION_PROTECTED_STORAGE     OFF         CACHE BOOL      "Enable Protected Storage partition")
    set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE OFF      CACHE BOOL      "Enable Internal Trusted Storage partition")
    set(TFM_PARTITION_CRYPTO                OFF         CACHE BOOL      "Enable Crypto partition")
    set(TFM_PARTITION_INITIAL_ATTESTATION   OFF         CACHE BOOL      "Enable Initial Attestation partition")
    set(TFM_PARTITION_PLATFORM              OFF         CACHE BOOL      "Enable Platform partition")
    set(TFM_PARTITION_PSA_PROXY             ON          CACHE BOOL      "Enable PSA Proxy partition")
    # In case of forwarding, there is no CRYPTO partition compiled,
    # thus no need for crypto hw accelerator.
    set(CRYPTO_HW_ACCELERATOR               OFF         CACHE BOOL      "Whether to enable the crypto hardware accelerator on supported platforms")
    set(PS_TEST_NV_COUNTERS                 OFF         CACHE BOOL      "Use the test NV counters to test Protected Storage rollback scenarios")
    set(BL0 ON)

    set(TFM_MANIFEST_LIST                   ${CMAKE_SOURCE_DIR}/platform/ext/target/${TFM_PLATFORM}/manifest_list_with_se.yaml CACHE FILEPATH "Manifest Lists")
endif()

set(TFM_EXTRA_GENERATED_FILE_LIST_PATH  ${CMAKE_SOURCE_DIR}/platform/ext/target/arm/musca_b1/generated_file_list.yaml  CACHE PATH "Path to extra generated file list. Appended to stardard TFM generated file list." FORCE)

set(PSA_API_TEST_TARGET                 "musca_b1"   CACHE STRING    "Target to use when building the PSA API tests")

if(NOT TFM_LIB_MODEL)
    if (TEST_NS_FLIH_IRQ)
        message(FATAL_ERROR "FLIH testing has not been supported!")
    endif()

    if (TEST_NS)
        set(TEST_NS_SLIH_IRQ      ON           CACHE BOOL      "Enable SLIH testing")
    endif()
endif()
