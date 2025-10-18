#include <print>

#include <CppTemplate/Lib1/Lib1.hpp>
#include <CppTemplate/Lib2/Lib2.hpp>

// NOLINTNEXTLINE(bugprone-exception-escape)
auto main(int argc, const char **argv) -> int
{
    std::println("argc: {}", argc);

    for (auto i = 0; i < argc; ++i)
    {
        std::println("argv [{}]: {}", i, argv[i]);
    }

    std::println("Lib1: {}", CppTemplate::Lib1(1));
    std::println("Lib2: {}", CppTemplate::Lib2(2));
}
