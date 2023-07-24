import Foundation

// W대학 점수 정보를 저장하는 배열 선언
var wScore = [Int]()
// K대학 점수 정보를 저장하는 배열 선언
var kScore = [Int]()
// W대학 점수 정보 입력 받기
for _ in 0..<10 {
    wScore.append(Int(readLine()!)!)
}
// K대학 점수 정보 입력 받기
for _ in 0..<10 {
    kScore.append(Int(readLine()!)!)
}
// 각 대학 별로 점수 정렬하기
wScore.sort(by: { $0 > $1 })
kScore.sort(by: { $0 > $1 })
// 각 대학 별로 상위 3명의 점수 합 구하기
let wSum = Array(wScore.prefix(3)).sum()
let kSum = Array(kScore.prefix(3)).sum()
// 결과값 출력하기
print(wSum, kSum)

extension Array where Element: Numeric {
    func sum() -> Element {
        self.reduce(0, +)
    }
}
