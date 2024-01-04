import UIKit

func insertionSort(arr: inout [Int]) {
    for i in 0...arr.count - 2 {
        for j in stride(from: i+1, to: 0, by: -1) {
            if arr[j] < arr[j-1] {
                arr.swapAt(j, j-1)
            } else {
                break
            }
        }
    }
    print(arr)
}
var array = [0, 2, 1, 2, 0]
insertionSort(arr: &array)
