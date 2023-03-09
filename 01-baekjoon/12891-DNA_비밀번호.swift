import Foundation

// String 확장
extension String {
    subscript(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

// Arithmetic 열거체
enum Operation: Int {
    case positive =  1
    case negative = -1
}

// 각 문자를 확인하여 카운팅하는 함수
func countACGT(_ element: String, operation: Operation) {
    switch element {
    case "A":
        count.a += operation.rawValue
    case "C":
        count.c += operation.rawValue
    case "G":
        count.g += operation.rawValue
    case "T":
        count.t += operation.rawValue
    default:
        break
    }
}

// DNA 비밀번호 요건을 충족하는지 확인하는 함수
func checkACGT() {
    if acgt.a <= count.a && acgt.c <= count.c && acgt.g <= count.g && acgt.t <= count.t {
        result += 1
    }
}

// DNA 문자열의 길이 N과 비밀번호로 사용할 부분 문자열의 길이 M 입력 받기
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 문자열 DNA 입력 받기
let dna = Array(readLine()!).map { String($0) }
// 부분 문자열에 포함되어야 할 'A', 'C', 'G', 'T'의 최소 개수 입력 받기
input = readLine()!.split(separator: " ").map { Int(String($0))! }
let acgt: (a: Int, c: Int, g: Int, t: Int) = (input[0], input[1], input[2], input[3])

// 결과값을 저장하기 위한 변수
var result = 0

// 슬라이딩 시작점 위치를 확인하고, 조건을 충족하는지 확인하기
var count: (a: Int, c: Int, g: Int, t: Int) = (0, 0, 0, 0)
for c in dna[0..<m] {
    countACGT(c, operation: .positive)
}
checkACGT()

// 문자열을 슬라이딩하며 조건을 충족하는지 확인하기
for i in m..<n {
    countACGT(dna[i], operation: .positive) // 신규 문자열 값 업데이트(더하기)
    countACGT(dna[i - m], operation: .negative) // 빼는 문자열 값 업데이트(빼기)
    
    checkACGT()
}
// 결과값 출력하기
print(result)
