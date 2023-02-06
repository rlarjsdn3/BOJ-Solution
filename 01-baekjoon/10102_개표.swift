import Foundation

// 심사위원의 수 V 입력 받기
let v = Int(readLine()!)!

// 심사위원의 투표 정보 입력 받기
let votes = Array(readLine()!)

// 개표 하기
var winner = 0
for vote in votes {
    if vote == "A" {
        winner +=  1
    } else {
        winner -= 1
    }
}

// 결과값 출력하기
if winner > 0 {
    print("A")
} else if winner < 0 {
    print("B")
} else {
    print("Tie")
}
