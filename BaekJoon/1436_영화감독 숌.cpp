#include <iostream>
#include <string>

int main(void) {
    int n;
    std::cin >> n;

    int result = 666; // 첫 번째 영화 시리즈를 저장한 변수
    while( n > 0 ) {
        std::string str = std::to_string(result);
        // 영화 제목에 "666"이 들어간다면 시리즈로 카운팅함
        if( std::string::npos != str.find("666") ) {
            n -= 1; 
        }
        result += 1; // 영화 제목에 "666"이 들어가는 수가 나올 때까지 계속 1을 더함
    }

    // while문 마지막에 1을 더했으므로 결과에서는 1을 빼줌
    std::cout << result - 1;
}
