import Foundation

// 목적지 방 번호 N 입력 받기
let n = Int(readLine()!)!

var number = 1 // 한겹당 층의 최대 번호
var result = 1 // 지나가는 방의 개수 저장
while n > number {
    number += (result * 6)
    result += 1 
}
print(result) // 결과 답안 출력
