import Foundation

// 백트래킹 알고리즘 정의
func backtracking() {
    // 수열의 길이가 M을 넘는다면
    if sequence.count >= m {
        // 마지막 수열과 현재 수열이 같지 않다면
        if !set.contains(sequence)  {
            set.insert(sequence)
            result += sequence.map { String($0) }.joined(separator: " ")
            result += "\n" // 결과값으로 추가하고
            return // 되돌아가기
        }
        return
    }
    
    // 0부터 N-1까지 순회하며
    for i in 0..<n {
        // 해당 수에 아직 방문하지 않으면
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
// 수열의 정보 입력 받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
// 지난 수열 정보를 저장하는 집합 선언
var set = Set<[Int]>()
// 수열의 정보를 저장하는 배열 선언
var sequence = [Int]()
// 해당 수열에 방문했는지 체크하는 배열 선언
var check = [Bool](repeating: false, count: n + 1)
// 결과값을 저장하는 변수 선언
var result: String = ""

// 백트래킹 알고리즘 수행
backtracking()
// 결과값 출력하기
print(result)
