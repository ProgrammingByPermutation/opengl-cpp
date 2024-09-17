cmake_minimum_required(VERSION 3.10)

project(Tutorial)

include_directories("c:\\src\\cpp\\include")
link_directories("c:\\src\\cpp\\lib")

include_directories("$ENV{CPP_HEADERS}")    # 3rd party headers
link_directories("$ENV{CPP_LIBS}")          # 3rd party libraries

# Glad is a 3rd party library that you include using a single header "glad.h" (in CPP_HEADERS)
# and a single source code file "glad.c"
add_library(GLAD STATIC "ch6/glad.c" "../../../../cpp/include/glad/glad.h")

# Add main entrypoint of application
add_executable(Tutorial ch6/main.cpp)

# Add the specific library files being used and any libraries
target_link_libraries(Tutorial glfw3.lib opengl32.lib GLAD)