#include <iostream>
#include <string>
using namespace std;

int main(void) {
    bool is369;
    int a, b, count;
    string number;
    cin >> a >> b;

    for(int i=a; i<=b; i++) {
        count = 0;
        is369 = false;
        number = to_string(i);
        for(int j=0; j<number.size(); j++) {
            char c = number[j];
            if(c=='3' || c=='6' || c=='9') {
                is369 = true;
                count += 1;
            }
        }

        if(is369) {
            for(int i=0; i<count; i++) {
                cout << "K";
            }
            cout << endl;
        } else {
            cout << number << endl;
        }
    }

    return 0;
}
