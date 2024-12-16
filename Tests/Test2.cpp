#include <doctest/doctest.h>

#include <Template/Lib2/Lib2.h>

using namespace Template;

TEST_CASE("Lib2")
{
    CHECK_EQ(Lib2(2), 3);
}
