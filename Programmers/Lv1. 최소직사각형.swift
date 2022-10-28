import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var w: Int = 0
    var h: Int = 0
    
    for size in sizes {
        w = max(w, max(size[0], size[1]))
        h = max(h, min(size[0], size[1]))
    }
    
    return w * h
}

print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
