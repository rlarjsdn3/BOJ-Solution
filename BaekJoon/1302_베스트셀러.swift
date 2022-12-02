import Foundation

let n: Int = Int(readLine()!)!
var count: [String: Int] = [:]
for _ in 0..<n {
    let input: String = readLine()!
    if count.keys.contains(input) {
        count[input]! += 1
    } else {
        count[input] = 1
    }
}

let result: [(key: String, value: Int)] = count.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    }
    
    return $0.value > $1.value
}
print(result[0].key)
