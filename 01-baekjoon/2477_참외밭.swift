import Foundation

// 1m^2당 참외의 개수 K 입력 받기
let k: Int = Int(readLine()!)!
// 반 시계 방향으로 6개의 변 입력 받기
var rect: [(Int, Int)] = [] // 직사각형 정보를 저장하는 변수
var cont: [Int] = [Int](repeating: 0, count: 5) // 변의 개수를 저장하는 변수
for _ in 0..<6 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    rect.append((input[0], input[1]))
    cont[input[0]] += 1
}

// 긴 가로, 세로 길이 구하기
var long: [Int] = []
for i in 1..<5 {
    if cont[i] == 1 {
        long.append(rect.first { $0.0 == i }!.1)
    }
}

// 짧은 가로, 세로 길이 구하기
var short: [Int] = []
for i in 0..<6 {
    let next: Int = (i + 1) % 6
    let nnnnnext: Int = (i + 5) % 6
    
    let stdd: Int = (i + 3) % 6
    
    if (rect[next].1 + rect[nnnnnext].1) == rect[stdd].1 {
        short.append(rect[i].1)
    }
}

// 결과 출력하기 (평방 미터 당 참외 수 * (큰 면적 - 작은 면적))
print(k * ((long[0] * long[1]) - (short[0] * short[1])))
