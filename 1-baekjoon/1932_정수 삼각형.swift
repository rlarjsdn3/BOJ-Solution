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
        var left: Int = 0
        var right: Int = 0
        
        // 가장 왼쪽 수인 경우
        if j == 0 {
            right = triangle[i - 1][0]
        // 가장 오른쪽 수인 경우
        } else if j == triangle[i].count - 1 {
            left = triangle[i - 1][triangle[i - 1].count - 1]
        // 가운데 수인 경우
        } else {
            left = triangle[i - 1][j - 1]
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
