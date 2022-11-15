//
//  Created by 김건우 on 2022/11/15.
//

import Foundation

func bubbleSort(_ array: inout [Int], count k: Int) -> (Int, Int)? {
    var count: Int = 0
    let length: Int = array.count
    for i in 0..<length-1 {
        for j in 0..<length-i-1 {
            if array[j] > array[j+1] {
                count += 1
                array.swapAt(j, j+1)
                
                if count == k {
                    return (array[j], array[j+1])
                }
            }
        }
    }
    
    return nil
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]
var array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

if let (a, b) = bubbleSort(&array, count: k) {
    print("\(a) \(b)")
} else {
    print("-1")
}
