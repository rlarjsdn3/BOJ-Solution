import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

var password: [String: String] = [:]
for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    password[input[0]] = input[1]
}

var result: [String] = []
for _ in 0..<m {
    let input: String =  readLine()!
    result.append(password[input]!)
}
result.forEach { print($0) }
