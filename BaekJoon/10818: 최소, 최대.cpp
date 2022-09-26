#include <iostream>
#include <algorithm>
#include <vector>

int main(void) {
    int n, data;
    std::vector<int> vt;

    std::cin >> n;
    for(int i=0; i<n; i++) {
        std::cin >> data;
        vt.push_back(data);
    }

    std::sort(vt.begin(), vt.end());
    std::cout << vt[0] << " " << vt[vt.size()-1] << std::endl;

    return 0;
}
