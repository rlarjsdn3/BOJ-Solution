#include <iostream>
#include <set>
#include <string>

int main(void)
{
    std::string input;
    std::set<std::string> set;

    std::cin >> input;

    int size = input.size();
    for(int i=0; i<input.size(); i++) {
        for(int j=1; j<size+1; j++) {
            set.insert(input.substr(i, j));
        }

        size--;
    }

    std::cout << set.size() << '\n';
    return 0;
}
