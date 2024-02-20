//
//  ViewController.swift
//  DSAPractice
//
//  Created by Mohammad Zaid on 24/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        var arr = [3, 2, 1, 56, 10000, 167]
//        var arr = [3, 1, 5, 4, 2]
//        var arr = (1...10000).map { _ in
//            return Int.random(in: 1...10000)
//        }
        var arr = [-5, 7, -3, -4, 9, 10, -1, 11]//[1, -1, 3, 2, -7, -5, 11, 6]//[1,1] //[4,3,2,7,8,2,3,1]//[4,0,2,1]//[9,6,4,2,3,5,7,0,1]//[0,1]//[3,0,1]//[3, 5, 2, 1, 4]//[0, 1, 0]//[0, 2, 1, 2, 0] //[7, 10, 4, 20, 15] //[7, 10, 4, 3, 20, 15]//[2, 3, 4, 9]
//        var arr = [1, 2, 3, 4]
//        var arr = [4, 5, 1, 2, 3]
//        var arr = [2, -32, 0, 78, 1]
        print(segregateElements(arr: &arr))
//        print("Original Array \(arr)")
//        insertionSort(arr: &arr)
//        sort012(arr: &arr)
//        cyclicSort(arr: &arr)
//        print("After Sorting Array \(arr)")
//        print(kthSmallest(arr: &arr, k: 4))
//        let value = getMaxMin(arr: &arr)
//        print("The max value \(value.0) and min value is \(value.1)")
        
//        reverseArray(start: 0, end: arr.count - 1, arr: &arr)
//        print("After Reverse Array \(arr)")
//        reverseArray(arr: arr)
//        getMinMax(arr: &arr)
//        print("before sorting \(arr)")
//        var startTime = CACurrentMediaTime()
//        bubbleSort(arr: &arr)
//        print("Execution Done In Time: - \(CACurrentMediaTime() - startTime)")
//        print("after sorting \(arr)")
    }
    

//MARK: - Reverse Array
    //Non - In Place Method
    func reverseArray<T: Numeric>(arr: [T]) {
        //Non in place
        var extraArray: [T] = Array(repeating: 0, count: arr.count)
        var i = 0
        var lastIndex = arr.count - 1
        while lastIndex >= 0 {
            print("lastIndex \(lastIndex)")
            print("i \(i)")
            print("extraArray at index \(i) and value \(extraArray[i] )")
            print("arr[lastIndex] at index \(lastIndex) and value \(arr[lastIndex] )")

            extraArray[i] = arr[lastIndex]
            print("BP")
            lastIndex -= 1
            i += 1
        }
        print("extraArray \(extraArray)")
    }
    
    // In place
    func reverseArray(arr: inout [Int]) {
        var start = 0
        var end = arr.count - 1
        while(start < end) {
            swap(arr: &arr, first: start, second: end)
            start += 1
            end -= 1
        }
        label.text = arr.description
        print(arr)
    }
    
    //Recursive way
    func reverseArray(start: Int, end: Int, arr: inout [Int]) {
        if start >= end {
            return
        }
        swap(arr: &arr, first: start, second: end)
        return reverseArray(start: start + 1, end: end - 1, arr: &arr)
    }
    
    private func swap(arr: inout [Int], first: Int, second: Int) {
        let temp = arr[first]
        arr[first] = arr[second]
        arr[second] = temp
    }
    
    var label: UILabel {
        var label = UILabel()
        self.view.addSubview(label)
        return label
    }
 
//MARK: - GET MIN AND MAX
    func getMinMax(arr: inout [Int]) -> (Int, Int) {
        var max = arr.first!
        var min = arr.first!
        for i in arr.indices {
            if arr[i] > max {
                max = arr[i]
            } else if arr[i] < min {
                min = arr[i]
            }
        }
        return (max, min)
    }
    
    func getMaxMin(arr: inout [Int]) -> (Int, Int) {
        var max = arr.first!
        var min = arr.first!
        for (index, element) in arr.enumerated() {
            print("index \(index) and element \(element)")
            if element > max {
                max = element
            } else if element < min {
                min = element
            }
//            if arr[i] > max {
//                max = arr[i]
//            } else if arr[i] < min {
//                min = arr[i]
//            }
        }
        return (max, min)
    }

//MARK: - Bubble Sort
    
    func bubbleSort(arr: inout [Int]) {
        for i in arr.indices {
            var isSwapping = false
            for j in 1..<arr.count - i {
                if arr[j] < arr[j - 1] {
                    isSwapping = true
                    swap(arr: &arr, first: j, second: j - 1)
                }
            }
            if !isSwapping {
                break
            }
        }
    }
    
    //MARK: - Selection Sort
    
    func selectionSort(arr: inout [Int]) {
        //first find the maxIndex and swap with the remaining elements
        for i in arr.indices {
            let lastIndex = arr.count - i - 1
            let maxIndex = getMaxIndex(arr: &arr, start: 0, end: lastIndex)
            swap(arr: &arr, first: maxIndex, second: lastIndex)
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
    
    //MARK: - Insertion Sort
    func insertionSort(arr: inout [Int]) {
        for i in 0...arr.count-2 {
            var j = i + 1
            while(j > 0) {
                if arr[j - 1] > arr[j] {
                    swap(arr: &arr, first: j - 1, second: j)
                    j -= 1
                } else {
                    break
                }
            }
        }
    }
    //MARK: - Find Max and Min
    /// https://www.enjoyalgorithms.com/blog/find-the-kth-smallest-element-in-an-array/
    /// There are More ways to solve the problem and i have solved by using brute-force approach
    /// Explore the link.
    func kthSmallest (arr: inout [Int], k: Int) -> Int {
        for i in 0...arr.count - 2 {
            for j in stride(from: i+1, to: 0, by: -1) {
                if arr[j] < arr[j - 1] {
                    swap(arr: &arr, first: j, second: j-1)
                } else {
                    break
                }
            }
        }
        return arr[k-1]
    }
    
    //MARK: - [Dutch National Flag Problem] Sort 0s, 1s and 2s from the array
    /// https://www.enjoyalgorithms.com/blog/sort-an-array-of-0s-1s-and-2s/
    /// It's called because there is three colors in the falg and placed it together if it's rearranged
    func sort012(arr: inout [Int]) {
        var count0s = 0, count1s = 0, count2s = 0
        var j = 0
        for i in arr.indices {
            if arr[i] == 0 {
                count0s += 1
            }
            if arr[i] == 1 {
                count1s += 1
            }
            if arr[i] == 0 {
                count2s += 1
            }
        }
        while(count0s > 0 && j < arr.count) {
            arr[j] = 0
            j += 1
            count0s -= 1
        }
        while(count1s > 0 && j < arr.count) {
            arr[j] = 1
            j += 1
            count1s -= 1
        }
        while(count2s > 0 && j < arr.count) {
            arr[j] = 2
            j += 1
            count2s -= 1
        }
    }
    
   //MARK: - Cyclic Sort
    func cyclicSort(arr: inout [Int]) {
        var i = 0
        while i < arr.count {
            var correctIndex = arr[i] - 1
            if arr[i] != arr[correctIndex] {
                swap(arr: &arr, first: i, second: correctIndex)
            } else {
                i += 1
            }
        }
    }
    //MARK: - Find Missing Number
    func missingNumber(arr: inout [Int]) -> Int {
        var i = 0
        while i < arr.count {
            let correctIndex = arr[i]
            // arr[i] < arr.count this check is for then when there is a number but not index is present
            // for e.g. [4, 0, 2, 1]]
            if arr[i] < arr.count && arr[i] != arr[correctIndex] {
                swap(arr: &arr, first: i, second: correctIndex)
            } else {
                i += 1
            }
        }
        for index in arr.indices {
            // if every element is not at correct Position in an array
            if arr[index] != index {
                return index
            }
        }
        // case 2:- // if every element is at correct Position
        return arr.count
    }
    
    //MARK: - Find All Numbers Disappeared in an Array
    func findDisappearedNumbers(arr: inout [Int]) -> [Int] {
        var i = 0
        var result = [Int]()
        while i < arr.count {
            let correctIndex = arr[i] - 1
            if arr[i] != arr[correctIndex] {
                swap(arr: &arr, first: i, second: correctIndex)
            } else {
                i += 1
            }
        }
        
        for i in arr.indices {
            if arr[i] != i + 1 {
                result.append(i+1)
            }
        }
        return result
    }
    
    //MARK: - Move all negative elements to end
    /// this can be done in one single loop too but on that case order is not preserved.
    /// link for single loop
    ///https://github.com/zaidhafeez/30DaysOfDSA/blob/main/2024/450DSA/Array/Negative%20Numbers/NegativeNumbers.playground/Contents.swift
    func segregateElements(arr: inout [Int]) -> [Int] {
        var results = [Int]()
        var i = 0
        while i < arr.count {
            if arr[i] > 0 {
                results.append(arr[i])
            }
            i += 1
        }
        i = 0
        while i < arr.count {
            if arr[i] < 0 {
                results.append(arr[i])
            }
            i += 1
        }
        return results
    }
}

