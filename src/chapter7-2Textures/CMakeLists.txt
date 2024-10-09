cmake_minimum_required(VERSION 3.10)

project(Tutorial)

include_directories("c:\\src\\cpp\\include")
link_directories("c:\\src\\cpp\\lib")

include_directories("$ENV{CPP_HEADERS}")    # 3rd party headers
link_directories("$ENV{CPP_LIBS}")          # 3rd party libraries

# Glad is a 3rd party library that you include using a single header "glad.h" (in CPP_HEADERS)
# and a single source code file "glad.c"
add_library(GLAD STATIC "ch7/glad.c" "../../../../cpp/include/glad/glad.h")

configure_file(configuration/root_directory.h.in configuration/root_directory.h)
include_directories(${CMAKE_BINARY_DIR}/configuration)

file(COPY resources DESTINATION Debug/resources)
file(COPY ch7/4.1.texture.fs DESTINATION Debug)
file(COPY ch7/4.1.texture.vs DESTINATION Debug)
file(COPY ch7/4.2.texture.fs DESTINATION Debug)
file(COPY ch7/4.2.texture.vs DESTINATION Debug)

# Add main entrypoint of application
add_executable(Tutorial ch7/main.cpp)

# Add the specific library files being used and any libraries
target_link_libraries(Tutorial glfw3.lib opengl32.lib GLAD)