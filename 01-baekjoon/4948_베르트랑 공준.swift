import Foundation

let SIZE = 123_456 * 2
// 소수 판별을 위한 배열 선언
var prime = [Bool](repeating: true, count: SIZE + 1)
// 에라토스테네스의 체 알고리즘 수행
prime[0] = false
prime[1] = false

for i in 2...SIZE {
    // 첫 수가 이미 false라면
    if !prime[i] {
       continue // 건너뛰고 다음 수 진행
    }
    // i*2부터 SIZE까지 i씩 건너뛰며 false로 변경
    for j in stride(from: i * 2, through: SIZE, by: i) {
        prime[j] = false
    }
}

// 정수 N 입력 받기
while let n = Int(readLine()!) {
    // 0을 입력받으면 프로그램 종료
    if n == 0 { break }
    // 소수의 개수를 세아리는 변수 선언
    var count = 0
    // n부터 (n * 2)까지 소수의 개수 구하기
    for i in stride(from: n + 1, through: n * 2, by: 1) {
        if prime[i] {
            count += 1
        }
    }
    // 결과값 출력하기
    print(count)
}
