#include <iostream>
#include <cstdlib>

using namespace std;

long long solution(int price, int money, int count) {
    long long total = 0;
    for(int i=1; i<=count; i++) {
        total += (price*i);
    }

    return (total<=money) ? 0 : llabs(total-money);
}

int main(void) {
    cout << solution(3, 20, 4) << endl;
    return 0;
}
