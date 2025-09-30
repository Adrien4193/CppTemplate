include(ExportMacro)

function(configure_library TARGET HEADERS SOURCES)
    add_library(${PROJECT_NAME}::${TARGET} ALIAS ${TARGET})

    set_target_properties(${TARGET} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}${TARGET})

    target_sources(
        ${TARGET}
        PUBLIC FILE_SET HEADERS FILES ${HEADERS}
        PRIVATE ${SOURCES}
    )

    target_include_directories(
        ${TARGET}
        PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Source>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    )

    define_export_macro(${TARGET})
endfunction()

function(install_library TARGET)
    install(
        TARGETS ${TARGET}
        EXPORT ${TARGET}Targets
        RUNTIME
        DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT Runtime
        LIBRARY
        DESTINATION ${CMAKE_INSTALL_LIBDIR}
        COMPONENT Runtime
        NAMELINK_COMPONENT Development
        ARCHIVE
        DESTINATION ${CMAKE_INSTALL_LIBDIR}
        COMPONENT Development
        FILE_SET HEADERS
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/${TARGET}
        COMPONENT Development
    )

    install(
        EXPORT ${TARGET}Targets
        FILE ${PROJECT_NAME}${TARGET}Targets.cmake
        DESTINATION ${PROJECT_INSTALL_CONFIGDIR}
        NAMESPACE ${PROJECT_NAME}::
        COMPONENT Development
    )
endfunction()
