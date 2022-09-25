#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> solution(vector<int> arr) 
{
    arr.erase(unique(arr.begin(), arr.end()), arr.end());
    return arr;
}

int main(void) {
    vector<int> v = solution(vector<int>{1, 1, 3, 3, 0, 1, 1});
    for(vector<int>::iterator it=v.begin(); it!=v.end(); it++) {
        cout << *it << ' ';
    }
    cout << endl;

    return 0;
}
