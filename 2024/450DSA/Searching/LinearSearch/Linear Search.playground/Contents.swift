import UIKit


// MARK: - Linear Search
// Simple For-Loop
//https://www.youtube.com/watch?v=_HRA37X8N_Q&list=PL9gnSGHSqcnr_DxHsP7AW9ftq0AtAyYqJ&index=13&ab_channel=KunalKushwaha
func linearSearch(arr: [Int], target: Int) -> Int {
    
    if arr.isEmpty {
        return -1
    }
    
    for index in arr.indices {
        let element = arr[index]
        if element == target {
            return index
        }
    }
    
    return -1
}

// Enhanced For-Loop
func linearSearch2(arr: [Int], target: Int) -> Int {
    
    if arr.isEmpty {
        return Int.max
    }
    
    for element in arr {
        
        if element == target {
            return element
        }
    }
    
    return Int.max
}

//Linear Search In the form for boolean
func linearSearch3(arr: [Int], target: Int) -> Bool {
    
    if arr.isEmpty {
        return false
    }
    
    for element in arr {
        
        if element == target {
            return true
        }
    }
    
    return false
}

let arr = [12, 34, 8, 13, 1]
let target =  5//34
let result = linearSearch(arr: arr, target: target)
let result2 = linearSearch2(arr: arr, target: target)
let result3 = linearSearch3(arr: arr, target: target)
print(result)
print(result2)
print(result3)
