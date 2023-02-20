import Foundation

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!
// 결과값을 저장하는 변수
var result: [[String]] = [[String]](repeating: [String](), count: t)
// T개의 정수 N 입력 받기
for i in 0..<t {
    var n = Int(readLine()!)!
    
    // 2진수를 구하기
    var j = 0
    while n != 0 {
        // '1'을 구하면
        if n % 2 == 1 {
            result[i].append(String(j)) // 해당 위치 저장하기
        }
        n /= 2
        j += 1
    }
}

// 결과값 출력하기
for i in 0..<result.count {
    print(result[i].joined(separator: " "))
}
