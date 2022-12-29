import Foundation

var result: [Int] = []
while true {
    // 사용 일수 L, 연속 캠핑일 P, 휴가 일수 V 입력 받고
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (l, p, v): (Int, Int, Int) = (input[0], input[1], input[2])

    // 모든 입력이 0인 경우
    if (l + p + v) == 0 {
        break
    }

    // 최대 가능 캠핑일 구하기
    var camp: Int = (v / p) * l
    if v % p > l {
        camp += l
    } else {
        camp += v % p
    }
    result.append(camp)
}

// 결과값 출력하기
for i in result.indices {
    print("Case \(i+1): \(result[i])")
}
