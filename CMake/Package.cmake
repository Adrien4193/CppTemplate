set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGE_DESCRIPTION ${PROJECT_DESCRIPTION})
set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE.md")
set(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README.md")

include(CPack)

include(CMakePackageConfigHelpers)

configure_package_config_file(
    ${PROJECT_SOURCE_DIR}/CMake/PackageConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
    INSTALL_DESTINATION ${PROJECT_INSTALL_CONFIGDIR}
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

install(
    FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
    DESTINATION ${PROJECT_INSTALL_CONFIGDIR}
    COMPONENT Development
)

set(CMAKE_INSTALL_SYSTEM_RUNTIME_COMPONENT SystemRuntime)

include(InstallRequiredSystemLibraries)

cpack_add_component(
    SystemRuntime
    DISPLAY_NAME "System runtime"
    DESCRIPTION "System runtime libraries"
)

cpack_add_component(
    Runtime
    DISPLAY_NAME "Runtime"
    DESCRIPTION "Runtime artifacts"
)

cpack_add_component(
    Development
    DISPLAY_NAME "Development"
    DESCRIPTION "Development artifacts"
    DEPENDS Runtime
)
