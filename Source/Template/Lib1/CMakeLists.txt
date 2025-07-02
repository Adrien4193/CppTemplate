include(Library)

file(GLOB_RECURSE HEADERS *.hpp)
file(GLOB_RECURSE SOURCES *.cpp)

configure_library(Lib1 "${HEADERS}" "${SOURCES}")

target_link_libraries(Lib1 PRIVATE fmt::fmt)
