import UIKit

var arr: [Int] = [7,9,2,5,6,1]

func mergeSort(_ arr: [Int]) -> [Int] {
    var center = arr.count / 2
    var left = Array(arr[0..<center])
    var right = Array(arr[center..<arr.count])
    
    print(left)
    print(right)
    
    func merge(left: [Int], right: [Int]) -> [Int] {
        var left = left
        var right = right
        var reult: [Int] = []
        
        
        
    }
    
    return merge(left: mergeSort(left), right: mergeSort(right))
}

mergeSort(arr)
