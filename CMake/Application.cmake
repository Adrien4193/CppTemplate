function(configure_application TARGET HEADERS SOURCES)
    add_executable(${TARGET} ${HEADERS} ${SOURCES})

    include(GNUInstallDirs)
    install(
        TARGETS ${TARGET}
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
endfunction()
