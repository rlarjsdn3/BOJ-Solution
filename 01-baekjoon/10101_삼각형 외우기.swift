import Foundation

// 세 개의 각도 정보를 입력 받을 변수
var angles = [Int]()
// 세 개의 각도 정보 입력 받기
for _ in 0..<3 {
    angles.append(Int(readLine()!)!)
}
// 세 각의 크기가 모두 60이라면
if angles.isAllElementEqual(with: 60) {
    print("Equilateral")
// 세 각의 합이 180이고, 세 각 중 두 각이 동일하다면
} else if angles.isSumElementEqual(with: 180)
            && (angles[0] == angles[1] || angles[1] == angles[2] || angles[0] == angles[2]) {
    print("Isosceles")
} else if angles.isSumElementEqual(with: 180) {
    print("Scalene")
} else {
    print("Error")
}

extension Array where Element: Numeric {
    func isAllElementEqual(with element: Element) -> Bool {
        for item in self where item != element {
            return false
        }
        return true
    }
    
    func isSumElementEqual(with element: Element) -> Bool {
        self.reduce(0, +) == element
    }
}
