import UIKit

func doUnion(arr1: inout [Int], arr2: inout [Int]) {
    var arr: [Int] = []
    var i = 0
    var j = 0
    var m = arr1.count
    var n = arr2.count
    while (i < m && j < n) {
        if arr1[i] < arr2[j] {
            arr.append(arr1[i])
            i += 1
        } else if arr1[i] > arr2[j] {
            arr.append(arr2[j])
            j += 1
        } else {
            arr.append(arr[i])
            i += 1
            j += 1
        }
    }
    
    while (i < m) {
        arr.append(arr1[i])
        i += 1
    }
    
    while (j < n) {
        arr.append(arr2[j])
        j += 1
    }
    print(arr)
}

var arr1 = [1,2,2,1]
var arr2 = [2,2]
doUnion(arr1: &arr1, arr2: &arr2)

