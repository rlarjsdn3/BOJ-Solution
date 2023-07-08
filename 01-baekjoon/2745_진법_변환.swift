import Foundation

// 수 N과 진법 B 입력 받기
let input = readLine()!.split(separator: " ").map { String($0) }
let (n, b) = (input[0], Int(input[1])!)
// 결과값을 저장하는 변수
var result = 0
// 자릿수 위치를 저장하는 변수
var digit = Double(n.count - 1)
// 각 문자를 하나씩 순회하며 10진법으로 변환
for c in n {
    // 해당 문자가 문자인 경우
    if c.isLetter {
        let num = (Double(c.asciiValue!) - 55.0)
        result += Int(pow(Double(b), digit) * num)
    // 해당 문자가 숫자인 경우
    } else if c.isNumber {
        let num = (Double(c.asciiValue!) - 48.0)
        result += Int(pow(Double(b), digit) * num)
    }
    digit -= 1
}
// 결과값 출력
print(result)
