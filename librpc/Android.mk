QCOM_RPC_ROOT := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),msm8660)
    include $(QCOM_RPC_ROOT)/8x60/Android.mk
else
    include $(QCOM_RPC_ROOT)/qcom/Android.mk
endif