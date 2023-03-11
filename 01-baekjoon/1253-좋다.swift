import Foundation

// 수의 개수 N 입력 받기
let n = Int(readLine()!)!
// N개의 수의 값 입력 받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
// 결과값을 저장하기 위한 변수 초기화
var result = 0

// 투 포인트 알고리즘으로 '좋은 수' 구하기
for k in 0..<n {
    let find = array[k]
    var i = 0, j = n - 1 // 시작점과 끝점 초기화
    
    while i < j {
        let sum = array[i] + array[j]
        // 찾는 값이 합계보다 큰 경우
        if find > sum {
            i += 1 // 시작점 증가
        // 찾는 값이 합계보다 작은 경우
        } else if find < sum {
            j -= 1 // 끝점 감소
        // 찾는 값이 합계와 동일한 경우
        } else {
            // 포인트 위치가 K 위치와 동일하지 않은 경우
            if i != k && j != k {
                result += 1 // 결과값 증가하고 루프 탈출
                break
            // 포인트 위치 I가 K와 동일한 경우
            } else if i == k {
                i += 1
            // 포인트 위치 J가 K와 동일한 경우
            } else if j == k {
                j -= 1
            }
        }
    }
}
// 결과값 출력하기
print(result)
