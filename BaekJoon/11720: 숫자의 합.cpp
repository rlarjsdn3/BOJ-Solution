#include <iostream>
#include <string>

int main(void)
{
    int n, sum = 0;
    std::string s;

    std::cin >> n >> s;
    for(auto it=s.begin(); it!=s.end(); it++) {
        sum += (int)(*it-'0');
    }

    std::cout << sum << '\n';
    return 0;
}
