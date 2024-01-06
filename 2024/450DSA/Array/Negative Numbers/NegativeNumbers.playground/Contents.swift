import UIKit

// https://www.geeksforgeeks.org/problems/move-all-negative-elements-to-end1813/1
func moveAllNegativeNumbers(arr: inout [Int]) {
    var outputArr: [Int] = [Int](repeatElement(0, count: arr.count))
    var j = 0
    for i in arr.indices {
        if arr[i] > 0 {
            outputArr[j] = arr[i]
            j += 1
        }
    }
    for i in arr.indices {
        if j < arr.count, arr[i] < 0 {
            outputArr[j] = arr[i]
            j += 1
        }
    }
    print(outputArr)
}

//// optimized Soln but in this order is not preserve
func singleLoopMoveAllNegativeNumbers(arr: inout [Int]) {
    var i = 0
    var j  = arr.count - 1
    while i < j {
        if arr[i] < 0, arr[j] >= 0 {    // i = 0, j = 0, i = 1, j = 1, i = 2, j=
            arr.swapAt(i, j) //[-5, -3, 7, -4, 9, 10, -1, 11]
            i += 1
            j -= 1
        } else if arr[i] >= 0 {
            i += 1
        } else {
            j -= 1
        }
    }
    print(arr)
}
    
var arr = [1, -1, 3, 2, -7, -5, 11, 6]
// order is preserve
moveAllNegativeNumbers(arr: &arr)
// [1,3,2,11,6,-1,-7,-5]
// order is not preserve
singleLoopMoveAllNegativeNumbers(arr: &arr)
//[1, 6, 3, 2, 11, -5, -7, -1]
