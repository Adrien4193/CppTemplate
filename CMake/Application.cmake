function(configure_application TARGET SOURCES)
    add_executable(${PROJECT_NAME}::${TARGET} ALIAS ${TARGET})
    set_target_properties(${TARGET} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}${TARGET})
    target_sources(${TARGET} PRIVATE ${SOURCES})
endfunction()

function(install_application TARGET)
    install(
        TARGETS ${TARGET}
        RUNTIME
        DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT Runtime
    )
endfunction()
