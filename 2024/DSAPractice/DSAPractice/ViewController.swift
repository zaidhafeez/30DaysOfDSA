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
        var arr = [2, 3, 4, 9]
//        var arr = [1, 2, 3, 4]
//        var arr = [4, 5, 1, 2, 3]
//        var arr = [2, -32, 0, 78, 1]

        print("Original Array \(arr)")
        insertionSort(arr: &arr)
        print("After Sorting Array \(arr)")
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
}

