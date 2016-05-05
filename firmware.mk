#
# Copyright (C) 2016 The Android-x86 Open Source Project
#
# Licensed under the GNU General Public License Version 2 or later.
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.gnu.org/licenses/gpl.html
#

LOCAL_FIRMWARES_DIR ?= $(LOCAL_PATH)
LOCAL_FIRMWARES ?= $(filter-out .git/% %.mk,$(subst ./,,$(shell cd $(LOCAL_FIRMWARES_DIR) && find . -type f)))

PRODUCT_COPY_FILES := \
    $(foreach f,$(LOCAL_FIRMWARES),$(LOCAL_FIRMWARES_DIR)/$(f):system/lib/firmware/$(f))
