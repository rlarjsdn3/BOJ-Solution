import Foundation

// 테스트케이스의 수 T 입력 받기
let t = Int(readLine()!)!
// 7개의 정수 입력 받아 짝수의 합과 최소값 구하기
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let even = input.filter { $0 % 2 == 0 }
    
    let evenSum = even.reduce(0, +)
    let evenMin = even.min()!
    
    // 결과값 출력하기
    print(evenSum, evenMin)
}
