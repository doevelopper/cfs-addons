#  CMakeLists.txt
#  
#         Copyright (C) 2018, General Electric.
#         All rights reserved.
#  
#  Permission is hereby granted, free of charge, to any person obtaining
#  a copy of this software and associated documentation files (the
#  "Software"), to deal in the Software without restriction, including
#  without limitation the rights to use, copy, modify, merge, publish,
#  distribute, sublicense, and/or sell copies of the Software, and to
#  permit persons to whom the Software is furnished to do so, subject to
#  the following conditions:
#  
#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.
#  
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#CC=ccpentium.exe CXX=g++pentium.exe cmake -G "Unix Makefiles" ..

include(CMakeParseArguments)
include(CheckCCompilerFlag)
include(CheckCXXCompilerFlag)

set(CROSS_COMPILER_HOME "E:/gxp-gitswarm-gxp.cloud.health.ge.com/rtac-sdk/rtac-sdk-1.1.2-workbench/gnu/4.1.2-vxworks-6.8/86-win32/bin")
set(WIND_BASE_TOOLCHAIN_ROOT "E:/gxp-gitswarm-gxp.cloud.health.ge.com/rtac-sdk/rtac-sdk-1.1.2-workbench/gnu/4.1.2-vxworks-6.8/x86-win32/bin")
# specify the cross compiler
if(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")

    set(CMAKE_C_COMPILER "${CROSS_COMPILER_HOME}/ccpentium.exe")
    set(CMAKE_CXX_COMPILER "${CROSS_COMPILER_HOME}/c++pentium.exe")
    set(VX_HEADERS "E:/gxp-gitswarm-gxp.cloud.health.ge.com/rtac-sdk/rtac-sdk-1.1.2-workbench/vxworks-6.8/target/h")

else()

    message(FATAL_ERROR Unsupported build platform.)

endif()


# compiler/linker flags
set(CMAKE_C_FLAGS
    "--std=gnu99 -Werror=implicit-function-declaration -fno-feature-proxy -O2 -fno-defer-pop -nostdlib -fno-builtin -mno-sse -mno-sse2 -mtune=pentium -march=pentium -ansi -Wall -MD -MP \
    -Wno-strict-aliasing \
    -DCPU=PENTIUM4 -DTOOL_FAMILY=gnu -DTOOL=gnu -D_WRS_KERNEL \
    -I${VX_HEADERS} -I${VX_HEADERS}/wrn/coreip -I${VX_HEADERS}/wrn/coreip/sys"
    CACHE STRING "The compiler flags for compiling C sources" FORCE
)
set(CMAKE_SHARED_LINKER_FLAGS
    "-nostdlib -r -pipe -Wl,-X -T ${VX_HEADERS}/tool/gnu/ldscripts/link.OUT"
    CACHE STRING "Additional compiler flags for building shared libraries" FORCE
)
set(CMAKE_EXE_LINKER_FLAGS
    "-fno-feature-proxy -r -pipe -Wl,-X -T ${VX_HEADERS}/tool/gnu/ldscripts/link.OUT"
    CACHE STRING "Linker flags to be used to create executables" FORCE
)

set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> ${CMAKE_C_FLAGS} -o <OBJECT> -c <SOURCE>")
set(CMAKE_C_CREATE_SHARED_LIBRARY "<CMAKE_C_COMPILER> <LINK_FLAGS> -o <TARGET> <OBJECTS>")
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <LINK_FLAGS> <OBJECTS> -o <TARGET>")

# set(CMAKE_GENERATOR "Eclipse CDT4 - Unix Makefiles" CACHE INTERNAL "" FORCE)
set(CMAKE_LINKER       ${WIND_BASE_TOOLCHAIN_ROOT}/ldpentium        CACHE FILEPATH "VxWorks linker")
set(CMAKE_ASM_COMPILER ${WIND_BASE_TOOLCHAIN_ROOT}/aspentium        CACHE FILEPATH "VxWorks assembler")
set(CMAKE_OBJCOPY      ${WIND_BASE_TOOLCHAIN_ROOT}/objcopypentium   CACHE FILEPATH "VxWorks objcopy: copy and translate object files.")
set(CMAKE_STRIP        ${WIND_BASE_TOOLCHAIN_ROOT}/strippentium     CACHE FILEPATH "VxWorks strip")
set(CMAKE_CPP          ${WIND_BASE_TOOLCHAIN_ROOT}/cpppentium       CACHE FILEPATH "VxWorks cpp")
set(CMAKE_AR           ${WIND_BASE_TOOLCHAIN_ROOT}/arpentium        CACHE FILEPATH "VxWorks archive: create, modify, and extract from archives.")
set(CMAKE_NM           ${WIND_BASE_TOOLCHAIN_ROOT}/nmpentium        CACHE FILEPATH "VxWorks nm: list symbols from object files.")
set(CMAKE_OBJDUMP      ${WIND_BASE_TOOLCHAIN_ROOT}/objdumppentium   CACHE FILEPATH "VxWorks objdump: display information from object files.")
set(CMAKE_RANLIB       ${WIND_BASE_TOOLCHAIN_ROOT}/ranlibpentium    CACHE FILEPATH "VxWorks ranlib:  generate index to archive.")
set(CMAKE_READELF      ${WIND_BASE_TOOLCHAIN_ROOT}/readelfpentium   CACHE FILEPATH "VxWorks readelf:  Displays information about ELF files.")
set(CMAKE_SIZE         ${WIND_BASE_TOOLCHAIN_ROOT}/sizepentium      CACHE FILEPATH "VxWorks size: List Section Size and Toal Size.") 
set(CMAKE_addr2line    ${WIND_BASE_TOOLCHAIN_ROOT}/addr2linepentium CACHE FILEPATH "VxWorks addr2line: Convert Address to Filename and Numbers")
set(CMAKE_c++filt      ${WIND_BASE_TOOLCHAIN_ROOT}/c++filtpentium   CACHE FILEPATH "VxWorks c++filt: Demangle Command")
set(CMAKE_strings      ${WIND_BASE_TOOLCHAIN_ROOT}/stringspentium   CACHE FILEPATH "VxWorks strings: Display Printable Characters from a File") 
SET(CMAKE_C_COMPILER   ${WIND_BASE_TOOLCHAIN_ROOT}/ccpentium.exe    CACHE FILEPATH "VxWorks gcc")
SET(CMAKE_CXX_COMPILER ${WIND_BASE_TOOLCHAIN_ROOT}/c++pentium.exe   CACHE FILEPATH "VxWorks g++")


set(CMAKE_EXE_LINKER_FLAGS    "${CMAKE_EXE_LINKER_FLAGS}    ${CROSS_LINK_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CROSS_LINK_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${CROSS_LINK_FLAGS}" CACHE STRING "" FORCE)


SET(CMAKE_FIND_ROOT_PATH ${VXOS_TARGET})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
