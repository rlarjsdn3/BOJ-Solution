import Foundation

// 등급별 평점 초기화
let grades = [
    "A+": 4.5, "A0": 4.0,
    "B+": 3.5, "B0": 3.0,
    "C+": 2.5, "C0": 2.0,
    "D+": 1.5, "D0": 1.0,
    "F": 0.0
]

// 과목명, 학점과 등급 입력 받기
var totalScore = 0.0 // (교과목별 평점 * 학점 수)의 합계
var totalCredit = 0.0 // 총 학점 합계

for _ in 0..<20 {
    let input = readLine()!.split(separator: " ")
    // 해당하는 등급의 점수가 존재한다면(P가 아니라면)
    if let grade = grades[String(input[2])] {
        let credit = Double(input[1])!
        totalScore += (grade * credit)
        totalCredit += credit
    }
}
print(String(format: "%.6lf", totalScore / totalCredit)) // 결과값 출력하기
