let n: Int = Int(readLine()!)!
var card: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
card.sort()
    
let m: Int = Int(readLine()!)!
let find: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
var dict: [Int: Int] = [:]
var result: [Int] = []

for i in card {
    if dict.keys.contains(i) {
        dict[i] = dict[i]! + 1
    } else {
        dict[i] = 1
    }
}

for j in find {
    if dict.keys.contains(j) {
        result.append(dict[j]!)
    } else {
        result.append(0)
    }
}
print(result.map { String($0) }.joined(separator: " "))
