#include <iostream>

void star(int x, int y, int n) {
    // 공백을  찍어내는 조건을  만족하면
    if( (x/n) % 3 == 1 && (y/n) % 3 == 1 ) {
        std::cout << ' '; // 공백 출력
    } else {
        // 별 모양의 크기가 더 이상 나누어지지 않으면
        if( n / 3 == 0 ) {
            std::cout << '*'; // 별 출력
        } else {
            // 그렇지 않다면 더 작은 별 모양의 크기로 나누기
            star(x, y, n / 3);
        }
    }
}

int main(void) {
    int n;
    std::cin >> n;

    // 각 좌표를 하나씩 확인하며 별 찍기
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            star(i, j, n);
        }
        std::cout << '\n';
    }
}
