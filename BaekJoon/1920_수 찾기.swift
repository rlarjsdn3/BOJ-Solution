import Foundation

func binarySearch(_ target: Int, array: [Int], left: Int, right: Int) -> Bool {
    if left <= right {
        let mid: Int = (left+right) / 2
        
        if target == array[mid] {
            return true
        } else if target < array[mid] {
            return binarySearch(target, array: array, left: 0, right: mid-1)
        } else {
            return binarySearch(target, array: array, left: mid+1, right: right)
        }
    }
    
    return false
}

let n: Int = Int(readLine()!)!
var input1: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

let m: Int = Int(readLine()!)!
var input2: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }


var result: [Int] = []
for x in input2 {
    if binarySearch(x, array: input1, left: 0, right: input1.count-1) {
        result.append(1)
    } else {
        result.append(0)
    }
}

result.forEach { print($0) }
