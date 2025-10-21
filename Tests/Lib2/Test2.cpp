#include <gtest/gtest.h>

#include <CppTemplate/Lib2/Lib2.hpp>

using namespace CppTemplate;

TEST(Test2, Dummy) // NOLINT
{
    EXPECT_EQ(Lib2(2), 4);
}
