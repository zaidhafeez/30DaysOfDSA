import UIKit

// https://leetcode.com/problems/set-mismatch/
func findErrorNums(arr: inout [Int]) -> [Int] {
    var i = 0
    
    while i < arr.count {
        var correctIndex = arr[i] - 1
        if arr[i] != arr[correctIndex] {
            arr.swapAt(i, correctIndex)
        } else {
            i += 1
        }
    }
    
    for i in arr.indices {
        if arr[i] != i + 1 {
            return [arr[i], i + 1]
        }
    }
    return [-1, -1]
}

var arr = [2,1,4,2,6,5]
print(findErrorNums(arr: &arr))
