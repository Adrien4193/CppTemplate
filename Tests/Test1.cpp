#include <gtest/gtest.h>

#include <Template/Lib1/Lib1.h>

using namespace Template;

TEST(Lib1, Dummy)
{
    EXPECT_EQ(Lib1(1), 1);
}
