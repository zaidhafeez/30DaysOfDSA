import UIKit

func firstMissingPositive(arr: inout [Int]) -> Int {
    var i = 0
    while i < arr.count {
        var correctIndex = arr[i] - 1
        if arr[i] > 0 && arr[i] <= arr.count && arr[i] != arr[correctIndex] {
            arr.swapAt(i, correctIndex)
        } else {
            i += 1
        }
    }
    
    for i in arr.indices {
        if arr[i] != i + 1 {
          return i+1
        }
    }
    
    return arr.count + 1
}

var array = [7,8,9,11,12]//[3,4,-1,1]//[1,2,0]
print(firstMissingPositive(arr: &array))
