import Foundation

// 아홉 난쟁이의 키 N 입력 받기
var dwarfs = [Int]()
for _ in 0..<9 {
    dwarfs.append(Int(readLine()!)!)
}

// 키 합이 100인 일곱 난쟁이 찾기
var result = [Int]()
for a in 0..<9 {
    for b in (a+1)..<9 {
        for c in (b+1)..<9 {
            for d in (c+1)..<9 {
                for e in (d+1)..<9 {
                    for f in (e+1)..<9 {
                        for g in (f+1)..<9 {
                            let sum = dwarfs[a] + dwarfs[b] + dwarfs[c]
                                + dwarfs[d] + dwarfs[e] + dwarfs[f]
                                + dwarfs[g]
                            if sum == 100 {
                                result = [dwarfs[a], dwarfs[b], dwarfs[c],
                                          dwarfs[d], dwarfs[e], dwarfs[f],
                                          dwarfs[g]]
                            }
                        }
                    }
                }
            }
        }
    }
}

result.sorted() // 오름차순으로 정렬
    .forEach { print($0) } // 결과 답안 출력
