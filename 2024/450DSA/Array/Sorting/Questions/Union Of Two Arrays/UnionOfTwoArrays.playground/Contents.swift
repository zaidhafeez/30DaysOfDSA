import UIKit

func doUnion(arr1: inout [Int], arr2: inout [Int]) {
    var arr: [Int] = []
    var i = 0
    var j = 0
    var m = arr1.count
    var n = arr2.count
    
    while (i < m) {
        arr.append(arr1[i])
        i += 1
    }
    
    while (j < n) {
        arr.append(arr2[j])
        j += 1
    }
    arr.sort()
    var count = 1
    for i in 1..<arr.count {
        if arr[i] != arr[i - 1] {
            count += 1
        }
    }
    
    print(count)
}

var arr1 = [85, 25, 1, 32, 54, 6 ]//[1,2,3,4,5]
var arr2 = [85, 2]
doUnion(arr1: &arr1, arr2: &arr2)

