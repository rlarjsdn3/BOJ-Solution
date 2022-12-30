import Foundation

// 양의 정수 N 입력 받기
let n: Int = Int(readLine()!)!

// 수 이어나가며 수열의 최대 개수 찾아보기
var result: [Int] = [] // 이어간 수를 저장하는 배열
for k in 1...n {
    var array: [Int] = [n, k]
 
    var i: Int = 1 // 배열 인덱스를 가리키는 변수
    var gap: Int = 0 // 이전 값과 현재 값을 뺀 값을 저장하는 변수
    while true {
        gap = array[i-1] - array[i] // 이전 값과 현재 값을 뺀 값이
        // 0보다 크거나 같은 경우
        if gap >= 0 {
            array.append(gap) // array 배열의 맨 뒤에 요소 추가하기
        } else {
            break // 루프 탈출하기
        }
        
        // 구해진 수열의 수가 이전 수열의 수보다 큰 경우
        if array.count > result.count {
            result = array // 새롭게 구한 수열로 결과 저장하기
        }
        
        i += 1
    }
}

// 결과값 출력하기
print(result.count)
result.forEach { print($0, terminator: " ") }
