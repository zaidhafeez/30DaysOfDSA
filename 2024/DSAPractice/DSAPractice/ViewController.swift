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
        var arr = [3, 2, 1, 56, 10000, 167]
        print(getMinMax(arr: &arr))
        // Do any additional setup after loading the view.
    }
    
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


}

