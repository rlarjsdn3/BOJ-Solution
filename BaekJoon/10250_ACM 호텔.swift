import Foundation

let n: Int = Int(readLine()!)!
var result: [Int] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let h: Int = input[0]
    let n: Int = input[2]
    
    var floor: Int = 0, no: Int = 0
    no = n / h
    if n % h == 0 {
        floor = h
    } else {
        floor = n % h
        no += 1
    }
    
    result.append(floor * 100 + no)
}
result.forEach { print($0) }
