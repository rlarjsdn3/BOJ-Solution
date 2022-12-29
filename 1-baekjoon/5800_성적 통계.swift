import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!
// 각 반의 점수 입력 받기
var score: [[Int]] = []
for _ in 0..<t {
    score.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 각 반 별로 점수 정렬하기
for i in 0..<t {
    score[i].removeFirst(); score[i].sort()
}

// 결과값 출력
for i in 0..<t {
    var largestGap: Int = 0 // 인접한 수의 최대 차이를 저장하는 변수
    for j in 1..<score[i].count {
        let gap: Int = score[i][j] - score[i][j-1]
        if largestGap < gap {
            largestGap = gap
        }
    }
    
    print("Class \(i+1)")
    print("Max \(score[i][score[i].count-1]), Min \(score[i][0]), Largest gap \(largestGap)")
}
