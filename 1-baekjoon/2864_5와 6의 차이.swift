import Foundation

extension Int {
    static func intValue(_ array: [Character]) -> Int {
        return Int(String(array))!
    }
}

// 두 정수 A, B 입력 받기
let input: [String] = readLine()!.split(separator: " ").map { String($0) }
var array: [[Character]] = [Array(input[0]), Array(input[1])]

// 두 수의 최대합 구하기
var max: Int = 0
for i in 0..<2 {
    array[i] = array[i].map {
        if $0 == "5" {
            return "6"
        }
        
        return $0
    }
}
max = Int.intValue(array[0]) + Int.intValue(array[1])

// 두 수의 최소합 구하기
var min: Int = 0
for i in 0..<2 {
    array[i] = array[i].map {
        if $0 == "6" {
            return "5"
        }
        
        return $0
    }
}
min = Int.intValue(array[0]) + Int.intValue(array[1])

print("\(min) \(max)") // 결과값 출력하기
