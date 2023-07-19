// 백트래킹 알고리즘 정의
func backtracking() {
    // 수열의 길이가 M을 넘는다면
    if sequence.count >= m {
        result += sequence.joined(separator: " ")
        result += "\n" // 결과값에 추가하고
        return // 되돌아가기
    }
    // 1부터 N을 순회하며
    for i in 0..<n {
        sequence.append(String(array[i]))
        backtracking()
        sequence.removeLast()
    }
}

// 수열 N과 길이 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 수열의 정보 입력 받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
// 수열의 결과를 저장하는 배열 선언
var sequence = [String]()
// 결과값을 저장하는 변수 선언
var result: String = ""

// 백트래킹 알고리즘 수행
backtracking()
// 결과값 출력하기
print(result)
