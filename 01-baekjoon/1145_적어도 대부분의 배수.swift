import Foundation

// 자연수 5개 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

// 대부분의 배수 구하기
var i = 1
while true {
    var count = 0
    for j in 0..<5 where i % input[j] == 0 {
        count += 1
    }
    
    if count >= 3 {
        break
    }
    i += 1
}
print(i) // 결과값 출력하기
