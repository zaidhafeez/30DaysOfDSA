import UIKit


// link:- https://www.enjoyalgorithms.com/blog/sort-an-array-of-0s-1s-and-2s
func sort012(arr: inout [Int]) {
    
    var countZeros: Int = 0, countOnes: Int = 0, countTwos: Int = 0
    for i in arr.indices {
        if arr[i] == 0 {countZeros += 1}
        if arr[i] == 1 {countOnes += 1}
        if arr[i] == 2 {countTwos += 1}
    }
    
    print(countZeros)
    print(countOnes)
    print(countTwos)
    
    var i = 0
    while countZeros > 0 {
       arr[i] = 0
       i += 1
       countZeros -= 1
    }
    while countOnes > 0 {
        arr[i] = 1
        i += 1
        countOnes -= 1
    }
    while countTwos > 0 {
        arr[i] = 2
        i += 1
        countTwos -= 1
    }
    
    print(arr)
}

var array = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]// [0, 1, 2, 0, 1, 2]
sort012(arr: &array) //[0,0,1,1,2,2]
