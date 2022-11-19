import Foundation

func selectionSort(_ array: inout [Int], count: Int) -> (Int, Int)? {
    var count: Int = 0
    let length: Int = array.count
    for i in stride(from: length-1, to: 0, by: -1) {
        var index: Int = i
        for j in stride(from: i-1, through: 0, by: -1) {
            if array[index] < array[j] {
                index = j
            }
        }
        
        if i != index {
            count += 1
            array.swapAt(i, index)
            
            if count == k {
                return (array[index], array[i])
            }
        }
    }
    
    return nil
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]
var array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

if let (a, b) = selectionSort(&array, count: k) {
    print("\(a) \(b)")
} else {
    print("-1")
}
