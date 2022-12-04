import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

var dict: [String: Int] = [:] // 입력으로 '문자열'이 주어지면 답을 찾아내는 변수
var arr: [String] = [""] // 입력으로 '정수'가 주어지면 답을 찾아내는 변수
for i in 0..<n {
    let input: String = readLine()!
    dict[input] = i+1
    arr.append(input)
}

for _ in 0..<m {
    let input: String = readLine()!
    // 입력이 '정수'인 경우
    if let index: Int = Int(input) {
        print(arr[index]) // 포켓몬 이름을 찾아내어 출력
    } else {
        print(dict[input]!) // 포켓몬 번호를 찾아내어 출력
    }
}
