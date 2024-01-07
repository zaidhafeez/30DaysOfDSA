import UIKit

// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
func findDisappearedNumbers(arr: inout [Int]) {
        var i = 0
        while i < arr.count {
            let correctIndex = arr[i] - 1
            if arr[i] != arr[correctIndex] {
                swap(arr: &arr, first: i, second: correctIndex)
            } else {
                i += 1
            }
        }
        var ans: Array<Int> = Array()
        for i in arr.indices {
            if arr[i] != i + 1 {
                ans.append(i+1)
            }
        }
        print(ans)
    
}

func sort(arr: inout [Int]) {
    var i = 0
    while i < arr.count {
        let correctIndex = arr[i] - 1
        if arr[i] != arr[correctIndex] {
            swap(arr: &arr, first: i, second: correctIndex)
        } else {
            i += 1
        }
    }
    print(nums)
}

func swap(arr: inout [Int], first: Int, second: Int) {
    var temp = arr[first]
    arr[first] = arr[second]
    arr[second] = temp
}

var nums = [1, 1]//[4, 3, 2, 7, 8, 3, 2, 1]
findDisappearedNumbers(arr: &nums)
