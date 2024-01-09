import UIKit

// https://leetcode.com/problems/find-all-duplicates-in-an-array/
func findAllDuplicates(arr: inout [Int]) {
    var i = 0;
    var ans: [Int] = []
    while i < arr.count {
        var correctIndex = arr[i] - 1
        if arr[i] != arr[correctIndex] {
            arr.swapAt(i, correctIndex)
        } else {
            i += 1
        }
    }
    
    for i in 0..<arr.count {
        if arr[i] != i + 1 {
            ans.append(arr[i])
        }
    }
    
    print("ans", ans)
}

var array = [1,1,2] //[4, 3, 2, 7, 8, 2, 3, 1]
findAllDuplicates(arr: &array)
