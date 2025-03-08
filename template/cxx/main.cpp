// #undef YOSUPO_LOCAL

#if 0 and !defined(__clang__)
#include <vector>
#pragma GCC target("avx2,bmi,bmi2,lzcnt,popcnt")
#pragma GCC optimize("Ofast")
#endif

#include "yosupo/fastio.hpp"

#include "./base.hpp"

Scanner sc = Scanner(stdin);
Printer pr = Printer(stdout);

int main() {
    return 0;
}
