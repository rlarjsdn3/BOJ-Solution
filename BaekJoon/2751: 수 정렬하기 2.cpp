#include <iostream>
#include <algorithm>

int main(void)
{
    int n;
    std::cin >> n;

    int *arr = new int[n];
    for(int i=0; i<n; i++) {
        std::cin >> arr[i];
    }

    std::sort(arr, arr+n);

    for(int i=0; i<n; i++) {
        std::cout << arr[i] << '\n';
    }
    
    return 0;
}
