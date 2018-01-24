
LOCAL_PATH:= $(call my-dir)

# first lib, which will be built statically
#

include $(CLEAR_VARS)
LOCAL_MODULE    := first
LOCAL_SRC_FILES := libfirst.so
include $(PREBUILT_SHARED_LIBRARY)

# second lib, which will depend on and include the first one
#
include $(CLEAR_VARS)
LOCAL_MODULE    := second
LOCAL_SRC_FILES := second.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_LDFLAGS := -Wl,--hash-style=sysv
libsysv-hash-table-library_ldflags := Wl,-hash-style=sysv
LOCAL_SHARED_LIBRARIES := first
LOCAL_LDFLAGS += -L.
include $(BUILD_SHARED_LIBRARY)
