#-------------------------------------------------------------------------------
# Copyright (c) 2020-2021, Arm Limited. All rights reserved.
# Copyright (c) 2021 STMicroelectronics. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

########################## BL2 #################################################

set(MCUBOOT_IMAGE_NUMBER                2           CACHE STRING    "Whether to combine S and NS into either 1 image, or sign each seperately")
set(MCUBOOT_ALIGN_VAL                   16          CACHE STRING    "align option to build image with imgtool")
set(MCUBOOT_UPGRADE_STRATEGY            "SWAP"      CACHE STRING    "Upgrade strategy for images")
set(TFM_PARTITION_FIRMWARE_UPDATE       ON          CACHE BOOL      "Enable firmware update partition")
set(MCUBOOT_DATA_SHARING                ON          CACHE BOOL      "Enable Data Sharing")
################################## Dependencies ################################
set(CRYPTO_HW_ACCELERATOR               ON          CACHE BOOL      "Whether to enable the crypto hardware accelerator on supported platforms")
set(CRYPTO_NV_SEED                      OFF         CACHE BOOL      "Use stored NV seed to provide entropy")
set(MBEDCRYPTO_BUILD_TYPE               minsizerel  CACHE STRING "Build type of Mbed Crypto library")
