#include <iostream>

int main(void)
{
    int n, k;
    int divisor, cnt = 0;

    std::cin >> n >> k;
    
    for(int i=1; i<=n; i++) {
        if(n%i==0) {
            divisor = i;

            cnt += 1;
            if(cnt==k) {
                break;
            }
        }
    }

    std::cout << (k<=cnt ? divisor : 0) << '\n';
    return 0;
}
