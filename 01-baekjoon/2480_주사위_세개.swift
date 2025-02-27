import Foundation

// 주사위의 눈 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (first, second, third) = (input[0], input[1], input[2])

var result = 0 // 상금

// 세 개의 주사위 중 두 개가 동일하다면
if first == second && first == third && second == third {
    result = 10_000 + (first * 1000)
} else {
    if first == second || first == third {
        result = 1000 + (first * 100)
    } else if second == third {
        result = 1000 + (second * 100)
    } else {
        result = 100 * max(first, second, third)
    }
}

print(result) // 결과 답안 출력
