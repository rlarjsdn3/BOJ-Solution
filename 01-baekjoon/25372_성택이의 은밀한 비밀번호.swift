import Foundation

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!
// T개의 문자열을 입력 받아, 유효한 비밀번호인지 확인하기
for _ in 0..<t {
    let count = readLine()!.count
    if 6 <= count && count <= 9 {
        print("yes")
    } else {
        print("no")
    }
}
