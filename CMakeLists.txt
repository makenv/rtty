cmake_minimum_required(VERSION 3.5)

project(rtty C)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  if(EXISTS "/etc/redhat-release")
    file(READ "/etc/redhat-release" REDHAT_RELEASE)
    string(REGEX MATCH "CentOS Linux release 7" IS_CENTOS_7 ${REDHAT_RELEASE})
    if(IS_CENTOS_7)
      add_compile_definitions(__CENTOS_7__=1)
    endif()
  endif()
endif()

if (BUILD_STATIC)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -static")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")
set(CMAKE_C_COMPILER musl-gcc)
endif()


#set(CMAKE_VERBOSE_MAKEFILE ON)

add_subdirectory(src)
