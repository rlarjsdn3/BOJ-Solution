import Foundation

// 입력된 좌표값이 몇 개인지 저장할 이차원 배열(x, y 각각)
var point: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 1_001), count: 2)
for _ in 0..<3 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    // 이차원 배열(x, y 각각) 해당되는 수 1 증가
    for i in 0..<2 {
        point[i][input[i]] += 1
    }
}

for i in 0..<2 {
    // 입력된 개수가 1인 인덱스를 반환 가능한 경우
    if let idx: Int = point[i].firstIndex(where: { $0 == 1 }) {
        print(idx, terminator: " ") // 결과 출력
    }
}
print() // 개행
