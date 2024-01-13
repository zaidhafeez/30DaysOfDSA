import UIKit

func getMinDiff(arr: inout [Int], k: Int) -> Int {
    arr.sort()
    var ans  = arr[arr.count - 1] - arr[0]
    var smallest = arr[0] + k
    var largest = arr[arr.count - 1] - k
    var minimum = 0, maximum = 0
    for i in 0..<arr.count - 1 {
        minimum = min(smallest, arr[i + 1] - k) // here we trying to minimize the next element
        maximum = max(largest, arr[i] + k) // here we trying to maximize the element and update it accordingly
        if(minimum < 0){
            continue;
        }
        ans = min(ans, maximum - minimum)
    }
    
    return ans
}

var nums = [2 ,6 ,3, 4, 7, 2, 10, 3, 2, 1]// [1, 15, 10] //[1, 10, 15]
var kth = 6
print(getMinDiff(arr: &nums, k: kth))
