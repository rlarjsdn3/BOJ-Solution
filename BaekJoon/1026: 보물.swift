//
//  Created by 김건우 on 2022/11/13.
//

import Foundation

let n: Int = Int(readLine()!)!
let a: [Int] = readLine()!.split(separator: " ")
                    .map { Int(String($0))! }.sorted(by: >) // 내림차순 정렬
let b: [Int] = readLine()!.split(separator: " ")
                    .map { Int(String($0))! }.sorted(by: <) // 오름차순 정렬

var result: Int = 0
for i in a.indices {
    result += (a[i] * b[i])
}
print(result)
