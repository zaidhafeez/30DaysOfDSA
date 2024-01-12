import UIKit

func rotateArray(arr: inout [Int]) {
    var start = 0
    var last = arr.count - 1
    while (start < last) {
        arr.swapAt(start, last)
        start += 1
    }
}

var array = [9, 8, 7, 6, 4, 2, 1, 3]// [1, 2, 3, 4, 5]
rotateArray(arr: &array)
print(array)
