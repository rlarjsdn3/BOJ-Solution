#include <iostream>
#include <string>

int main(void)
{
    int a, b, c;
    int count[10] = { 0 };
    std::string mul;

    std::cin >> a >> b >> c;
    mul = std::to_string(a*b*c);

    for(auto it=mul.begin(); it!=mul.end(); it++) {
        count[(int)(*it-'0')] += 1;
    }

    for(int i=0; i<10; i++) {
        std::cout << count[i] << '\n';
    }

    return 0;
}
