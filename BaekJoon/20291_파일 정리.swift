import Foundation

let n: Int = Int(readLine()!)!
var dict: [String: Int] = [:]
for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: ".").map { String($0) }
    if dict.keys.contains(input[1]) {
        dict[input[1]]! += 1
    } else {
        dict[input[1]] = 1
    }
}
var result: [(key: String, value:Int)] = dict.sorted(by: { $0.key < $1.key })
result.forEach { print("\($0.key) \($0.value)")}
