//
//  Created by 김건우 on 2022/11/17.
//

import Foundation

func combination(_ nums: [Int], targetNum: Int) -> [[Int]] {
    var result: [[Int]] = []
    var visited: [Bool] = [Bool](repeating: false, count: nums.count)
    
    func combi(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            if visited[i] == true {
                continue
            } else {
                visited[i] = true
                combi(i+1, nowCombi + [nums[i]])
                visited[i] = false
            }
        }
    }
    
    combi(0, [])
    return result
}

var combi: [[Int]] = combination([0, 1, 2, 3, 4, 5, 6, 7, 8], targetNum: 7)
var dwarf: [Int] = []
for _ in 0..<9 {
    dwarf.append(Int(readLine()!)!)
}

var result: [Int] = []
for i in 0..<combi.count {
    result = []
    var sum: Int = 0
    for j in 0..<combi[i].count {
        result.append(dwarf[combi[i][j]])
        sum += dwarf[combi[i][j]]
    }
    
    if sum == 100 { break }
}
result.sorted().forEach { print($0) }
