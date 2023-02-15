// 문자열 A, B 입력 받기
let input = Array(readLine()!).split(separator: " ").map { Array($0) }
let (a, b) = (input[0], input[1])

// 문자열 A가 B에 얼마나 적게 차이나는지 구하기
var result = 51
for i in 0...(b.count - a.count) {
    var count = 0
    for j in 0..<a.count {
        if a[j] != b[j+i] {
            count += 1
        }
    }
    result = min(count, result)
}
print(result) // 결과값 출력하기
