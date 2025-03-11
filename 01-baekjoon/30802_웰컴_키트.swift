import Foundation

// 참가자 수 N 입력 받기
let n = Int(readLine()!)!
// 티셔츠 사이즈별 개수 입력 받기
let shirtSizes = readLine()!.split(separator: " ").map { Int($0)! }
// 티셔츠 및 연필 묶음 당 개수 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (shirtsPerBundle, pencilsPerBundle) = (input[0], input[1])

// 티셔츠 사이즈별 주문할 묶음 개수 저장
var shirtBundles = [Int](repeating: 0, count: 6)

// 각 티셔츠 사이즈를 순회하며 최소 묶음 개수 계산
for (index, size) in shirtSizes.enumerated() {
    shirtBundles[index] += (size % shirtsPerBundle == 0) ? (size / shirtsPerBundle) : (size / shirtsPerBundle + 1)
}
let totalShirtBundles = shirtBundles.reduce(0, +)

// 최소 연필 묶음과 추가 연필 개수 계산
let totalPencilBundles = n / pencilsPerBundle
let remainingPencils = n % pencilsPerBundle
// 결과 답안 출력
print(totalShirtBundles)
print(totalPencilBundles, remainingPencils)
