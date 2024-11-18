cmake_minimum_required(VERSION 3.10)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

project(Tutorial)

include_directories("c:\\src\\cpp\\include")
link_directories("c:\\src\\cpp\\lib")

include_directories("$ENV{CPP_HEADERS}")    # 3rd party headers
link_directories("$ENV{CPP_LIBS}")          # 3rd party libraries

# Glad is a 3rd party library that you include using a single header "glad.h" (in CPP_HEADERS)
# and a single source code file "glad.c"
add_library(GLAD STATIC "src/glad.c" "../../../../cpp/include/glad/glad.h")

configure_file(configuration/root_directory.h.in configuration/root_directory.h)
include_directories(${CMAKE_BINARY_DIR}/configuration)

file(COPY resources DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/resources)
file(GLOB FRAGMENT_SHADERS "*/*.fs")
file(GLOB VERTEX_SHADERS "*/*.vs")
file(COPY ${FRAGMENT_SHADERS} DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
file(COPY ${VERTEX_SHADERS} DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

# Add main entrypoint of application
add_executable(Tutorial src/main.cpp)

# Add the specific library files being used and any libraries
target_link_libraries(Tutorial glfw3.lib opengl32.lib GLAD)