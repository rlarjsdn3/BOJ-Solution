//
//  Created by 김건우 on 2022/11/13.
//

import Foundation

func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    else { return n * factorial(n-1) }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let k: Int = input[1]
print(factorial(n) / ((factorial(n-k) * factorial(k))))
