import Foundation

var result: [String] = []
while true {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    if n == 0 && m == 0 {
        break
    }
    
    // 첫 번째 숫자가 두 번째 숫자의 약수라면
    if m % n == 0 {
        result.append("factor")
    // 첫 번째 숫자가 두 번째 숫자의 배수라면
    } else if n % m == 0 {
        result.append("multiple")
    // 두 경우 모두 아니라면
    } else {
        result.append("neither")
    }
}
result.forEach { print($0) }
