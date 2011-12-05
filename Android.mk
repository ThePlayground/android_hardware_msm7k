#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LIBRPC := librpc
ifeq ($(BOARD_USES_QCOM_LIBRPC),true)
    LIBRPC := librpc-qcom
endif

# common_msm_dirs := liblights $(LIBRPC) libstagefrighthw
# msm7k_dirs := $(common_msm_dirs) boot libaudio libcopybit dspcrashd
# qsd8k_dirs := $(common_msm_dirs) libaudio-qsd8k dspcrashd libcopybit
# msm7x30_dirs := $(common_msm_dirs) libaudio-msm7x30 liboverlay libcopybit libsensors

common_msm_dirs := libcopybit liblights libopencorehw $(LIBRPC) libstagefrighthw
msm7k_dirs := $(common_msm_dirs) boot libgralloc libaudio
qsd8k_dirs := $(common_msm_dirs) libgralloc-qsd8k libaudio-qsd8k dspcrashd
msm7x30_dirs := liblights libgralloc-qsd8k $(LIBRPC) libaudio-msm7x30

#For Dragon Board APQ8060, ALSA ADUIO is used for WOLFSON CODEC
ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)
  msm8660_dirs := $(common_msm_dirs) dspcrashd
else
  msm8660_dirs := $(common_msm_dirs) libaudio-msm8660 dspcrashd
endif
msm7x27a_dirs := $(common_msm_dirs) boot libaudio-msm7x27a dspcrashd
msm8960_dirs := $(common_msm_dirs) dspcrashd

ifeq ($(TARGET_BOARD_PLATFORM),msm7x30)
  include $(call all-named-subdir-makefiles,$(msm7x30_dirs))
else
  ifeq ($(TARGET_BOARD_PLATFORM),msm7627a)
    include $(call all-named-subdir-makefiles,$(msm7x27a_dirs))
  else
    ifeq ($(TARGET_BOARD_PLATFORM),msm7k)
      include $(call all-named-subdir-makefiles,$(msm7k_dirs))
    else
      ifeq ($(TARGET_BOARD_PLATFORM),qsd8k)
        include $(call all-named-subdir-makefiles,$(qsd8k_dirs))
      else
        ifeq ($(TARGET_BOARD_PLATFORM),msm8660)
          include $(call all-named-subdir-makefiles,$(msm8660_dirs))
        else
          ifeq ($(TARGET_BOARD_PLATFORM),msm8960)
             include $(call all-named-subdir-makefiles,$(msm8960_dirs))
          endif
        endif
      endif
    endif
  endif
endif
