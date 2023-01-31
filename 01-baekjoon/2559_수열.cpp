#include <iostream>
#include <algorithm>
#include <climits>

int main(void)
{
    int n, k;
    std::cin >> n >> k;

    int *data = new int[n];

    int max = INT_MIN;
    int sum_value = 0;
    int *prefix_sum = new int[n+1];

    for(int i=0; i<n; i++) {
        std::cin >> data[i];
        sum_value += data[i];
        prefix_sum[i+1] = sum_value;
    }

    for(int s=1; s<=n-k+1; s++) {
        sum_value = prefix_sum[s+k-1] - prefix_sum[s-1];
        max = std::max(max, sum_value);
    }
    
    std::cout << max << '\n';

    delete[] data;
    delete[] prefix_sum;
    return 0;
}
