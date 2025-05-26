#!/bin/bash
set -x 
NVIDIA_VENDOR_ID="10de"
NVIDIA_A100_DEVICE_ID="20b2"
NVIDIA_A100_NVS_DEVICE_ID="1af1"
NVIDIA_H100_DEVICE_ID="2330"
NVIDIA_H100_NVS_DEVICE_ID="22a3"
NUM_NVIDIA_A100_DEVICE=$(lspci -d ${NVIDIA_VENDOR_ID}:${NVIDIA_A100_DEVICE_ID} | wc -l)
NUM_NVIDIA_A100_NVS_DEVICE=$(lspci -d ${NVIDIA_VENDOR_ID}:${NVIDIA_A100_NVS_DEVICE_ID} | wc -l)
NUM_NVIDIA_H100_DEVICE=$(lspci -d ${NVIDIA_VENDOR_ID}:${NVIDIA_H100_DEVICE_ID} | wc -l)
NUM_NVIDIA_H100_NVS_DEVICE=$(lspci -d ${NVIDIA_VENDOR_ID}:${NVIDIA_H100_NVS_DEVICE_ID} | wc -l)
NVLINK_DISABLE_CONF="/etc/modprobe.d/disable-nvlink.conf"

if [[ ${NUM_NVIDIA_H100_NVS_DEVICE} > 0 ]];then
   if [ -f "${NVLINK_DISABLE_CONF}" ]; then
       rm -f "${NVLINK_DISABLE_CONF}"
       update-initramfs -u
   else
       echo "${NVLINK_DISABLE_CONF} does not exist"
   fi
elif [[ ${NUM_NVIDIA_H100_DEVICE} > 0 ]];then
    echo "options nvidia NVreg_NvLinkDisable=1" > "${NVLINK_DISABLE_CONF}"
    update-initramfs -u
elif [[ ${NUM_NVIDIA_A100_DEVICE} > 0 ]];then
echo    nvidia-smi -mig 0
else
    echo "There is no action"
fi
