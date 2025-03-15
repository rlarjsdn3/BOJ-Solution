import Foundation

// 자연수 A, B 입력 받기
let input = readLine()!.split(separator: " ")
    .map { String($0).reverse() }
let (a, b) = (input[0], input[1])
print(a > b ? a : b) // 결과 답안 출력

extension String {
    func reverse() -> String {
        self.reversed().map(String.init).joined()
    }
}
