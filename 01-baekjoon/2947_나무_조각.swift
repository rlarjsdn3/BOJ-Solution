import Foundation

// 나무 조각 5개 입력 받기
var sticks = readLine()!.split(separator: " ")
// 나무 조각 위치가 뒤바꼈는지 확인
var hasChanged = true

// 나무 조각 위치가 바뀌지 않을 때까지 반복
while hasChanged {
    hasChanged = false
    for i in 1...4 {
        if sticks[i-1] > sticks[i] {
            sticks.swapAt(i-1, i)
            sticks.forEach { print($0, terminator: " ") }; print() // 답안 결과 출력
            hasChanged = true
        }
    }
}
