import Foundation

// 오늘 팔린 책의 개수 N 입력 받기
let n = Int(readLine()!)!
// 팔린 책의 제목 및 개수 저장
var books = [String: Int]()
// N개의 팔린 책의 제목 입력 받기
for _ in 0..<n {
    let title = readLine()!
    let count = books[title] ?? 0
    books[title] = count + 1
}

// 책 정렬하기
let sortedBooks = books.sorted {
    // 팔린 책의 개수가 같다면
    if $0.value == $1.value {
        return $0.key < $1.key // A-Z 사전 순으로 정렬
    }
    return $0.value > $1.value // 개수가 높은 순으로 정렬
}
// 결과 답안 출력
print(sortedBooks[0].key)
