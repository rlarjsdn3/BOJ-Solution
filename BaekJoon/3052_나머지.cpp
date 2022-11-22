#include <iostream>
#include <set>

int main(void) {
    std::set<int> set;
    int n, count = 0;

    for(int i=0; i<10; i++) {
        std::cin >> n;
        set.insert(n%42);
    }

    std::cout << set.size() << std::endl;
    return 0;
}
