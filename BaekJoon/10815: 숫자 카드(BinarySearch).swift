//
//  Created by 김건우 on 2022/10/11.
//

import Foundation

func findCard(_ target: Int, array: [Int], start: Int, end: Int) -> Int {
    if start <= end {
        let mid: Int = (start+end) / 2
        
        if target == array[mid] {
            return 1
        } else if target < array[mid] {
            return findCard(target, array: array, start: start, end: mid-1)
        } else {
            return findCard(target, array: array, start: mid+1, end: end)
        }
    }
    
    return 0
}

let n: Int = Int(readLine()!)!
let card: [Int] = readLine()!.split(separator: " ")
                      .map { Int(String($0))! }.sorted()

let m: Int = Int(readLine()!)!
let find: [Int] = readLine()!.split(separator: " ")
                      .map { Int(String($0))!}

for f in find {
    print(findCard(f, array: card, start: 0, end: card.count-1), terminator: " ")
}
