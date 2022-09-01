#include <iostream>

using namespace std; 

int main(void)
{
    int n;
    int sum = 0;
    cin >> n;

    int prev = 1;
    for(int i=1; i<=n; i++) {
        sum += (prev * i);
        prev *= i;
    }

    cout << sum << endl;
}
