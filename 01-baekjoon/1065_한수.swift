import Foundation

// 자연수 N 입력 받기
let s = readLine()!

let n = Int(s)!

// 1부터 N까지 순회하며 해당 수가 한수인지 판별하기
var count = 0
for i in 1...n {
    // 1~99는 모두 수열이므로 횟수 1 증가
    if i <= 99 {
        count += 1
        continue
    }
    
    var isHansu = true
    let str = String(i)
    let seq = str.at(1) - str.at(0)
    // 해당 수의 자릿수를 순회하며 수열을 만족하는지 확인하기
    for j in 1..<str.count {
        let diff = str.at(j) - str.at(j-1)
        if seq != diff {
            isHansu = false
            break
        }
    }
    // 한수가 맞다면
    if isHansu {
        count += 1
    }
}
// 결과 답안 출력
print(count)

extension String {
    func at(_ index: Int) -> Int {
        Int(self[index])!
    }
    subscript(index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
    subscript(index: Int) -> String {
        String(self[index])
    }
}

