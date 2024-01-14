import UIKit

//https://www.geeksforgeeks.org/problems/minimum-number-of-jumps-1587115620/1
//Solution Guide:- https://www.enjoyalgorithms.com/blog/minimum-number-of-jumps-to-reach-end/
func minJumps(arr: inout [Int], size: Int) -> Int {
    if size <= 1 {
        return 0
    }
    
    var currStart = 0, currEnd = 0, jump = 0
    var currMaxReach = -1
    
    while(currStart < size - 1) {
        
        currMaxReach = max(currMaxReach, currStart + arr[currStart])
        if currMaxReach >= size - 1 {
            jump += 1
            break
        }
        if currStart == currEnd {
            jump += 1
            currEnd = currMaxReach
        }
        currStart += 1
    }
    return jump
}

var arr = [1, 4, 3, 2, 6, 7]//[1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
let n = arr.count
print(minJumps(arr: &arr, size: n))
