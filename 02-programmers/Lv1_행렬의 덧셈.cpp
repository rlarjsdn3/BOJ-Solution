#include <iostream>
#include <vector>

using namespace std;

vector<vector<int>> solution(vector<vector<int>> arr1, vector<vector<int>> arr2) {
    vector<vector<int>> answer;

    for(int i=0; i<arr1.size(); i++) {
        vector<int> v;

        for(int j=0; j<arr1[i].size(); j++) {
            v.push_back(arr1[i][j] + arr2[i][j]);
        }

        answer.push_back(v);
    }

    return answer;
}

int main(void) {
    vector<vector<int>> arr1{ { 1, 2 }, { 3, 4} }, arr2{ { 3, 4}, { 5, 6 } };
    vector<vector<int>> answer = solution(arr1, arr2);

    for(int i=0; i<answer.size(); i++) {
        for(int j=0; j<answer[i].size(); j++) {
            cout << answer[i][j] << ' ';
        }
        cout << endl;
    }
    
    return 0;
}
