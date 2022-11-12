//
//  Created by 김건우 on 2022/11/12.
//

import Foundation

var result: [String] = []
while true {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    if input[0]+input[1]+input[2] == 0 {
        break
    }
    
    let sqrt: Int = Int(sqrt(pow(Double(input[0]), 2) + pow(Double(input[1]), 2)))
    if sqrt == input[2] {
        result.append("right")
    } else {
        result.append("wrong")
    }
}
result.forEach { print($0) }
