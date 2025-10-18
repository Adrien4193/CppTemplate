#include "Lib2.hpp"

#include <CppTemplate/Lib1/Lib1.hpp>

namespace CppTemplate
{
    auto Lib2(int value) -> int
    {
        return value + Lib1(value);
    }
}
