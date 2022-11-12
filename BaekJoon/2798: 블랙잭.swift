//
//  Created by 김건우 on 2022/11/12.
//

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let m: Int = input[1]
let card: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

var max: Int = -1
for i in 0..<card.count {
    for j in (i+1)..<card.count {
        for k in (j+1)..<card.count {
            let sum: Int = card[i] + card[j] + card[k]
            if max < sum && sum <= m {
                max = sum
            }
        }
    }
}
print(max)
