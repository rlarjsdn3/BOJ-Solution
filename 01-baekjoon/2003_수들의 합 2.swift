import Foundation

// 수열의 길이 M과 만들고자 하는 합 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 수열의 정보 입력 받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
// 결과값을 저장하기 위한 변수 선언
var result = 0

// 투 포인터를 위한 변수 선언
var sum = array[0]
var startIndex = 0
var endIndex = 0
// 투 포인터 알고리즘 수행
while endIndex < n {
    // 구간 합이 M과 동일하면
    if sum == m {
        endIndex += 1
        // 마지막 인덱스가 배열의 범위를 벗어나지 않는다면
        if endIndex < n {
            sum += array[endIndex]
        }
        result += 1
    // 구간 합이 M보다 크면
    } else if sum > m {
        sum -= array[startIndex]
        startIndex += 1
    // 구간 합이 M보다 작으면
    } else {
        endIndex += 1
        // 마지막 인덱스가 배열의 범위를 벗어나지 않는다면
        if endIndex < n {
            sum += array[endIndex]
        }
    }
}
// 결과값 출력하기
print(result)
