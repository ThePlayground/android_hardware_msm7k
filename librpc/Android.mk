RPC_HW_ROOT := $(call my-dir)

ifeq ($(BOARD_USES_QCOM_LIBRPC),true)
    include $(RPC_HW_ROOT)/qcom/Android.mk
else
    include $(RPC_HW_ROOT)/msm7k/Android.mk
endif