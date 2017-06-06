# Triplet files

Triplet is a standard term used in cross compiling as a way to completely capture the target environment (cpu, os, compiler, runtime, etc) in a single convenient name.

In Vcpkg, we use triplets to describe self-consistent builds of library sets. This means every library will be built using the same target cpu, OS, and compiler toolchain, but also CRT linkage and preferred library type.

We currently provide many triplets by default (see `vcpkg help triplet`). However, you can easily add your own by creating a new file in the `triplets\` directory. The new file will immediately be available for use, such as `vcpkg install boost:x86-windows-custom`.

## Variables
### VCPKG_TARGET_ARCHITECTURE
Specifies the target machine architecture.

Valid options are `x86`, `x64`, and `arm`.

### VCPKG_CRT_LINKAGE
Specifies the desired MSVCRT linkage.

Valid options are `dynamic` and `static`.

### VCPKG_LIBRARY_LINKAGE
Specifies the preferred library linkage.

Valid options are `dynamic` and `static`. Note that libraries can ignore this setting if they do not support the preferred linkage type.

### VCPKG_CMAKE_SYSTEM_NAME
Specifies the target platform.

Valid options are `WindowsStore` or empty. Empty corresponds to Windows Desktop and `WindowsStore` corresponds to UWP.
When setting this variable to `WindowsStore`, you must also set `VCPKG_CMAKE_SYSTEM_VERSION` to `10.0`.

### VCPKG_PLATFORM_TOOLSET
Specifies the C/C++ compiler toolchain to use.

This can be set to `v141`, `v140`, or left blank. If left blank, we select the latest compiler toolset available on your machine.

## Additional Remarks
The default triplet when running `vcpkg install` is `%VCPKG_DEFAULT_TRIPLET%` or `x86-windows` if that environment variable is undefined.

We recommend using a systematic naming scheme when creating new triplets. The Android toolchain naming scheme is a good source of inspiration: https://developer.android.com/ndk/guides/standalone_toolchain.html.
