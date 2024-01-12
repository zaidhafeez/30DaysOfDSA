import UIKit

// Kadane's Algorithm
/// 3 steps to solve
/// 1. initialize sum with 0 and every pass add arr[current pass]
/// 2. initialize max with first element of array and every pass update max with prev. sum
/// 3. if sum is negative then set to zero
/// result or answer will be return the max.

func maxSubArray(arr: inout [Int]) {
    var sum = 0
    var maximum = arr[0]
    for i in arr.indices {
        sum += arr[i]
        maximum = maxi(first: sum, second: maximum)
        if sum < 0 {
            sum = 0
        }
    }
    print(maximum)
}

func maxi(first: Int, second: Int) -> Int {
    return first > second ? first : second
}

var nums = [5,4,-1,7,8]//[-2,1,-3,4,-1,2,1,-5,4]
maxSubArray(arr: &nums)

///Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle. In future will try to solve this.

