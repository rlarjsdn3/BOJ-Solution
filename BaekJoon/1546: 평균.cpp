#include <iostream>
#include <vector>

int main(void) {
    int n;
    int m, max = 0;
    double sum = 0.0;
    std::vector<double> vt;

    std::cin >> n;
    for(int i=0; i<n; i++) {
        std::cin >> m;
        vt.push_back(m);
        if(max<m) max = m;
    }

    for(int i=0; i<n; i++) {
        sum += (vt[i]/max) * 100.0;
    }

    std::cout << sum/vt.size() << std::endl;
    return 0;
}
