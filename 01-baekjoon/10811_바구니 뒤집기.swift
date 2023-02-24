import Foundation

// 바구니의 개수 N과 바구니 바꿀 횟수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 바구니 번호를 담은 배열 초가화
var basket = [Int](repeating: 0, count: n + 1)
(0...n).forEach { basket[$0] = $0 }
// 바구니를 어떻게 바꿀지 입력 받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j) = (input[0], input[1])
    // i번 바구니에서 j번 바구니의 순서를 역순으로 정렬하기
    let reversed = basket[i...j].reversed().map { Int($0) }
    for k in 0...(j-i) {
        basket[k + i] = reversed[k]
    }
}
// 결과값 출력하기
(1...n).forEach { print(basket[$0], terminator: " ") }
