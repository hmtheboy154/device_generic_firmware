#
# Copyright (C) 2016 The Android-x86 Open Source Project
#
# Licensed under the GNU General Public License Version 2 or later.
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.gnu.org/licenses/gpl.html
#

LOCAL_PATH := $(my-dir)

SYMLINKS := $(subst $(LOCAL_PATH),$(TARGET_OUT)/lib/firmware,$(filter-out $(LOCAL_PATH)/.git/%,$(shell find $(LOCAL_PATH) -type l)))

$(SYMLINKS): FW_PATH := $(LOCAL_PATH)
$(SYMLINKS):
	@link_to=`readlink $(subst $(TARGET_OUT)/lib/firmware,$(FW_PATH),$@)`; \
	echo "Symlink: $@ -> $$link_to"; \
	mkdir -p $(@D); ln -sf $$link_to $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)
