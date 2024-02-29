//
//  ViewController.swift
//  DSAPractice
//
//  Created by Mohammad Zaid on 24/01/24.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        var arr = [3, 2, 1, 56, 10000, 167]
//        var arr = [3, 1, 5, 4, 2]
//        var arr = (1...10000).map { _ in
//            return Int.random(in: 1...10000)
//        }
        var arr = [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9] //[1, 4, 3, 2, 6, 7]//[-18, -12, -4, 0, 2, 3, 4, 15, 16, 18, 22, 45, 89]//[3, 9, 12, 16, 20]//[1, 5, 8, 10]// [[2,8,7],[7,1,3],[1,9,5]]//[[1,5],[7,3],[3,5]]//[[1,2,3],[3,2,1]]//[12,345,2,6,7896]//[[23, 4, 1], [18, 12, 3, 9], [78, 99, 34, 56], [18, 12]]//[5,4,-7,7,8]
//        arr.sort(by: >) // descending order
//        let target = 22
        print(optimizedFindMinJumps(arr: arr))
        // [-2,1,-3,4,-1,2,1,-5,4]//[3,4,-1,1]//[7,8,9,11,12]//[8,7,3,5,3,6,1,4]//[1,2,2,4]//[4,3,2,7,8,2,3,1]//[3,1,3,4,2] //[1,3,4,2,2]//[-5, 7, -3, -4, 9, 10, -1, 11]//[1, -1, 3, 2, -7, -5, 11, 6]//[1,1] //[4,3,2,7,8,2,3,1]//[4,0,2,1]//[9,6,4,2,3,5,7,0,1]//[0,1]//[3,0,1]//[3, 5, 2, 1, 4]//[0, 1, 0]//[0, 2, 1, 2, 0] //[7, 10, 4, 20, 15] //[7, 10, 4, 3, 20, 15]//[2, 3, 4, 9]
//        var arr = [1, 2, 3, 4]
//        var arr = [4, 5, 1, 2, 3]
//        var arr = [2, -32, 0, 78, 1]
//        var arr1 = [85, 25, 1, 32, 54, 6] //[1, 2, 3, 4, 5]
//        var arr2 = [85, 2]
//        var start = 1
//        print(searchInTheRange(arr: arr, start: &start, end: 2, target: 4))
//        print(doUnion(arr1: arr1, arr2: arr2))
//        print(search(str: "Zaid", target: "z"))
//        print("Original Array \(arr)")
//        rotateArray(arr: &arr)
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
    
//MARK: - Find the Duplicate Number
    func findDuplicate(arr: inout [Int]) -> Int {
        var i = 0
        var duplicateNumber = 0
        while (i < arr.count) {
            //First Way
//            let correctIndex = arr[i] - 1
//            if arr[i] != arr[correctIndex] {
//                swap(arr: &arr, first: i, second: correctIndex)
//            } else {
//                i += 1
//            }
            // second logic
            /// we added a extra check first check that element is at it's correct Index or not
            /// if not then check element and it's value on correctIndex or not if not then swap. If already element and the value is on correct index is same that's means flow will go on else part that will be your duplicate number.
            /// for e.g., [1, 3, 4, 2,2]
            if arr[i] != i + 1 {
                let correctIndex = arr[i] - 1
                if arr[i] != arr[correctIndex] {
                    swap(arr: &arr, first: i, second: correctIndex)
                } else {
                    return arr[i]
                }
            } else {
                i += 1
            }
        }
        // Run for first logic
//        for i in arr.indices {
//            if arr[i] != i + 1 {
//                duplicateNumber = arr[i]
//            }
//        }
        return duplicateNumber
    }
    
    //MARK: - Find All Duplicates in an Array
    ///https://leetcode.com/problems/find-all-duplicates-in-an-array/solutions/775775/duplicates-in-an-array/
    func findDuplicates(arr: inout [Int]) -> [Int] {
        var i = 0
        var duplicateNumbers = [Int]()
        while (i < arr.count) {
            let correctIndex = arr[i] - 1
            if arr[i] != arr[correctIndex] {
                swap(arr: &arr, first: i, second: correctIndex)
            } else {
                i += 1
            }
        }
        for i in arr.indices {
            if arr[i] != i + 1 {
                duplicateNumbers.append(arr[i])
            }
        }
        return duplicateNumbers
    }
    
    // MARK: - Set Mismatch
    func findErrorNums(arr: inout [Int]) -> [Int] {
        var i = 0
        var errorNums = [Int]()
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
                errorNums.append(arr[i])
                errorNums.append(i + 1)
            }
        }
        return errorNums
    }
    
    // MARK: - First Missing Positive
    func firstMissingPositive(arr: inout [Int]) -> Int {
        // key points:-
        // Ignores are negative becauste ask positive
        // Ignores the number which is greater than size of Array for example [7, 8, 9, 10, 11]
        ///Idea : start searching that 1 is exist in arry similarly for 2, code is same as missing number
        var i = 0;
        while i < arr.count {
            let correctIndex = arr[i] - 1
            if arr[i] > 0 && arr[i] <= arr.count && arr[i] != arr[correctIndex] {
                swap(arr: &arr, first: i, second: correctIndex)
            } else {
                i += 1
            }
        }
        for i in arr.indices {
            if arr[i] != i + 1 {
                return i + 1
            }
        }
        return arr.count + 1
    }
    
    // MARK: - Union of Two Arrays
    func doUnion(arr1: [Int], arr2: [Int]) -> Int {
        //Set properties
        ///https://www.geeksforgeeks.org/find-union-and-intersection-of-two-unsorted-arrays/
        ///The most common approach (looping and adding individual elements) has a time complexity of O(m).
        ///Creating a new set from the combined elements might have a complexity of O(n + m) or O(m) depending on the implementation.
        var set = Set<Int>()
        for item in arr1 {
            set.insert(item)
        }
        for item in arr2 {
            set.insert(item)
        }
        return set.count
    }
    
    // MARK: - Rotate Array
    func rotateArray(arr: inout [Int]) {
        // rotate the array by one position in clock-wise direction.
        ///https://medium.com/swift-coding/rotate-arrays-in-swift-7f223007ad6f
        let lastIndex = arr.count - 1
        for index in arr.indices {
            swap(arr: &arr, first: index, second: lastIndex)
        }
    }
    
    // MARK: - Search Character in the String
    func search(str: String, target: Character) -> Bool {
        for char in str {
            if char.lowercased() == target.lowercased() {
                return true
            }
        }
        return false
    }
    
    // MARK: - Kadane's Algorithm
    ///https://www.youtube.com/watch?v=w4W6yya1PIc&ab_channel=CodeHelp-byBabbar
    ///https://enjoyalgorithms.com/blog/maximum-subarray-sum/
    ///subArray = "contiguas array
    ///
    ///attached notes of 23rdFeb23k
    ///Steps:
    ///1. Initialize sum = 0 and maximum = firstElement of Array if there is atleast one element and it's positive
    ///2. update maximum max(maximum, sum
    ///3. if sum < 0; sum = 0
    func findLargestSum(arr: [Int]) -> Int {
        var sum = 0
        var maximum = arr[0]
        for index in arr.indices {
            sum += arr[index]
            maximum = max(sum, maximum)
            if sum < 0 {
                sum = 0
            }
        }
        return maximum
    }
    
    // MARK: - Search Character in the Range
    func searchInTheRange(arr: [Int], start: inout Int, end: Int, target: Int) -> Bool {
        if arr.isEmpty {
            return false
        }
        while start <= end {
            if arr[start] == target {
                return true
            }
            start += 1
        }
        return false
    }
    
    // MARK: - Find Minimum in the array
    // Assume is not an array
    func min(arr: [Int]) -> Int {
        var min = arr[0]
        for index in arr.indices {
            if arr[index] < min {
                min = arr[index]
            }
        }
        return min
    }
    
    // MARK: - Search In 2-D Arrays
    // Linear Search
    func searchIn2D(arr: [[Int]], target: Int) -> [Int] {
        var ans = [Int]()
        for (row, columns) in arr.enumerated() {
            for col in columns.indices {
                if arr[row][col] == target {
                    ans = [row, col]
                }
            }
        }
        return ans
    }
    
    // MARK: - [Linear Search] Find Max In 2-D Arrays
    // Linear Search
    func findMaxIn2D(arr: [[Int]]) -> Int {
        var max = Int.min
        for columns in arr {
            for col in columns {
                if col > max {
                    max = col
                }
            }
        }
        return max
    }
    
    // MARK: - [Linear Search] Find Numbers with Even Number of Digits
    ///https://leetcode.com/problems/find-numbers-with-even-number-of-digits/description/
    func findNumbers(arr: [Int]) -> Int {
        var count = 0
        for number in arr {
            if even(number) {
                count += 1
            }
        }
        return count
    }
    
    // check whether numbes has evendigits or not
    func even(_ number: Int) -> Bool {
        let numberOfDigits = digits2(number: number)
        return numberOfDigits.isMultiple(of: 2)
    }
    
    // Find Digits from a number
    func digits(number: Int) -> Int {
        var num = number
        var count = 0
        if num == 0 {
            return 1
        }
        if num < 0 {
            num *= -1
        }
        while num > 0 {
            count += 1
            num /= 10
        }
        return count
    }
    
    // Find Digits from a number
    // Optimized Way
    func digits2(number: Int) -> Int {
        var num = number
        if num == 0 {
            return 1
        }
        if num < 0 {
            num *= -1
        }
        return Int(log10(CGFloat(number))) + 1
    }
    
    // MARK: - [Linear Search] Find Max In 2-D Arrays
    ///https://www.youtube.com/watch?v=_HRA37X8N_Q
    ///Richest Customer Wealth https://leetcode.com/problems/richest-customer-wealth/description/
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var sums = [Int]()
        var sum = 0
        for columns in accounts {
            for account in columns {
                sum += account
            }
            sums.append(sum)
            sum = 0
        }
        return getMax(arr: sums)
    }
    
    func maximumWealthOptimized(_ accounts: [[Int]]) -> Int {
        var max = Int.min
        for columns in accounts {
            var sum = 0
            for account in columns {
                sum += account
            }
            if sum > max {
                max = sum
            }
        }
        return max
    }
    
    //MARK: - Get Maximum Element from the array
    func getMax(arr: [Int]) -> Int {
        var max = Int.min
        for item in arr {
            if item > max {
                max = item
            }
        }
        return max
    }
    
    //MARK: - Binary Search
    /// for binary serach we always use sorted array
    ///time complexity O(logbase2N)
    ///we find the element and return the index
    ///if start > end then we can easily say that element is not found.
    ///[-18, -12, -4, 0, 2, 3, 4, 15, 16, 18, 22, 45, 89]
    func binarySearch(arr: [Int], target: Int) -> Int {
        var start = 0
        var end = arr.count - 1
        while start <= end {
            //var mid = (start + end) / 2 // we do not use this method because Integer max value get exceed so
            let mid = start + (end - start) / 2
            if target < arr[mid] {
                end  = mid - 1
            } else if target > arr[mid] {
                start = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
    
    //MARK: - Minimize the Height - I
    ///[Questions] https://www.geeksforgeeks.org/problems/minimize-the-heights3351/1
    ///[Solution]https://www.youtube.com/watch?v=tSLiZAQG9NM
    func findMinDiff(arrr: [Int], k: Int) -> Int {
        var arr = arrr
        arr.sort()
        var maximum = arr.last!
        var minimum = arr.first!
        var result = maximum - minimum
        for index in 1..<arr.count {
            maximum = max(arr[index - 1] + k, arr.last! - k)
            minimum = Swift.min(arr[index] - k, arr.first! + k)
            result = Swift.min(result, maximum - minimum)
        }
        return result
    }
    
    // MARK: - Order-Agnostic Binary Search
    func orderAgnosticBS(arr: [Int], target: Int) -> Int {
        var start = 0
        var end = arr.count - 1
        var isAsc = arr[start] < arr[end]
        while start <= end {
            var mid = start + (end - start) / 2
            if target == arr[mid] {
                return mid
            }
            if isAsc {
                if target < arr[mid] {
                    ///left-side of array
                    end = mid - 1
                } else {
                    ///right-side of array
                    start = mid + 1
                }
            } else {
                if target > arr[mid] {
                    ///right-side of array
                    end = mid - 1
                } else {
                    ///left-side of array
                    start = mid + 1
                }
            }
        }
        return -1
    }
    // MARK: - Minimum Jumps
    ///[Ques]:- https://www.geeksforgeeks.org/problems/minimum-number-of-jumps-1587115620/1
    ///Soln:- https://www.enjoyalgorithms.com/blog/minimum-number-of-jumps-to-reach-end
    func findMinJumps(arr: [Int]) -> Int {
        var currStart = 0, currEnd = 0, currMaxReach = -1
        var jump = 0
        let size = arr.count
        
        if size <= 1 {
            return 0
        }
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
    
    // MARK: - Optimized Minm Jumps
    ///https://www.youtube.com/watch?v=9kyHYVxL4fw
    ///[1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
    func optimizedFindMinJumps(arr: [Int]) -> Int {
        var coverage = 0 //farthest
        var destn = arr.count - 1
        var totalJumps = 0
        var lastIndex = 0
        for i in arr.indices {
            coverage = max(coverage, i + arr[i]) //farthest i can go
            if i == lastIndex { // It will tell you that you reach the last index in window
                lastIndex = coverage
                totalJumps += 1
                if coverage >= destn {
                    return totalJumps
                }
            }
        }
        return totalJumps
    }
}

