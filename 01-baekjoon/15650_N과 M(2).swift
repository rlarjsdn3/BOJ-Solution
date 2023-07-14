import Foundation

// 백트래킹 알고리즘 정의
func backtracking(_ result: inout [Int]) {
    // 수열의 길이가 M을 넘는다면
    if result.count >= m {
        // 수열을 출력하고
        print(result.map { String($0) }.joined(separator: " "))
        return // 되돌아가기
    }
    
    // 1부터 N까지 순회하며 (오름차순)
    for i in 1...n {
        // 배열의 마지막 요소를 추출할 수 있으며
        if let last = result.last {
            // 해당 요소에 방문하지 않았고, 마지막 요소가 지금 요소보다 크면
            if !check[i] && last < i {
                check[i] = true
                result.append(i)
                backtracking(&result)
                result.removeLast()
                check[i] = false
            }
        }
    }
}

// 수열 N과 길이 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 해당 수에 접근 가능한지 체크하는 배열 선언
var check = [Bool](repeating: false, count: n + 1)
// 만들어진 수열을 저장하는 배열 선언
var result = [Int]()

// 1부터 N까지 순회하며
for i in 1...n {
    // 결과값 출력하기
    result.append(i)
    backtracking(&result)
    result.removeLast()
}
