file(GLOB_RECURSE SOURCES ${CMAKE_CURRENT_LIST_DIR}/Test*.cpp)

foreach(SOURCE ${SOURCES})
    get_filename_component(NAME ${SOURCE} NAME_WLE)
    add_executable(${NAME} ${SOURCE})
    target_include_directories(${NAME} PRIVATE ${CMAKE_CURRENT_LIST_DIR})
    target_link_libraries(${NAME} PRIVATE Lib1 Lib2)
    add_test(NAME ${NAME} COMMAND ${NAME} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
endforeach()
