import Foundation

func backtracking(_ x: Int, length: Int, sequence: inout [Int]) {
    // 수열의 길이가 M보다 커지면
    if length > m {
        // 수열을 출력하고
        print(sequence.map { String($0) }.joined(separator: " "))
        // 뒤로 되돌아가기
        return
    }
    // 1부터 N까지 수를 확인하며
    for i in 1...n {
        // 해당 수에 접근이 가능하다면
        if !check[i] {
            check[i] = true
            sequence.append(i)
            backtracking(i, length: length + 1, sequence: &sequence)
            sequence.removeLast()
            check[i] = false
        }
    }
}

// 정수 N과 수열 길이 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 해당 수에 접근 가능 여부를 알려주는 변수 초기화
var check = [Bool](repeating: false, count: n + 1)
// 수열을 만들어 저장하는 배열 초기화
var sequence = [Int]()

// 백트랙킹 알고리즘 수행
backtracking(1, length: 1, sequence: &sequence)
