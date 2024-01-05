import UIKit


/*:
  For more information, - SeeAlso: [The Cycle Sort.](https://www.youtube.com/watch?v=JfinxytTYFQ&list=PL9gnSGHSqcnr_DxHsP7AW9ftq0AtAyYqJ&index=20&ab_channel=KunalKushwaha)
*/

/// use this algorithm when there is a range from [0, n] or [1, n]
func cyclicSort(arr: inout [Int]) {
    var i = 0
    while i < arr.count {
        var correctIndex = arr[i] - 1
        if arr[i] != arr[correctIndex] {
//            arr.swapAt(i, correctIndex)
            swap(arr: &arr, first: i, second: correctIndex)
        } else {
            i += 1
        }
    }
    print(arr)
}

func swap(arr: inout [Int], first: Int, second: Int) {
    var temp = arr[first]
    arr[first] = arr[second]
    arr[second] = temp
}

var array = [3,5,2,1,4]
cyclicSort(arr: &array)
