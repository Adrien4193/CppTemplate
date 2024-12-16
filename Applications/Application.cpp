#include <Template/Lib1/Lib1.h>
#include <Template/Lib2/Lib2.h>

#include <iostream>

int main(int argc, const char **argv)
{
    std::cout << argc << '\n';

    for (auto i = 0; i < argc; ++i)
    {
        std::cout << argv[i] << '\n';
    }

    Template::Lib1();
    Template::Lib2();
}
