//
//  Created by 김건우 on 2022/11/12.
//

import Foundation

let n: Int = Int(readLine()!)!

var result: Int = 0
for i in 0..<n {
    let sum = i + Array(String(i)).reduce(0) { $0 + Int(String($1))! }
    if n == sum {
        result = i
        break
    }
}
print(result)
