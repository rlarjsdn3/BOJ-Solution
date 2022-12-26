#include <iostream>

int factorial(int n) {
    if(n==0) return 0;
    else if(n==1) return 1;
    else return factorial(n-1) + factorial(n-2);
}

int main(void)
{
    int n;
    std::cin >> n;
    std::cout << factorial(n) << '\n';
    return 0;
}
