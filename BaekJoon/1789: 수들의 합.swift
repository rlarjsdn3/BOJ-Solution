//
//  Created by 김건우 on 2022/11/16.
//


import Foundation

let s: Int = Int(readLine()!)!
var i: Int = 0, p: Int = 0
while p <= s {
    i += 1
    p += i
}
print(i - 1)
