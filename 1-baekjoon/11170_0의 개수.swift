import Foundation

let t: Int = Int(readLine()!)!

var result: [Int] = []
for _ in 0..<t {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m): (Int, Int) = (input[0], input[1])
    
    var count: Int = 0
    for i in n...m {
        var k: Int = i
        repeat {
            if k % 10 == 0 { // k에 0이 존재하는 경우
                count += 1 // 카운팅하기
            }
            k /= 10
        } while k != 0 // k가 0이 아닐 때까지 반복
    }
    result.append(count)
}
result.forEach { print($0) }
