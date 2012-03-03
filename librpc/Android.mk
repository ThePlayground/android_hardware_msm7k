RPC_HW_ROOT := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),msm8660)
    include $(RPC_HW_ROOT)/8x60/Android.mk
else
    include $(RPC_HW_ROOT)/qcom/Android.mk
endif