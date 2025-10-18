#include <gtest/gtest.h>

#include <CppTemplate/Lib1/Lib1.hpp>

using namespace CppTemplate;

TEST(Test1, Dummy1)
{
    EXPECT_EQ(Lib1(1), 1);
}

TEST(Test1, Dummy2)
{
    EXPECT_EQ(Lib1(2), 2);
}
