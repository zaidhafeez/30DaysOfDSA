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
//        getMinMax(arr: &arr)
//        print("before sorting \(arr)")
        var startTime = CACurrentMediaTime()
        bubbleSort(arr: &arr)
        print("Execution Done In Time: - \(CACurrentMediaTime() - startTime)")
//        print("after sorting \(arr)")
    }
    

//MARK: - Reverse Array
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

}

