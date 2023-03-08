import Foundation

// 자연수 N 입력 받기
let n = Int(readLine()!)!
// 결과값을 저장할 변수
var result = 0

var array = [Int]()
// 연속된 자연수를 담은 배열 만들기
for i in 1...n {
    array.append(i)
}

var j = 0 // 끝점을 가리키는 포인터
var total = 1 // 연속된 자연수 합을 저장할 변수

// 시작점을 하나씩 증가시키며
for i in 0..<n {
    // 연속된 자연수 합이 N보다 작다면
    while total < n {
        j += 1
        total += array[j] // 끝점을 증가시키며 더하기
    }
    
    // 연속된 자연수 합이 N과 같다면
    if total == n {
        result += 1 // 결과값 1 증가
    }
    // (앞서 while문을 통해) total이 N보다 커지게 되었으므로 시작점 증가시키며 total 감소
    total -= array[i]
}
// 결과값 출력하기
print(result)
