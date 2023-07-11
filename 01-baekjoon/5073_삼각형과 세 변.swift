import Foundation

while true {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // 입력이 모두 0이라면
    guard !input.isAllElementEqual(with: 0) else {
        break // 루프 탈출하기
    }
    
    // 입력값을 오름차순으로 정렬하기
    input.sort(by: { $0 < $1 })
    
    // 기본적인 삼각형의 조건에 충족한다면
    if (input[0] + input[1]) > input[2] {
        // 모든 변의 길이가 동일하다면
        if input.isAllElementEqual() {
            print("Equilateral")
        // 두 변의 길이만 동일하다면
        } else if (input[0] == input[1]) || (input[0] == input[2]) || (input[1] == input[2]) {
            print("Isosceles")
        // 세 변의 길이가 모두 다르다면
        } else {
            print("Scalene")
        }
    // 기본적인 삼각형의 조건에 불충족한다면
    } else {
        print("Invalid")
    }
}

extension Array where Element: Numeric {
    func isAllElementEqual() -> Bool {
        for i in 0..<self.count-1 {
            if self[i] != self[i+1] {
                return false
            }
        }
        return true
    }
    
    func isAllElementEqual(with element: Element) -> Bool {
        for item in self {
            if item != element {
                return false
            }
        }
        return true
    }
}
