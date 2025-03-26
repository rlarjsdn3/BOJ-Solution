import Foundation

// 식 입력 받기
let exps = readLine()!.split(separator: "-").map(String.init)
// 나누어진 식을 순회하면서
var result = 0
for (i, exp) in exps.enumerated() {
    // 나누어진 식을 모두 더하고
    let sum = exp.split(separator: "+").map { Int($0)! }
        .reduce(0, +)
    // 첫 번째 더한 값은 더하고, 나머지는 빼기
    i == 0 ? (result += sum) : (result -= sum)
}
print(result) // 결과 답안 출력
