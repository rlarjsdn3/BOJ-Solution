import Foundation

// 고양이 N마리 입력 받기
var n = Int(readLine()!)!

var result = 0 // 마법을 부린 횟수
var numberOfCats = 0 // 현 고양이 마릿수

if n > 0 {
    // 고양이 1마리 추가하기
    result += 1
    numberOfCats = 1
    // 고양이 마릿수가 목표치에 도달할 때까지
    while n > numberOfCats {
        // 복제 마법 행동하기
        result += 1
        numberOfCats *= 2
    }
}

print(result) // 결과 답안 출력
