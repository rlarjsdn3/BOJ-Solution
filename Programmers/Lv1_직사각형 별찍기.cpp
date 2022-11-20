#include <iostream>
#include <vector>

using namespace std;

int main(void) {
    int a;
    int b;
    cin >> a >> b;
    
    vector<vector<char>> v(b, vector<char>(a, '*'));
    for(int i=0; i<v.size(); i++) {
        for(int j=0; j<v[0].size(); j++) {
            cout << v[i][j];
        }

        cout << endl;
    }

    return 0;
}
