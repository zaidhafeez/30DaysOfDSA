import UIKit

func findMinAndMax(arr: [Int]) {
    var min = arr.first!
    var max = arr.first!
    
    for index in 1..<arr.count {
        if min > arr[index] {
            min = arr[index]
        } else if max < arr[index] {
            max = arr[index]
        }
    }
    print("minimum element is \(min) and maximum element is \(max)")
}

findMinAndMax(arr: [3, 2, 1, 56, 10000, 167])
