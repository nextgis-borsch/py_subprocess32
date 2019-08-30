
# Create cmake.in

file(READ ${CMAKE_CURRENT_BINARY_DIR}/${OUT_DIR_NAME}/_posixsubprocess_config.h.in FILE_CONTENTS)
string(REPLACE "#undef" "#cmakedefine" FILE_CONTENTS "${FILE_CONTENTS}")
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${OUT_DIR_NAME}/_posixsubprocess_config.h.cmake.in "${FILE_CONTENTS}")


include(CheckIncludeFile)
include (CheckFunctionExists)

check_include_file("dirent.h" HAVE_DIRENT_H)
check_function_exists(dirfd HAVE_DIRFD)

check_include_file("fcntl.h" HAVE_FCNTL_H)
check_include_file("inttypes.h" HAVE_INTTYPES_H)
check_include_file("memory.h" HAVE_MEMORY_H)
check_include_file("ndir.h" HAVE_NDIR_H)

check_function_exists(pipe2 HAVE_PIPE2)
check_function_exists(setsid HAVE_SETSID)

check_include_file("signal.h" HAVE_SIGNAL_H)
check_include_file("stdint.h" HAVE_STDINT_H)
check_include_file("strings.h" HAVE_STRINGS_H)
check_include_file("string.h" HAVE_STRING_H)
check_include_file("sys/cdefs.h" HAVE_SYS_CDEFS_H)
check_include_file("sys/dir.h" HAVE_SYS_DIR_H)
check_include_file("sys/ndir.h" HAVE_SYS_NDIR_H)
check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
check_include_file("sys/syscall.h" HAVE_SYS_SYSCALL_H)
check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
check_include_file("unistd.h" HAVE_UNISTD_H)


check_include_file("ctype.h" HAVE_CTYPE_H)
check_include_file("stdlib.h" HAVE_STDLIB_H)

if (HAVE_CTYPE_H AND HAVE_STDLIB_H)
    set(STDC_HEADERS 1)
endif ()

if(APPLE)
    set(_DARWIN_C_SOURCE ON)
elseif(UNIX)
    set(_GNU_SOURCE ON)
else()
    set(_POSIX_C_SOURCE ON)
endif()

configure_file(${CMAKE_CURRENT_BINARY_DIR}/${OUT_DIR_NAME}/_posixsubprocess_config.h.cmake.in  ${CMAKE_CURRENT_BINARY_DIR}/${OUT_DIR_NAME}/_posixsubprocess_config.h)