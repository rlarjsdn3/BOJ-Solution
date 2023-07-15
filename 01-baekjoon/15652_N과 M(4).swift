import Foundation

// 백트래킹 알고리즘 정의
func backtracking() {
    // 수열의 길이가 M을 넘는다면
    if seq.count >= m {
        result += seq.map { String($0) }.joined(separator: " ") // 결과값을 저장하고
        result += "\n"
        return // 되돌아가기
    }
    // 1부터 N까지 순회하며
    for i in 1...n {
        // 수열이 비어있다면
        if seq.isEmpty {
            seq.append(i)
            backtracking()
            seq.removeLast()
        // 수열이 하나라도 있으면
        } else {
            // 마지막 요소보다 더 크면
            if seq.last! <= i {
                seq.append(i)
                backtracking()
                seq.removeLast()
            }
        }
    }
}

// 수열 N과 길이 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 수열을 저장할 배열 선언
var seq = [Int]()
// 결과값을 저장할 변수 선언
var result = ""

// 백트래킹 알고리즘 수행
backtracking()
// 결과값 출력하기
print(result)
