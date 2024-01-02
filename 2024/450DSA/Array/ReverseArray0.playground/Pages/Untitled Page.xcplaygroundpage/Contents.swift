import UIKit

func reverseArray<T>(arr: [T]) {
    var startIndex = 0
    var lastIndex = arr.count - 1
    var array = arr
    var value = arr[startIndex]
    if !arr.isEmpty {
        while (startIndex < lastIndex) {
            value = arr[startIndex]
            array[startIndex] = arr[lastIndex]
            array[lastIndex] = value
            startIndex += 1
            lastIndex -= 1
        }
    }
    print(array)
}

let arrayOfNumbers = [1,2,3,6,7]
let arrayOfString = ["Lavneesh", "Zaid", "Jaggi", "Hafeez"]
reverseArray(arr: arrayOfString)
