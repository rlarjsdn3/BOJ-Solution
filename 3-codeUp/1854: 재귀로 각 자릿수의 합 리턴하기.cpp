#include <iostream>
#include <string>
using namespace std;

int sumDigit(string n, int d) {
    if(n.size()<=d) return 0;
    else {
        return (int)(n[d]-'0') + sumDigit(n, d+1);
    }
}

int main(void) {
    string n;
    cin >> n;
    cout << sumDigit(n, 0) << endl;
    return 0;
}
