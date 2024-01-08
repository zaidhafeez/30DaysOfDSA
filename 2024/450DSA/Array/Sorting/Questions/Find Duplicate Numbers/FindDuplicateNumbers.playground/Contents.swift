import UIKit

func findDuplicateNumbers(arr: inout [Int]) -> Int {
    var i = 0
    
    while i < arr.count {
        if arr[i] != i + 1 {
            let correctIndex = arr[i] - 1
            if arr[i] != arr[correctIndex] {
                arr.swapAt(i, correctIndex)
            } else {
                return arr[i]
            }
        } else {
            i += 1
        }
    }
    return -1
}

var arr = [3, 1, 3, 4, 2] //[1, 3, 4, 2, 2]
findDuplicateNumbers(arr: &arr)
print(findDuplicateNumbers(arr: &arr))
