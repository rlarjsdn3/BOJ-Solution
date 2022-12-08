import Foundation

let n: Int = Int(readLine()!)!

var k: Int = 1 // 타일 수를 계산하는 변수
var count: Int = 0 // 겹의 수를 계산하는 변수

// 계산된 타일 수가 더 커질 때까지 반복
while n > k {
    count += 1 // 1겹 증가
    k = k + (count * 6) // 증가된 겹을 기준으로 타일 수 계산
}

// 입력이 1인 경우
n == 1 ? print(1) : print(count + 1)
