import Foundation

// 삼각형의 크기 N 입력 받기
let n: Int = Int(readLine()!)!

// 삼각형의 정보 입력 받기
var triangle: [[Int]] = []
for _ in 0..<n {
    triangle.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 다이내믹 프로그래밍 수행(바텀업)
for i in 1..<n {
    for j in 0..<triangle[i].count {
        var left, right: Int
        
        // 오른쪽에서 내려오는 경우
        if j == 0 {
            left = 0
        } else {
            left = triangle[i - 1][j - 1]
        }
        
        // 왼쪽에서 내려오는 경우
        if j == i {
            right = 0
        } else {
            right = triangle[i - 1][j]
        }
        
        triangle[i][j] = triangle[i][j] + max(left, right)
    }
}

// 결과값 출력하기
var maxValue: Int = 0
for i in 0..<n {
    maxValue = max(maxValue, triangle[n - 1][i])
}
print(maxValue)
