import Foundation

// 재환이가 가장 길게 낼 수 있는 'ah' 입력하기
let me = readLine()!
// 의사가 요구하는 'ah' 입력하기
let doctor = readLine()!

print(me.count >= doctor.count ? "go" : "no") // 결과값 출력하기
