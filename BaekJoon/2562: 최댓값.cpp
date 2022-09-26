#include <iostream>

int main(void) {
    int n;
    int idx, max = 0;

    for(int i=0; i<9; i++) {
        std::cin >> n;
        if(max < n) {
            idx = i+1;
            max = n;
        }
    }

    std::cout << max << std::endl << idx << std::endl;
    return 0;
}
