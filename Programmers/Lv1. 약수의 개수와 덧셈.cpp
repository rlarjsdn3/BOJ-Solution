#include <iostream>

using namespace std;

int solution(int left, int right) {
    int answer = 0;
    int m, count;

    for(; left<=right; left++) {
        count = 1;
        for(m=0; m<=left/2; m++) {
            if(left%m==0) count += 1;
        }

        answer += (count&1) ? -left : +left;
    }

    return answer;
}

int main(void) {
    cout << solution(13, 17) << endl;
    return 0;
}
