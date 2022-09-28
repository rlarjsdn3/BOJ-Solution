#include <iostream>
#include <string>
#include <vector>

int main(void) {
    int n, sum, cnt;
    std::string str;

    int* result;

    std::cin >> n;
    result = new int[n];   
    for(int i=0, sum=0, cnt=1; i<n; i++, sum=0, cnt=1) {
        std::cin >> str;
        for(auto it=str.begin(); it!=str.end(); it++) {
            if(*it=='O')
                sum += (cnt++);
            else
                cnt = 1;
        }

        result[i] = sum;
    }

    for(int i=0; i<n; i++)
        std::cout << result[i] << '\n';
    
    delete[] result;
    return 0;
}
