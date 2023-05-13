import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1]) // 바구니의 크기 N과 바구니의 순서를 바꾸는 횟수 M 입력 받기

var basket: [Int] = []
(1...n).forEach { basket.append($0) }

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j, k) = (input[0]-1, input[1]-1, input[2]-1) // begin번째 바구니, mid번째 바구니, end번째 바구니 입력받기
    
    let subRangeArray = basket[i..<k] // i~k번째 요소 뽑아내기
    basket.insert(contentsOf: subRangeArray, at: j+1) // j번째 요소 뒤에 뽑아낸 요소 삽입하기
    basket.removeSubrange(i..<k) // i~k번째 요소 삭제하기
}

// 결과값 출력하기
basket.forEach {
    print($0, terminator: " ")
}
