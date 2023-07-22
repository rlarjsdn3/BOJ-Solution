import Foundation

// 학교 약칭을 저장하는 딕셔너리 선언
var schoolName = [
    "NLCS": "North London Collegiate School",
    "BHA": "Branksome Hall Asia",
    "KIS": "Korea International School",
    "SJA": "St. Johnsbury Academy"
]
// 학교 약칭 입력받기
let input = readLine()!
// 학교 약칭에 맞는 풀네임 출력하기
print(schoolName[input]!)
