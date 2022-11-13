//
//  Created by 김건우 on 2022/11/13.
//

import Foundation

func eratos(_ n: Int) -> [Int] {
    var array: [Bool] = [Bool](repeating: true, count: n+1)
    
    for i in 2...Int(sqrt(Double(n))) {
        var j: Int = 2
        while i*j <= n {
            array[i*j] = false
            j += 1
        }
    }
    
    var prime: [Int] = []
    for i in 2...n {
        if array[i] == true {
            prime.append(i)
        }
    }
    
    return prime
}

let n: Int = Int(readLine()!)!
let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

var count: Int = 0
let prime: [Int] = eratos(array.max()!)
for i in prime.indices {
    if array.contains(prime[i]) {
        count += 1
    }
}
print(count)
