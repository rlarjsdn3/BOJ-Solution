import Foundation

// 바구니의 개수 N과 공을 넣는 횟수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 바구니 정보를 담은 배열
var basket = [Int](repeating: 0, count: n + 1)
// 공을 넣는 방법 입력 받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0]번 바구니에서 input[1]번 바구니까지 input[2]번 공을 채워 넣으라는 의미
    for i in input[0]...input[1] {
        basket[i] = input[2]
    }
}
// 결과값 출력하기
for i in 1...n {
    print(basket[i], terminator: " ")
}
