import Foundation

// 결과 답안 출력
while let input = readLine() {
    let result = input.split(separator: " ").map { Int($0)! }
        .reduce(0, +)
    print(result)
}
