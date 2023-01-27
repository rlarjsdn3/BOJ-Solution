import Foundation

extension String {
    func digitSum() -> Int {
        var sum: Int = 0
        for i in self {
            let ascii: Int = Int(UnicodeScalar(String(i))!.value)
            if 48 <= ascii && ascii <= 57 {
                sum += (ascii - 48)
            }
        }
        return sum
    }
}

// 기타의 개수 N 입력 받기
let n: Int = Int(readLine()!)!

// 기타 정보 입력 받기
var guitar: [String] = []
for _ in 0..<n {
    guitar.append(readLine()!)
}

// 기타 정보 정렬하기
guitar.sort {
    if $0.count == $1.count {
        if $0.digitSum() == $1.digitSum() {
            return $0 < $1
        }
        
        return $0.digitSum() < $1.digitSum()
    }

    return $0.count < $1.count
}
guitar.forEach { print($0) } // 결과값 출력하기
