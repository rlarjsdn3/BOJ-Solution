import Foundation

// 성적 입력 받기
let c: String = readLine()!
// 성적 평점과 점수 변수
let grade: [String:Double] = ["A+": 4.3, "A0": 4.0, "A-": 3.7,
                              "B+": 3.3, "B0": 3.0, "B-": 2.7,
                              "C+": 2.3, "C0": 2.0, "C-": 1.7,
                              "D+": 1.3, "D0": 1.0, "D-": 0.7,
                              "F": 0.0]
print(grade[c]!) // 결과값 출력하기
