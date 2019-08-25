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
#E:\WindRiver\vx7_i86_CLEAN\compilers\gnu-4.8.1.0\x86-win32\bin
#E:\WindRiver\vx7_i86_CLEAN\compilers\gnu-4.8.1.2\x86-win32\bin
#E:\WindRiver\vx7_i86_CLEAN\compilers\gnu-4.3.3.1\x86-win32\bin

include(CMakeParseArguments)
include(CheckCCompilerFlag)
include(CheckCXXCompilerFlag)

set( CMAKE_ECLIPSE_VERSION "4.6.3" CACHE STRING "WRS Eclipse Version" FORCE)
SET (CMAKE_C_COMPILER_WORKS 1)
SET (CMAKE_CXX_COMPILER_WORKS 1)
# if(DEFINED ENV{WIND_HOME})
    # message (STATUS "Using $ENV{WIND_HOME}")
    # set(WIND_HOME "$ENV{WIND_HOME}")
    # set(WIND_BASE "$ENV{WIND_BASE}/$ENV{WIND_PLATFORM}")
    # set(CMAKE_SYSTEM_NAME "$ENV{WIND_PLATFORM}")
    # set(CMAKE_SYSTEM_VERSION 7.0.1)
    # set(CMAKE_SYSTEM_PROCESSOR pentium )
    # set(CMAKE_SYSTEM_NAME "$ENV{WIND_HOST_TYPE}" )
    # set(WIND_BASE_TOOLCHAIN_ROOT "$ENV{WIND_GNU_PATH}/$ENV{WIND_HOST_TYPE}/bin")
#    set(WIND_BASE_TOOLCHAIN_ROOT "E:/WindRiver/vx7_i86_CLEAN/compilers/gnu-4.8.1.0/x86-win32/bin")
# else()
    # message(STATUS "WRS root directory not set. Will be set in the next command. Please re-run c make generator")
    # set(WRS_ABS_PATH "E:/WindRiver/vx7_i86_CLEAN")
    # if(WIN32)
        # exec_program("$ENV{COMSPEC}" 
            # ARGS "/k" "${WRS_ABS_PATH}/wrenv.exe" "-p"  "vxworks-7"
        # )
    # endif(WIN32)

    # if (UNIX)
        ## do something
    # endif (UNIX)

# endif()

file(TO_CMAKE_PATH "$ENV{PRJ_ROOT_DIR}" PRJ_ROOT_DIR)
file(TO_CMAKE_PATH "$ENV{VSB_DIR}" VSB_DIR)
file(TO_CMAKE_PATH "$ENV{WIND_BUILD}" WIND_BUILD)
file(TO_CMAKE_PATH "$ENV{WIND_BUILD_TOOL}" WIND_BUILD_TOOL)
file(TO_CMAKE_PATH "$ENV{WIND_GNU_PATH}" WIND_GNU_PATH)

if("${CMAKE_HOST_SYSTEM_NAME}" MATCHES "Windows")
	set(CMAKE_HOST_EXECUTABLE_EXTENSION .exe)
else()
	set(CMAKE_HOST_EXECUTABLE_EXTENSION)
endif()
if("$ENV{_WRS_CONFIG_SECURE_LOADER_CIPHER_AES_256_CTR}" MATCHES "y")
	set(SECURE_LOADER_CIPHER_TYPE "AES-256-CTR")
elseif("$ENV{_WRS_CONFIG_SECURE_LOADER_CIPHER_AES_128_CTR}" MATCHES "y")
	set(SECURE_LOADER_CIPHER_TYPE "AES-128-CTR")
endif()
if("$ENV{_WRS_CONFIG_SECURE_LOADER_STRIP}" MATCHES "y")
	set(STRIP_SIGN_CMD "--strip=all")
endif()

set(WIND_BASE_TOOLCHAIN_ROOT "${WIND_GNU_PATH}/$ENV{WIND_HOST_TYPE}/bin")
SET(PROJECT_TYPE "DKM")
SET(DEFINES "")
SET(EXPAND_DBG "0")
SET(APICHECK_OPTIONS "-warning")
SET(ADDED_ASMFLAGS "")
SET(ADDED_CXXFLAGS "")
SET(ADDED_CFLAGS "")
SET(ADDED_FLAGS "")
SET(BUILD_ARGS "-j$(JOBS)")
SET(CMAKE_BUILD_TYPE "Release")
SET(CMAKE_GENERATOR "Eclipse CDT4 - Unix Makefiles")
SET(CMAKE_OPTIONS "")
SET(VX_CPU_FAMILY "pentium")
SET(CPU "SKYLAKE")
SET(TOOL "gnu")
SET(TOOL_FAMILY "${TOOL}")
SET(TOOL_VERSION "${TOOL}_4_8_1_8")
SET(_CC_VERSION "${TOOL}_4_8_1_10")
SET(CC_ARCH_SPEC "-fno-builtin -march=corei7 -mpopcnt -maes -mpclmul -mavx -mfsgsbase -mrdrnd -mf16c -mavx2 -mmovbe -mfma -mbmi -mbmi2 -mrdseed -madx -mprfchw -nostdlib -fno-defer-pop -fno-implicit-fp")
SET(VSB_CONFIG_FILE "$(VSB_DIR)/h/config/vsbConfig.h")
SET(LIBPATH "")
SET(LIBS "")
SET(DKM_LONGCALL "")
SET(BDGEN_VSB_INCLUDE "$(VSB_DIR)/h/config/auto.conf")
# set(CMAKE_GENERATOR "Eclipse CDT4 - Unix Makefiles" CACHE INTERNAL "" FORCE)
set(CMAKE_LINKER       ${WIND_BASE_TOOLCHAIN_ROOT}/ld${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}        CACHE FILEPATH "VxWorks linker")
set(CMAKE_ASM_COMPILER ${WIND_BASE_TOOLCHAIN_ROOT}/as${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}        CACHE FILEPATH "VxWorks assembler")
set(CMAKE_OBJCOPY      ${WIND_BASE_TOOLCHAIN_ROOT}/objcopy${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}   CACHE FILEPATH "VxWorks objcopy: copy and translate object files.")
set(CMAKE_STRIP        ${WIND_BASE_TOOLCHAIN_ROOT}/strip${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}     CACHE FILEPATH "VxWorks strip")
set(CMAKE_CPP          ${WIND_BASE_TOOLCHAIN_ROOT}/cpp${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}       CACHE FILEPATH "VxWorks cpp")
set(CMAKE_AR           ${WIND_BASE_TOOLCHAIN_ROOT}/ar${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}        CACHE FILEPATH "VxWorks archive: create, modify, and extract from archives.")
set(CMAKE_NM           ${WIND_BASE_TOOLCHAIN_ROOT}/nm${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}        CACHE FILEPATH "VxWorks nm: list symbols from object files.")
set(CMAKE_OBJDUMP      ${WIND_BASE_TOOLCHAIN_ROOT}/objdump${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}   CACHE FILEPATH "VxWorks objdump: display information from object files.")
set(CMAKE_RANLIB       ${WIND_BASE_TOOLCHAIN_ROOT}/ranlib${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}    CACHE FILEPATH "VxWorks ranlib:  generate index to archive.")
set(CMAKE_READELF      ${WIND_BASE_TOOLCHAIN_ROOT}/readelf${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}   CACHE FILEPATH "VxWorks readelf:  Displays information about ELF files.")
set(CMAKE_SIZE         ${WIND_BASE_TOOLCHAIN_ROOT}/size${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}      CACHE FILEPATH "VxWorks size: List Section Size and Toal Size.") 
set(CMAKE_addr2line    ${WIND_BASE_TOOLCHAIN_ROOT}/addr2line${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION} CACHE FILEPATH "VxWorks addr2line: Convert Address to Filename and Numbers")
set(CMAKE_c++filt      ${WIND_BASE_TOOLCHAIN_ROOT}/c++filt${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}   CACHE FILEPATH "VxWorks c++filt: Demangle Command")
set(CMAKE_strings      ${WIND_BASE_TOOLCHAIN_ROOT}/strings${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}   CACHE FILEPATH "VxWorks strings: Display Printable Characters from a File") 
SET(CMAKE_C_COMPILER   ${WIND_BASE_TOOLCHAIN_ROOT}/cc${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}    CACHE FILEPATH "VxWorks gcc")
SET(CMAKE_CXX_COMPILER ${WIND_BASE_TOOLCHAIN_ROOT}/c++${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION}   CACHE FILEPATH "VxWorks g++")
SET(CMAKE_ASM_COMPILER ${WIND_BASE_TOOLCHAIN_ROOT}/cc${VX_CPU_FAMILY}${CMAKE_HOST_EXECUTABLE_EXTENSION})

SET(CMAKE_FIND_ROOT_PATH $ENV{WIND_HOME})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(APICHECK_CMD "apicheck.sh -r \"$(VSB_DIR)/krnl/apicheck/forbidden_api.lst\" -n \"${CMAKE_NM}\" -u -s \"$<\" \"$@\" $(APICHECK_OPTIONS)")
SET(WIND_C_FLAGS "-O2 ${CC_ARCH_SPEC} -ansi -fno-zero-initialized-in-bss -Wall -MD -MP ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I$(PRJ_ROOT_DIR)/ ${DEFINES} ${ADDED_CFLAGS} ${ADDED_INCLUDES}")
SET(WIND_CXX_FLAGS "-O2 ${CC_ARCH_SPEC} -ansi -fno-zero-initialized-in-bss -Wall -MD -MP ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I$(PRJ_ROOT_DIR)/ ${DEFINES} ${ADDED_C++FLAGS} ${ADDED_INCLUDES}")
SET(WIND_ASM_FLAGS "-O2 ${CC_ARCH_SPEC} -ansi -fno-zero-initialized-in-bss -xassembler-with-cpp -MD -MP ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I$(PRJ_ROOT_DIR)/ ${DEFINES} ${ADDED_CFLAGS} ${ADDED_INCLUDES}")
SET(ASM_DIALECT)
SET(CMAKE_ASM_SOURCE_FILE_EXTENSIONS s;S;asm)
SET(CMAKE_ASM_COMPILER_FORCED TRUE)
SET(CMAKE_C_CREATE_STATIC_LIBRARY " ${CMAKE_AR} crus <TARGET> <OBJECTS> <LINK_LIBRARIES> ")
SET(CMAKE_CXX_CREATE_STATIC_LIBRARY " ${CMAKE_AR} crus <TARGET> <OBJECTS> <LINK_LIBRARIES> ")
SET(CMAKE_ASM_CREATE_STATIC_LIBRARY " ${CMAKE_AR} crus <TARGET> <OBJECTS> <LINK_LIBRARIES> ")

#set(CROSS_LINK_FLAGS "${CROSS_LINK_FLAGS} "


#set(CMAKE_EXE_LINKER_FLAGS    "${CMAKE_EXE_LINKER_FLAGS}    ${CROSS_LINK_FLAGS}" CACHE STRING "" FORCE)
#set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CROSS_LINK_FLAGS}" CACHE STRING "" FORCE)
#set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${CROSS_LINK_FLAGS}" CACHE STRING "" FORCE)

if(("${CMAKE_HOST_SYSTEM_NAME}" MATCHES "Windows"))
	if(("${CMAKE_GENERATOR}" MATCHES "Ninja"))
		if(("$ENV{_WRS_CONFIG_SECURE_LOADER}" MATCHES "y"))
			if(("$ENV{_WRS_CONFIG_SECURE_LOADER_ENCRYPTION}" MATCHES "y"))
				SET(CMAKE_C_LINK_EXECUTABLE "cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS}; cmd /C rm -f <TARGET>; cmd /C ${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c ${VX_CPU_FAMILY} -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c; cmd /C ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS}; cmd /C signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>; cmd /C signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>")
				SET(CMAKE_CXX_LINK_EXECUTABLE "cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS}; cmd /C rm -f <TARGET>; cmd /C ${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c ${VX_CPU_FAMILY} -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c; cmd /C ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS}; cmd /C signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>; cmd /C signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>")
			else()
				SET(CMAKE_C_LINK_EXECUTABLE "cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS}; cmd /C rm -f <TARGET>; cmd /C ${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c ${VX_CPU_FAMILY} -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS}; cmd /C signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>")
				SET(CMAKE_CXX_LINK_EXECUTABLE "cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS}; cmd /C rm -f <TARGET>; cmd /C ${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c ${VX_CPU_FAMILY} -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS}; cmd /C signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>")
			endif()
		else()
			SET(CMAKE_C_LINK_EXECUTABLE "cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS}; cmd /C rm -f <TARGET>; cmd /C ${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c ${VX_CPU_FAMILY} -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ")
			SET(CMAKE_CXX_LINK_EXECUTABLE "cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS}; cmd /C rm -f <TARGET>; cmd /C ${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c ${VX_CPU_FAMILY} -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c ; cmd /C ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ")
		endif()
	else()
		if(("$ENV{_WRS_CONFIG_SECURE_LOADER}" MATCHES "y"))
			if(("$ENV{_WRS_CONFIG_SECURE_LOADER_ENCRYPTION}" MATCHES "y"))
				SET(CMAKE_C_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>'")
				SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>'")
			else()
				SET(CMAKE_C_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>'")
				SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>'")
			endif()
		else()
			SET(CMAKE_C_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} '")
			SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} '")
		endif()
	endif()
else(("${CMAKE_HOST_SYSTEM_NAME}" MATCHES "Windows"))
	if(("${TOOL}" MATCHES "llvm") AND ("${CMAKE_GENERATOR}" MATCHES "Unix Makefiles"))
		if(("$ENV{_WRS_CONFIG_SECURE_LOADER}" MATCHES "y"))
			if(("$ENV{_WRS_CONFIG_SECURE_LOADER_ENCRYPTION}" MATCHES "y"))
				SET(CMAKE_C_LINK_EXECUTABLE "sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} \" ; sh -c \"rm -f <TARGET>\" ; sh -c \"${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} \" ; sh -c \" signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>\" ; sh -c \" signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>\"")
				SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} \" ; sh -c \"rm -f <TARGET>\" ; sh -c \"${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} \" ; sh -c \" signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>\" ; sh -c \" signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>\"")
			else()
				SET(CMAKE_C_LINK_EXECUTABLE "sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} \" ; sh -c \"rm -f <TARGET>\" ; sh -c \"${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} \" ; sh -c \" signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>\"")
				SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} \" ; sh -c \"rm -f <TARGET>\" ; sh -c \"${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} \" ; sh -c \" signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>\"")
			endif()
		else()
			SET(CMAKE_C_LINK_EXECUTABLE "sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} \" ; sh -c \"rm -f <TARGET>\" ; sh -c \"${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} \"")
			SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} \" ; sh -c \"rm -f <TARGET>\" ; sh -c \"${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c\" ; sh -c \" ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} \"")
		endif()
	else()
		if(("$ENV{_WRS_CONFIG_SECURE_LOADER}" MATCHES "y"))
			if(("$ENV{_WRS_CONFIG_SECURE_LOADER_ENCRYPTION}" MATCHES "y"))
				SET(CMAKE_C_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>'")
				SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF --secret=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_SECRET} --kepid=$ENV{_WRS_CONFIG_SECURE_LOADER_KEP_ID} --encrypt=\"${SECURE_LOADER_CIPHER_TYPE}\" <TARGET>'")
			else()
				SET(CMAKE_C_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>'")
				SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} ' ; sh -c ' signtool ${STRIP_SIGN_CMD} --key=$ENV{_WRS_CONFIG_SECURE_LOADER_PRIVATE_SIGNING_KEY_FILE} --cert=$ENV{_WRS_CONFIG_SECURE_LOADER_PUBLIC_SIGNING_CERT_FILE} --type=ELF <TARGET>'")
			endif()
		else()
			SET(CMAKE_C_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} '")
			SET(CMAKE_CXX_LINK_EXECUTABLE "sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -o <TARGET>.partial.o <OBJECTS> ${LIBPATH} ${LIBS} ' ; sh -c 'rm -f <TARGET>' ; sh -c '${CMAKE_NM} <TARGET>.partial.o <LINK_LIBRARIES> | tclsh ${WIND_BUILD}/mk/tcl/munch.tcl -c pentium -tags ${VSB_DIR}/krnl/tags/dkm.tags > <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -O2 ${CC_ARCH_SPEC} -fdollars-in-identifiers -Wall ${ADDED_CFLAGS} -I${VSB_DIR}/share/h -isystem${VSB_DIR}/krnl/h/public -I/ ${DKM_LONGCALL} -DCPU=_VX_${CPU} -DTOOL_FAMILY=${TOOL_FAMILY} -DTOOL=${TOOL} -D_WRS_KERNEL -D_WRS_VX_SMP -D_WRS_CONFIG_SMP -D_VSB_CONFIG_FILE=\\\"${VSB_DIR}/h/config/vsbConfig.h\\\" ${DEFINES} -o <TARGET>.ctdt.o -c <TARGET>.ctdt.c' ; sh -c ' ${CMAKE_C_COMPILER} -r -nostdlib -Wl,-X -T ${WIND_BUILD_TOOL}/${TOOL_VERSION}/krnl/ldscripts/link.OUT -o <TARGET> <TARGET>.ctdt.o <TARGET>.partial.o <LINK_LIBRARIES> ${LIBPATH} ${LIBS} '")
		endif()
	endif()
endif(("${CMAKE_HOST_SYSTEM_NAME}" MATCHES "Windows"))
