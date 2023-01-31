import Foundation

// 과일의 개수 N과 스네이크 버드의 초기 길이 L 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var (n, l): (Int, Int) = (input[0], input[1])

// 과일의 정보 입력 받기
var fruits: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

// 과일을 하나씩 먹어가며, 최대 길이 찾기
for fruit in fruits {
    if l >= fruit {
        l += 1
    } else {
        break
    }
}
print(l) // 결과값 출력하기
