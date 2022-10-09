#include <iostream>
#include <algorithm>

int main(void)
{
    int n, x;
    int count = 0;
    int pair_sum = 0;
    int start = 0, end = 0;

    std::cin >> n;
    int *data = new int[n];
    for(int i=0; i<n; i++) {
        std::cin >> data[i];
    }
    std::cin >> x;

    std::sort(data, data+n);

    end = n-1;
    for(int start=0; start<n && start<end; start++) {
        pair_sum = data[start] + data[end];
        while(pair_sum>x)
            pair_sum = data[start] + data[--end];
            
        if(pair_sum==x) {
            count += 1;
            end -= 1;
        }
    }

    std::cout << count << '\n';
    return 0;
}
