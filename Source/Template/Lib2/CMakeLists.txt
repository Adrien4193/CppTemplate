file(GLOB_RECURSE HEADERS *.hpp)
file(GLOB_RECURSE SOURCES *.cpp)

add_library(Lib2)

configure_library(Lib2 "${HEADERS}" "${SOURCES}")

install_library(Lib2)
