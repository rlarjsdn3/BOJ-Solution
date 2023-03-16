import Foundation

// 결과값을 저장할 변수
var result = [String]()
// 완전수 구하기
while true {
    // 정수 N 입력 받기
    let n = Int(readLine()!)!
    // 약수의 합을 저장할 변수
    var sum = 1
    // 약수를 저장할 변수
    var divisor = [1]
    // N이 -1이라면 while문 탈출
    guard n != -1 else { break }
    
    for i in stride(from: 2, through: Int(sqrt(Double(n))), by: 1) {
        // 약수이면 더하기
        if n % i == 0 {
            sum += (i + n / i)
            divisor.append(contentsOf: [i, n / i])
        }
    }
    divisor.sort() // 약수 정렬하기
    
    // 완전수이면
    if sum == n {
        result.append("\(n) = \(divisor.map { String($0) }.joined(separator: " + "))")
    // 완전수가 아니면
    } else {
        result.append("\(n) is NOT perfect.")
    }
}
// 결과값 출력하기
result.forEach {
    print($0)
}
