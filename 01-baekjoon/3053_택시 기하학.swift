import Foundation

// 반지름 R 입력 받기
let r = Double(readLine()!)!

// 유클리드 기하학에서의 원의 넓이
let PI = 3.141592653589793

let euclidArea = pow(r, 2) * PI
let taxiArea = pow(r, 2) * 2

// 결과값 출력하기
print(String(format: "%.6lf", euclidArea))
print(String(format: "%.6lf", taxiArea))
