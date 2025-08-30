file(GLOB_RECURSE HEADERS *.hpp)
file(GLOB_RECURSE SOURCES *.cpp)

include(Library)
configure_library(Lib1 "${HEADERS}" "${SOURCES}")
