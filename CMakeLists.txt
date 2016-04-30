cmake_minimum_required(VERSION 2.8.9)

project(nitrojs)

# add_definitions( -DV8_USE_EXTERNAL_STARTUP_DATA=0 )

IF(MAC)
   add_definitions( -DTARGET_OS_MAC )
   add_definitions( -DCMAKE_OSX_DEPLOYMENT_TARGET=10.5 )
   INCLUDE_DIRECTORIES ( /System/Library/Frameworks )
#   SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w -std=c++11")
   SET(CMAKE_EXE_LINKER_FLAGS "-framework OpenGL -framework Carbon -framework ForceFeedback -framework Cocoa -framework IOKit -framework CoreMIDI -framework CoreAudio -framework AudioUnit -framework AudioToolbox -framework CoreGraphics -framework QuartzCore")
   add_definitions( -D__APPLE__ )
ENDIF (MAC)

if(WIN32)
   SET(MSVC_RUNTIME "static")
   SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W2 /MTd /fp:fast")
#   SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w -std=c++11")   
   add_definitions( -D_WIN32_WINNT=0x0501 )
   add_definitions( -DWIN32 )
   add_definitions( -D_CRT_RAND_S )
   add_definitions( -DV8_TARGET_ARCH_X64 )
   add_definitions( -DV8_HOST_ARCH_X64 )
   add_definitions( -DV8_HOST_ARCH_64_BIT )
endif(WIN32)

IF(PI)
   SET(CMAKE_SYSTEM_NAME Linux)
   SET(CMAKE_SYSTEM_VERSION 1)
   SET(CMAKE_C_COMPILER gcc-4.9)
   SET(CMAKE_CXX_COMPILER g++-4.9)
   SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w -std=c++11")   
   add_definitions( -D__PI__)
ENDIF(PI)

INCLUDE_DIRECTORIES( 
  v8
  v8/include
)


FILE(GLOB v8_h
  v8/include/*.h
  v8/src/*.h  
)

FILE(GLOB v8_src 
  v8/src/*.cc
  v8/src/base/*.cc
  v8/src/base/utils/*.cc
  v8/src/ic/*.cc
  v8/src/heap/*.cc
  v8/src/extensions/*.cc
  v8/src/runtime/*.cc
  v8/src/interpreter/*.cc
  v8/src/debug/*.cc
  v8/src/regexp/*.cc
  v8/src/profiler/*.cc
  v8/src/compiler/*.cc
  v8/src/crankshaft/*.cc
  v8/src/full-codegen/*.cc
  v8/src/libplatform/*.cc
  v8/src/snapshot/serialize.cc
  v8/src/third_party/fdlibm/*.cc
  v8/src/snapshot/snapshot-source-sink.cc
  v8/src/snapshot/natives-common.cc
  v8/src/snapshot/natives-empty.cc
  v8/src/snapshot/snapshot-common.cc
  v8/src/snapshot/snapshot-empty.cc
)

set(nitrojs_src 
  nitrojs/libraries.cpp
  nitrojs/b8.cpp
  nitrojs/natives.h
)

FILE(GLOB d8_src 
  v8/src/d8/d8.cc
  v8/src/d8/d8-windows.cc
)

#  v8/src/compiler/x64/code-generator-x64.cc
#  v8/src/compiler/x87/code-generator-x87.cc
#  v8/src/compiler/x87/instruction-selector-x87.cc

set(v8_mksnapshot
  v8/src/snapshot/snapshot-external.cc
  v8/src/snapshot/mksnapshot.cc
)

FILE(GLOB v8_x64
  v8/src/x64/*.cc
  v8/src/ic/x64/*.cc
  v8/src/compiler/x64/*.cc
  v8/src/crankshaft/x64/*.cc
  v8/src/regexp/x64/*.cc
  v8/src/debug/x64/*.cc
  v8/src/full-codegen/x64/*.cc
  v8/src/ic/x87/*.cc
  v8/src/x87/*.cc
)

set(v8_windows
  v8/src/base/platform/platform-win32.cc
  v8/src/base/platform/condition-variable.cc
  v8/src/base/platform/mutex.cc
  v8/src/base/platform/semaphore.cc
  v8/src/base/platform/time.cc  
)


IF(MAC)

ENDIF(MAC)

IF(WIN32)

ADD_LIBRARY(v8
 ${v8_src}
 ${v8_x64}
 ${v8_windows}
 ${v8_h}
)

ADD_EXECUTABLE(nitrojs
 ${nitrojs_src}
 ${d8_src}
)

target_link_libraries(nitrojs v8 winmm)

ENDIF(WIN32)

IF(PI)

ENDIF(PI)
