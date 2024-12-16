#include <Template/Lib1/Lib1.h>
#include <Template/Lib2/Lib2.h>

#include <fmt/format.h>

int main(int argc, const char **argv)
{
    fmt::println("argc: {}", argc);

    for (auto i = 0; i < argc; ++i)
    {
        fmt::println("argv [{}]: {}", i, argv[i]);
    }

    fmt::println("Lib1: {}", Template::Lib1(1));
    fmt::println("Lib2: {}", Template::Lib2(2));
}
