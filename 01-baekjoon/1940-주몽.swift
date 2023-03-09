import Foundation

// 재료의 개수 N 입력 받기
let n = Int(readLine()!)!
// 갑옷을 만드는 데 필요한 수 M 입력 받기
let m = Int(readLine()!)!
// 재료의 고유한 번호 정보 입력 받기
var array = readLine()!.split(separator: " ").map { Int(String($0))! }
// 재료 번호를 오름차순으로 정렬
array.sort()

// 결과값을 저장하기 위한 변수
var result = 0
// 시작점과 끝점 정의
var start = 0, end = array.count - 1

while start < end {
    let total = array[start] + array[end]
    
    // 두 개의 재료 번호의 합이 M보다 작으면
    if total < m {
        start += 1 // 시작점 증가
    } else {
        // 두 개 재료 번호의 합이 M과 같으면
        if total == m {
            result += 1
        }
        end -= 1 // 끝점 감소
    }
}
// 결과값 출력하기
print(result)
