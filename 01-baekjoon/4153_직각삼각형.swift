import Foundation

while true {
    // 삼각형의 각 변의 길이 입력 받기
    let input = readLine()!.split(separator: " ")
        .map { Double($0)! }.sorted()
    let (a, b, c) = (input[0], input[1], input[2])
    // 입력이 0이라면 반복문 탈출하기
    if a == 0 && b == 0 && c == 0 { break }
    
    // 답안 결과 출력
    if (pow(a, 2) + pow(b, 2)) == pow(c, 2) {
        print("right")
    } else {
        print("wrong")
    }
}
