//
//  Created by 김건우 on 2022/10/11.
//

import Foundation

let n: Int = Int(readLine()!)!
let card: Set<Int> = Set<Int>(readLine()!
                         .split(separator: " ").map { Int(String($0))! })

let m: Int = Int(readLine()!)!
let find: [Int] = readLine()!.split(separator: " ")
                      .map { Int(String($0))!}

for f in find {
    if card.contains(f) {
        print(1, terminator: " ")
    } else {
        print(0, terminator: " ")
    }
}
