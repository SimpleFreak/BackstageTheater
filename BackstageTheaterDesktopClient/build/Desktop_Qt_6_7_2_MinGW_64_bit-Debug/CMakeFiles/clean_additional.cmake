# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "BackstageTheaterDesktopClient_autogen"
  "CMakeFiles\\BackstageTheaterDesktopClient_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\BackstageTheaterDesktopClient_autogen.dir\\ParseCache.txt"
  )
endif()
