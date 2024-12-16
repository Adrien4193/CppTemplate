#include <doctest/doctest.h>

#include <Template/Lib1/Lib1.h>

using namespace Template;

TEST_CASE("Lib1")
{
    CHECK_EQ(Lib1(1), 1);
}
