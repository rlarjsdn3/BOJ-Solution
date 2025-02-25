import Foundation

var index = 0
// 0이 입력될 때까지 무한루프
while true {
    // L, P, V 입력 받기
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, p, v) = (input[0], input[1], input[2])
    if l == 0 && p == 0 && v == 0 { break }
    index += 1
    
    // 이용가능한 최대 일수 구하기
    var result = (v / p) * l
    let remaining = v % p
    
    // 연속 이용 가능일이 남은 휴가 일수보다 크다면
    if l > remaining {
        result += remaining
    // 연속 이용 가능일이 남은 휴가 일수와 같거나 더 작다면
    } else {
        result += l
    }
    
    print("Case \(index): \(result)") // 답안 결과 출력
}
