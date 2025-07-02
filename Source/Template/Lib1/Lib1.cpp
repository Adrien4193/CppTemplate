#include "Lib1.hpp"

#include <fmt/format.h>

namespace Template
{
    auto Lib1(int value) -> int
    {
        fmt::println("Lib1 value: {}", value);

        return value;
    }
}
