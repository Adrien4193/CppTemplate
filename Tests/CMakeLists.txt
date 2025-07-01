file(GLOB_RECURSE SOURCES ${CMAKE_CURRENT_LIST_DIR}/Test*.cpp)

add_executable(Tests ${SOURCES})

target_include_directories(Tests PRIVATE ${CMAKE_CURRENT_LIST_DIR})
target_link_libraries(Tests PRIVATE Lib1 Lib2 GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(Tests)
