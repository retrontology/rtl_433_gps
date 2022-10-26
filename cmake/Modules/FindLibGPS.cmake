# - Try to find LibGPS
# Once done this will define
#
#  LibGPS_FOUND - System has libgps
#  LibGPS_INCLUDE_DIRS - The libgps include directories
#  LibGPS_LIBRARIES - The libraries needed to use libgps
#  LibGPS_DEFINITIONS - Compiler switches required for using libgps
#  LibGPS_VERSION - The libgps version
#

find_package(PkgConfig)
pkg_check_modules(PC_LibGPS QUIET libgps)
set(LibGPS_DEFINITIONS ${PC_LibGPS_CFLAGS_OTHER})

find_path(LibGPS_INCLUDE_DIR NAMES gps.h
          HINTS ${PC_LibGPS_INCLUDE_DIRS}
          PATHS
          /usr/include
          /usr/local/include )

find_library(LibGPS_LIBRARY NAMES libgps.so
             HINTS ${PC_LibGPS_LIBRARY_DIRS}
             PATHS
             /usr/lib
             /usr/local/lib )

set(LibGPS_VERSION ${PC_LibGPS_VERSION})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LibLibGPS_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(LibGPS
                                  REQUIRED_VARS LibGPS_LIBRARY LibGPS_INCLUDE_DIR
                                  VERSION_VAR LibGPS_VERSION)

mark_as_advanced(LibGPS_LIBRARY LibGPS_INCLUDE_DIR LibGPS_VERSION)

set(LibGPS_LIBRARIES ${LibGPS_LIBRARY} )
set(LibGPS_INCLUDE_DIRS ${LibGPS_INCLUDE_DIR} )
