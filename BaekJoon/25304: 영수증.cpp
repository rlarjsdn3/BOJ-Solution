#include <iostream>
using namespace std;

int main(void) {
    int n, sum = 0;
    int receiptTotal;
    int price, amount;
    
    cin >> receiptTotal;
    cin >> n;
    for(int i=0; i<n; i++) {
        cin >> price >> amount;
        receiptTotal -= (price*amount);
    }

    cout << (receiptTotal==0 ? "Yes" : "No") << endl;
    return 0;
}
