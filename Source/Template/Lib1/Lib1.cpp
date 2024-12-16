#include "Lib1.h"

#include <fmt/format.h>

namespace Template
{
    int Lib1(int value)
    {
        fmt::println("Lib1 value: {}", value);

        return value;
    }
}
