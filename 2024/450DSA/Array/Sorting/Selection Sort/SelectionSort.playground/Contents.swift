import UIKit

func selectionSort(arr: inout [Int]) {
    for i in arr.indices {
        var last = arr.count - i - 1
        var maxIndex = getMaxIndex(arr: &arr, start: 0, end: last)
        swap(arr: &arr, first: maxIndex, second: last)
    }
}

func getMaxIndex(arr: inout [Int], start: Int, end: Int) -> Int {
    var max = start
    for i in start...end {
        if arr[max] < arr[i] {
            max = i
        }
    }
    return max
}

func swap(arr: inout [Int], first: Int, second: Int) {
    let temp = arr[first]
    arr[first] = arr[second]
    arr[second] = temp
}

var arr = [-32, 4, -3, 2, 1, 0]
selectionSort(arr: &arr)
