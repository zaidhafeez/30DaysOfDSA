import UIKit


// https://leetcode.com/problems/missing-number/
func findMissingNumbers(arr: inout [Int]) {
    var i = 0;
    var result = 0
    while i < arr.count {
        var correctIndex = arr[i]
        if arr[i] < arr.count && arr[i] != arr[correctIndex] {
            arr.swapAt(i, correctIndex)
        } else {
            i += 1
        }
    }
    print(arr)
    
    ///search for first missing numbers
    for index in arr.indices {
        if arr[index] != index {
            result = index
            return
        }
    }
    
    //case 2
    result = arr.count
    print(result)
}

var arr = [0, 1, 2, 3]
findMissingNumbers(arr: &arr)
