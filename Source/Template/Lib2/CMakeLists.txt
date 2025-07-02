include(Library)

file(GLOB_RECURSE HEADERS *.hpp)
file(GLOB_RECURSE SOURCES *.cpp)

configure_library(Lib2 "${HEADERS}" "${SOURCES}")
