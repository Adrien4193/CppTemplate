function(configure_library TARGET HEADERS SOURCES)
    add_library(${TARGET})
    add_library(${PROJECT_NAME}::${TARGET} ALIAS ${TARGET})

    set_target_properties(${TARGET} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}${TARGET})

    target_sources(
        ${TARGET}
        PUBLIC
        FILE_SET HEADERS
        FILES ${HEADERS}
        PRIVATE
        ${SOURCES}
    )

    target_include_directories(
        ${TARGET}
        PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Source>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    )

    include(ExportMacro)
    define_export_macro(${TARGET})

    include(GNUInstallDirs)
    install(
        TARGETS ${TARGET}
        EXPORT TemplateTargets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        FILE_SET HEADERS DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/${TARGET}
    )
endfunction()
