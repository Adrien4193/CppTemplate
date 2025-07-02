#include <gtest/gtest.h>

#include <Template/Lib1/Lib1.h>

using namespace Template;

TEST(Lib1, Dummy1)
{
    EXPECT_EQ(Lib1(1), 1);
}

TEST(Lib1, Dummy2)
{
    EXPECT_EQ(Lib1(2), 2);
}
