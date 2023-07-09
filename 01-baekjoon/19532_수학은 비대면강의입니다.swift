import Foundation

// 정수 A, B, C, D, E, F 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b, c, d, e, f) = (input[0], input[1], input[2], input[3], input[4], input[5])
// 조건에 만족하는지 모든 값을 대입하여 계산해보기
let range = -999...999
for x in range {
    for y in range {
        let exp1 = (a * x) + (b * y)
        let exp2 = (d * x) + (e * y)
        // 조건에 만족하면 결과값 출력하기
        if exp1 == c && exp2 == f {
            print(x, y, separator: " ")
            break
        }
    }
}
