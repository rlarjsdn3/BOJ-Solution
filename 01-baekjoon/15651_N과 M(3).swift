import Foundation

// 백트래킹 알고리즘 정의
func backtracking() {
    // 수열의 길이가 M을 넘는다면
    if sequence.count >= m {
        // 수열을 출력하고
        result += sequence.map { String($0) }.joined(separator: " ")
        result += "\n"
        return // 되돌아가기
    }
    
    // 1부터 N까지 순회하며
    for i in 1...n {
        sequence.append(i)
        backtracking()
        sequence .removeLast()
    }
}

// 수열 N과 길이 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 수열을 저장하는 배열 선언
var sequence = [Int]()
// 결과값을 저장하는 변수 선언
var result = ""
// 백트래킹 알고리즘 수행
backtracking()
// 결과값 출력하기
print(result)

// NOTE: - print() 함수는 매우 느리므로 여러 번 출력하는 게 아니라
//       - 한번에 모아 출력하는 게 성능 상 이점을 얻을 수 있습니다.
