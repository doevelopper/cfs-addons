#  CMakeLists.txt
#  
#         Copyright (C) 2018, A.H.L.
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

cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

project (vx-dds-al
#<major>.<minor>.<micro>.<patch>[.<tweak>][-rc<n>][-<date>][-<id>]
    VERSION 0.0.0.0
    DESCRIPTION "CFS Addons"
    HOMEPAGE_URL "https://exemple.com"
    LANGUAGES CXX
)

#set("BUILD_SHARED_LIBS" OFF CACHE INTERNAL "If enabled, shared libs will be built by default, otherwise static libs")

add_definitions(-DRELEASE_LEVEL="SNAPSHOOT") # SNAPSHOOT ,ALPHA , BETA , CANDIDATE , FINAL.


list(APPEND CMAKE_MODULE_PATH
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmake"
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmake/modules"
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmake/toolhains"
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmake/macros"
    "${CMAKE_SOURCE_DIR}/src/test/resources/scripts"
)

include (PreventInSourceBuilds)
include (DefinePlatformSpecfic)

add_definitions(
    -DGTEST_HAS_POSIX_RE=0
    -DGTEST_HAS_TR1_TUPLE=0
    -DGTEST_HAS_STREAM_REDIRECTION=0
    -DGMOCK_WCHAR_T_IS_NATIVE_=0
    -DGMOCK_HAS_SIGNED_WCHAR_T_=0
)

add_subdirectory (third-party/abseil-cpp)

#add_subdirectory (src/main/cpp)
# add_subdirectory (src/test/cpp)
# add_subdirectory (src/it)

