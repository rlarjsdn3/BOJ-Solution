import Foundation

// 정수 N과 K 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k): (Int, Int) = (input[0], input[1])
// 소수 판별을 위한 배열 선언
var prime: [Bool] = [Bool](repeating: true, count: n + 1)
// 횟수 카운팅을 위한 변수 선언
var count: Int = 1

var result: Int = 0 // 결과를 저장하는 변수

// 에라토스테네스의 체 수행
outer: for i in 2...n {
    var j: Int = 1
    
    inner: while i*j <= n {
        if prime[i * j] {
            prime[i * j] = false
            
            // 카운팅을 증가하고 k에 도달한 경우
            if count == k {
                result = i * j // 결과값 저장
                break outer
            }
            count += 1
        }
        j += 1
    }
}
print(result)
