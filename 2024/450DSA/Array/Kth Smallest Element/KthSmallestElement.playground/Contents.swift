import UIKit

func findkthSmallestElement(arr: inout [Int], k: Int) -> Int {
    guard k != 0 else {
        return Int.min
    }
    sort(arr: &arr)
    return arr[k - 1]
}

//Bubble Sort, Comparison Sorting Method, Syncing Sort, Exchange Sort
func sort(arr: inout [Int]) {
    var swapped = false
    for i in 0..<arr.count {
        for j in 1..<arr.count - i {
            if arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
//                let temp = arr[j]
//                arr[j] = arr[j - 1]
//                arr[j - 1] = temp
                swapped = true
            }
        }
        if(!swapped) {
            break
        }
    }
    print(arr)
}

var assumedArray = [7, 10, 4, 3, 20, 15]
let kth = 3

let result = findkthSmallestElement(arr: &assumedArray, k: kth)
print(result)
