import Foundation

extension Array where Element: Numeric {
    func sum() -> Element {
        return self.reduce(0, +)
    }
}

// 아홉 난쟁이의 모자 정보 입력받기
var dwarf: [Int] = []
for _ in 0..<9 {
    dwarf.append(Int(readLine()!)!)
}

// 합이 100이 되는 난쟁이 경우의 수 찾기
let sum: Int = dwarf.sum()
for i in 0..<9 {
    for j in (i+1)..<9 {
        if (sum - (dwarf[i] + dwarf[j])) == 100 {
            dwarf[i] = -1 // 해당 난쟁이 삭제
            dwarf[j] = -1 // ...
        }
    }
}

// 결과값 출력하기
dwarf.forEach {
    if $0 != -1 {
        print($0)
    }
}
