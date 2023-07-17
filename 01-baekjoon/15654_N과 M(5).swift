import Foundation

func backtracking() {
    // 수열의 개수가 M이 넘는다면
    if sequence.count >= m {
        result += sequence.map { String($0) }.joined(separator: " ")
        result += "\n" // 결과값을 저장하고
        return // 되돌아가기
    }
    
    for i in 0..<n {
        // 해당 요소에 접근이 가능하면
        if !check[i] {
            check[i] = true
            sequence.append(array[i])
            backtracking()
            sequence.removeLast()
            check[i] = false
        }
    }
}

// 수열 N과 길이 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 수열의 정보 입력받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
// 수열의 정보를 저장하는 배열 선언
var sequence = [Int]()
// 해당 수열에 접근 가능한지 여부를 확인하는 배열 선언
var check = [Bool](repeating: false, count: n)
// 결과값을 저장하는 변수 선언
var result: String = ""

// 백트래킹 알고리즘 수행
backtracking()
// 결과값 출력하기
print(result)
