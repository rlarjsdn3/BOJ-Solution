import Foundation

// 좌석의 수 N 입력 받기
let n = Int(readLine()!)!
// 좌석의 정보 C 입력 받기
let c = readLine()!

var count = 0 // 컵홀더를 사용할 수 없는 사람의 수
var index = 0 // 좌석 위치 추적
var visitedCoupleSeat = false // 커플석 최초 방문 여부 확인

// 좌석을 순회하며
while index < n {
    // 커플석에 다다르면
    if c[index] == "L" {
        // 이미 해당 좌석을 방문했다면
        if visitedCoupleSeat {
            count += 1
        }
        index += 2
        visitedCoupleSeat = true
    } else {
        index += 1
    }
}

print(n - count) // 결과 답안 출력

extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
