import Foundation

// 테스트 케이스의 개수 T 입력 받기
let t = Int(readLine()!)!

// 테스트 케이스의 개수만큼 OX퀴즈 입력 받기
for _ in 0..<t {
    let ox = readLine()!
        
    var result = 0 // 점수 저장
    var countO = 0 // 연속된 O의 개수 저장
    
    // OX문자열을 순회하며 점수 계산
    for c in ox {
        // 문자가 O라면
        if c == "O" {
            countO += 1
            result += countO
        // 문자가 X라면
        } else {
            countO = 0
        }
    }
    
    print(result) // 결과 답안 출력
}
