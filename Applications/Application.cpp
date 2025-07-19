#include <print>

#include <fmt/format.h>

#include <Template/Lib1/Lib1.hpp>
#include <Template/Lib2/Lib2.hpp>

auto main(int argc, const char **argv) -> int
{
    fmt::println("argc: {}", argc);
    std::println("This is from std23: {}", argc);

    for (auto i = 0; i < argc; ++i)
    {
        fmt::println("argv [{}]: {}", i, argv[i]);
    }

    fmt::println("Lib1: {}", Template::Lib1(1));
    fmt::println("Lib2: {}", Template::Lib2(2));
}
