include(Application)
configure_application(Application "" Application.cpp)

target_link_libraries(
    Application
    PRIVATE
    Template::Lib1
    Template::Lib2
    fmt::fmt
)
