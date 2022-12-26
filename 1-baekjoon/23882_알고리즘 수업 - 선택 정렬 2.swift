import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let k: Int = input[1]
var array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

var count: Int = 0
for i in stride(from: n-1, through: 0, by: -1) {
    var min: Int = i
    for j in stride(from: i-1, through: 0, by: -1) {
        if array[min] < array[j] {
            min = j
        }
    }
    
    if i != min {
        count += 1
        array.swapAt(i, min)
        
        if count == k {
            break
        }
    }
}
print(count < k ? -1 : array.map { String($0) }.joined(separator: " "))
