import Foundation

let input: [Int] = readLine()!.split(separator:  " ").map { Int(String($0))! }
let n: Int = input[0] // 나무의 수
let m: Int = input[1] // 절단하고자 하는 나무의 총 길이
let trees: [Int] = readLine()!.split(separator: " ")
                        .map { Int(String($0))! }.sorted() // 개별 나무 높이

var start: Int = 0
var end: Int = trees[n - 1]

var result: Int = 0
while start <= end {
    // 나무를 자를 기준점 설정
    let mid: Int = (start + end) / 2

    // 기준점에 따라 나무를 절단한 총 길이 계산
    var total: Int = 0
    for tree in trees {
        if (tree - mid) > 0 {
            total += (tree - mid)
        }
    }

    // 절단한 나무의 총 길이가 원하는 나무의 총 길이보다 작으면
    if total < m {
        // 기준점 내려 절단한 나무의 총 길이 늘리기
        end = mid - 1
    } else {
        // 기준점 올려 절단한 나무의 총 길이 줄이기
        start = mid + 1
    }
}
print(start - 1)
